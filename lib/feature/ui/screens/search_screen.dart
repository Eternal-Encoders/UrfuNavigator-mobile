// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/common/institute_colors.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/search/search_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institutes_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/audiences_cached_list.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/error_message.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/loading_indicator.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class SearchScreen extends StatefulWidget {
  final bool autofocus;
  final String? textFromRoute;
  final SharedPreferences sharedPreferences;
  SearchScreen(
    Key? key, {
    required this.autofocus,
    required this.textFromRoute,
    required this.sharedPreferences,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isActive = false;
  SearchList cachedSearchList = SearchList(searchs: List.empty(growable: true));
  SearchList cachedAndRemoteSearchList =
      SearchList(searchs: List.empty(growable: true));
  late List<String>? cachedListData;

  @override
  void initState() {
    super.initState();
    isActive = true;

    cachedListData =
        widget.sharedPreferences.getStringList(Constants.CACHED_SEARCH_LIST);

    if (cachedListData != null) {
      var decodedData =
          cachedListData!.map((item) => jsonDecode(item)).toList();
      cachedSearchList = SearchList.fromJson(decodedData);
    }

    log('widget.textFromRoute: ${widget.textFromRoute}');
    if (widget.textFromRoute != null) {
      _searchController.text = widget.textFromRoute!;
    }

    context.read<SearchBloc>().add(
          SearchEvent.fetch(
            length: '20',
            name:
                _searchController.text.isEmpty ? 'Р-' : _searchController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var state = context.watch<SearchBloc>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.mainWhiteLight,
            borderRadius: BorderRadius.all(Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 3,
                // offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            onChanged: (String value) {
              print('value: $value');
              context.read<SearchBloc>().add(
                    SearchEvent.fetch(
                      length: '6',
                      name: value.isEmpty ? 'Р-' : value,
                    ),
                  );
            },
            autofocus: widget.autofocus,
            readOnly: false,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.accentGray,
            cursorErrorColor: AppColors.accentGray,
            cursorWidth: 2,
            cursorHeight: 20,
            controller: _searchController,
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Поиск аудиторий и мест',
              hintStyle: TextStyle(fontSize: 12, color: AppColors.accentGray),
              suffixIcon: Tooltip(
                message: 'Profile',
                child: IconButton(
                  onPressed: () {
                    _searchController.clear();
                  },
                  icon: const Icon(
                    size: 24,
                    Icons.clear,
                  ),
                ),
              ),
              prefixIcon: Tooltip(
                message: 'Search',
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    size: 24,
                    Icons.arrow_back,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Недавние',
          style: TextStyle(
              color: AppColors.accentGrayDark,
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w500),
          maxLines: 1,
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: Column(
            children: [
              isActive
                  ? state.when(
                      loading: () => Expanded(
                            child: Column(
                              children: [
                                (cachedSearchList.searchs!.isNotEmpty)
                                    ? AudiencesCachedList(
                                        cachedSearchList:
                                            cachedSearchList.copyWith(),
                                        screenSize: screenSize,
                                        searchController: _searchController)
                                    : Container(),
                                DefaultLoadingIndicator(),
                              ],
                            ),
                          ),
                      error: () => Expanded(
                            child: Column(
                              children: [
                                (cachedSearchList.searchs!.isNotEmpty)
                                    ? AudiencesCachedList(
                                        cachedSearchList:
                                            cachedSearchList.copyWith(),
                                        screenSize: screenSize,
                                        searchController: _searchController)
                                    : Container(),
                                DefaultErrorMessage(),
                              ],
                            ),
                          ),
                      loaded: (SearchList searchLoaded) {
                        cachedAndRemoteSearchList = cachedSearchList.copyWith();
                        if (cachedAndRemoteSearchList.searchs!.length > 5) {
                          cachedAndRemoteSearchList.searchs!.removeRange(
                              5, cachedAndRemoteSearchList.searchs!.length);
                        }
                        WidgetsBinding.instance
                            .addPostFrameCallback((Duration timeStamp) {
                          context
                              .read<SearchModel>()
                              .changeSearch(searchLoaded);
                        });
                        for (var element in searchLoaded.searchs!) {
                          if (!cachedAndRemoteSearchList.searchs!
                              .contains((element))) {
                            cachedAndRemoteSearchList.searchs!.add(element);
                          }
                        }

                        return Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount:
                                cachedAndRemoteSearchList.searchs!.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: switch (
                                                  cachedAndRemoteSearchList
                                                      .searchs![index]
                                                      .institute) {
                                                'ИРИТ-РТФ' => InstituteColors
                                                    .iritrtfOutside,
                                                'ГУК' =>
                                                  InstituteColors.gukOutside,
                                                'УРАЛЭНИН' => InstituteColors
                                                    .uraleninOutside,
                                                'ИСА' =>
                                                  InstituteColors.isaOutside,
                                                'ИНМИТ-ХТИ' =>
                                                  InstituteColors.inmitOutside,
                                                'УГИ' =>
                                                  InstituteColors.ugiOutside,
                                                _ => InstituteColors
                                                    .defaultOutside,
                                              },
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: switch (
                                                    cachedAndRemoteSearchList
                                                        .searchs![index]
                                                        .institute) {
                                                  'ИРИТ-РТФ' => InstituteColors
                                                      .iritrtfInside,
                                                  'ГУК' =>
                                                    InstituteColors.gukInside,
                                                  'УРАЛЭНИН' => InstituteColors
                                                      .uraleninInside,
                                                  'ИСА' =>
                                                    InstituteColors.isaInside,
                                                  'ИНМИТ-ХТИ' =>
                                                    InstituteColors.inmitInside,
                                                  'УГИ' =>
                                                    InstituteColors.ugiInside,
                                                  _ => InstituteColors
                                                      .defaultInside,
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    SizedBox(
                                      width: screenSize.width -
                                          72 -
                                          (cachedAndRemoteSearchList
                                                      .searchs![index]
                                                      .names!
                                                      .length >
                                                  1
                                              ? cachedAndRemoteSearchList
                                                          .searchs![index]
                                                          .names![1]
                                                          .length >
                                                      15
                                                  ? 100
                                                  : 50
                                              : 50),
                                      child: ListTile(
                                        title: Text(cachedAndRemoteSearchList
                                            .searchs![index].names![0]),
                                        onTap: () {
                                          if (context
                                                      .read<SearchModel>()
                                                      .calledByEvent ==
                                                  EEvent.fromRoute ||
                                              context
                                                      .read<SearchModel>()
                                                      .calledByEvent ==
                                                  EEvent.toRoute) {
                                            cachedListData ??= [];
                                            if (!cachedListData!.contains(
                                                json.encode(
                                                    cachedAndRemoteSearchList
                                                        .searchs![index]))) {
                                              cachedListData!.insert(
                                                  0,
                                                  (json.encode(
                                                      cachedAndRemoteSearchList
                                                          .searchs![index])));
                                              widget.sharedPreferences
                                                  .setStringList(
                                                      Constants
                                                          .CACHED_SEARCH_LIST,
                                                      cachedListData!);
                                            }
                                            if (cachedListData!.length > 10) {
                                              cachedListData!.removeAt(
                                                  cachedListData!.length - 1);
                                              widget.sharedPreferences
                                                  .setStringList(
                                                      Constants
                                                          .CACHED_SEARCH_LIST,
                                                      cachedListData!);
                                            }
                                            Navigator.pop(
                                              context,
                                              InstituteArguments(
                                                institute: context
                                                    .read<InstitutesModel>()
                                                    .institutes
                                                    .institutes!
                                                    .where((inst) =>
                                                        inst.name ==
                                                        cachedAndRemoteSearchList
                                                            .searchs![index]
                                                            .institute)
                                                    .first,
                                                search:
                                                    cachedAndRemoteSearchList
                                                        .searchs![index],
                                              ),
                                            );
                                          } else {
                                            context
                                                .read<SearchModel>()
                                                .changeEvent(EEvent.search);
                                            cachedListData ??= [];
                                            if (!cachedListData!.contains(
                                                json.encode(
                                                    cachedAndRemoteSearchList
                                                        .searchs![index]))) {
                                              cachedListData!.insert(
                                                  0,
                                                  (json.encode(
                                                      cachedAndRemoteSearchList
                                                          .searchs![index])));
                                              widget.sharedPreferences
                                                  .setStringList(
                                                      Constants
                                                          .CACHED_SEARCH_LIST,
                                                      cachedListData!);
                                            }
                                            if (cachedListData!.length > 10) {
                                              cachedListData!.removeAt(
                                                  cachedListData!.length - 1);
                                              widget.sharedPreferences
                                                  .setStringList(
                                                      Constants
                                                          .CACHED_SEARCH_LIST,
                                                      cachedListData!);
                                            }

                                            Navigator.pushReplacementNamed(
                                              context,
                                              RoutePaths.institute,
                                              arguments: InstituteArguments(
                                                  institute: context
                                                      .read<InstitutesModel>()
                                                      .institutes
                                                      .institutes!
                                                      .where((inst) =>
                                                          inst.name ==
                                                          cachedAndRemoteSearchList
                                                              .searchs![index]
                                                              .institute)
                                                      .first,
                                                  search:
                                                      cachedAndRemoteSearchList
                                                          .searchs![index]),
                                            );
                                          }
                                          log('Selected: ${cachedAndRemoteSearchList.searchs![index].names![0]}');
                                          context
                                              .read<SearchModel>()
                                              .changeSelectedQuery(
                                                  cachedAndRemoteSearchList
                                                      .searchs![index]
                                                      .names![0]);
                                          _searchController.text =
                                              cachedAndRemoteSearchList
                                                  .searchs![index].names![0];
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(cachedAndRemoteSearchList
                                              .searchs![index].institute!),
                                          Text(cachedAndRemoteSearchList
                                                      .searchs![index]
                                                      .names!
                                                      .length >
                                                  1
                                              ? cachedAndRemoteSearchList
                                                  .searchs![index].names![1]
                                              : ''),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                indent: 57,
                                endIndent: 16,
                                thickness: 0.3,
                                height: 1,
                              );
                            },
                          ),
                        );
                      })
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}

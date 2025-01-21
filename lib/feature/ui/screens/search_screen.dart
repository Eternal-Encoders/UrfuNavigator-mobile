// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/common/institute_colors.dart';
import 'package:urfu_navigator_mobile/common/text_styles.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/search/search_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institutes_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/arrow_back.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/audiences_cached_list.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/error_message.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/loading_indicator.dart';
import 'package:urfu_navigator_mobile/locator_service.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class SearchScreen extends StatefulWidget {
  final bool autofocus;
  final String? textFromRoute;
  SearchScreen(
    Key? key, {
    required this.autofocus,
    required this.textFromRoute,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isActive = false;
  bool isHideRecent = false;
  SearchList cachedSearchList = SearchList(searchs: List.empty(growable: true));
  SearchList cachedAndRemoteSearchList =
      SearchList(searchs: List.empty(growable: true));
  late List<String>? cachedListData;

  @override
  void initState() {
    super.initState();
    isActive = true;

    cachedListData =
        sl<SharedPreferences>().getStringList(Constants.CACHED_SEARCH_LIST);

    if (cachedListData != null) {
      var decodedData =
          cachedListData!.map((item) => jsonDecode(item)).toList();
      cachedSearchList = SearchList.fromJson(decodedData);
    }

    log('widget.textFromRoute: ${widget.textFromRoute}');
    if (widget.textFromRoute != null) {
      _searchController.text = widget.textFromRoute!;
      isHideRecent = true;
    } else {
      isHideRecent = false;
    }

    context.read<SearchBloc>().add(
          SearchEvent.fetch(
            length: Constants.FETCH_SEARCH_LENGTH,
            name: _searchController.text.isEmpty
                ? Constants.FETCH_SEARCH_INITIAL_NAME
                : _searchController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var state = context.watch<SearchBloc>().state;

    var searchListItems = state.when(
        loading: () => LoadingSearchListItemsWidget(
              cachedSearchList: cachedSearchList,
              screenSize: screenSize,
              searchController: _searchController,
              isHideRecent: isHideRecent,
            ),
        error: () => ErrorSearchListItemsWidget(
            cachedSearchList: cachedSearchList,
            screenSize: screenSize,
            searchController: _searchController),
        loaded: (SearchList searchLoaded) {
          if (isHideRecent) {
            cachedAndRemoteSearchList = searchLoaded;
          } else {
            cachedAndRemoteSearchList = cachedSearchList.copyWith();
          }
          if (cachedAndRemoteSearchList.searchs!.length >
              Constants.CACHED_COUNT_OF_AUDIENCES) {
            cachedAndRemoteSearchList.searchs!.removeRange(
                Constants.CACHED_COUNT_OF_AUDIENCES,
                cachedAndRemoteSearchList.searchs!.length);
          }
          WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
            context.read<SearchModel>().changeSearch(searchLoaded);
          });
          for (var element in searchLoaded.searchs!) {
            if (!cachedAndRemoteSearchList.searchs!.contains((element))) {
              cachedAndRemoteSearchList.searchs!.add(element);
            }
          }

          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: cachedAndRemoteSearchList.searchs!.length,
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
                                color: switch (cachedAndRemoteSearchList
                                    .searchs![index].institute) {
                                  'ИРИТ-РТФ' => InstituteColors.iritrtfOutside,
                                  'ГУК' => InstituteColors.gukOutside,
                                  'УРАЛЭНИН' => InstituteColors.uraleninOutside,
                                  'ИСА' => InstituteColors.isaOutside,
                                  'ИНМИТ-ХТИ' => InstituteColors.inmitOutside,
                                  'УГИ' => InstituteColors.ugiOutside,
                                  _ => InstituteColors.defaultOutside,
                                },
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: switch (cachedAndRemoteSearchList
                                      .searchs![index].institute) {
                                    'ИРИТ-РТФ' => InstituteColors.iritrtfInside,
                                    'ГУК' => InstituteColors.gukInside,
                                    'УРАЛЭНИН' =>
                                      InstituteColors.uraleninInside,
                                    'ИСА' => InstituteColors.isaInside,
                                    'ИНМИТ-ХТИ' => InstituteColors.inmitInside,
                                    'УГИ' => InstituteColors.ugiInside,
                                    _ => InstituteColors.defaultInside,
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
                        width: screenSize.width - 72 - 150,
                        child: ListTile(
                          title: Text(cachedAndRemoteSearchList
                              .searchs![index].names![0]),
                          onTap: () {
                            if (context.read<SearchModel>().calledByEvent ==
                                    EEvent.fromRoute ||
                                context.read<SearchModel>().calledByEvent ==
                                    EEvent.toRoute) {
                              cachedListData ??= [];
                              //if there is no same item
                              if (!cachedListData!.contains(json.encode(
                                  cachedAndRemoteSearchList.searchs![index]))) {
                                //add to cache data
                                cachedListData!.insert(
                                    0,
                                    (json.encode(cachedAndRemoteSearchList
                                        .searchs![index])));
                                sl<SharedPreferences>().setStringList(
                                    Constants.CACHED_SEARCH_LIST,
                                    cachedListData!);
                              }
                              deleteOldCachedData();
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
                                              .searchs![index].institute)
                                      .first,
                                  search:
                                      cachedAndRemoteSearchList.searchs![index],
                                ),
                              );
                            } else {
                              context
                                  .read<SearchModel>()
                                  .changeEvent(EEvent.search);
                              cachedListData ??= [];
                              if (!cachedListData!.contains(json.encode(
                                  cachedAndRemoteSearchList.searchs![index]))) {
                                cachedListData!.insert(
                                    0,
                                    (json.encode(cachedAndRemoteSearchList
                                        .searchs![index])));
                                sl<SharedPreferences>().setStringList(
                                    Constants.CACHED_SEARCH_LIST,
                                    cachedListData!);
                              }
                              if (cachedListData!.length > 10) {
                                cachedListData!
                                    .removeAt(cachedListData!.length - 1);
                                sl<SharedPreferences>().setStringList(
                                    Constants.CACHED_SEARCH_LIST,
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
                                                .searchs![index].institute)
                                        .first,
                                    search: cachedAndRemoteSearchList
                                        .searchs![index]),
                              );
                            }
                            log('Selected: ${cachedAndRemoteSearchList.searchs![index].names![0]}');
                            context.read<SearchModel>().changeSelectedQuery(
                                cachedAndRemoteSearchList
                                    .searchs![index].names![0]);
                            _searchController.text = cachedAndRemoteSearchList
                                .searchs![index].names![0];
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              cachedAndRemoteSearchList
                                  .searchs![index].institute!,
                              style: TextStyles.h5MedAccGray,
                            ),
                            Text(
                                cachedAndRemoteSearchList
                                            .searchs![index].names!.length >
                                        1
                                    ? cachedAndRemoteSearchList
                                        .searchs![index].names![1]
                                    : '',
                                style: TextStyles.h4MedAccGrayDark),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 57,
                  endIndent: 16,
                  thickness: 0.3,
                  height: 1,
                );
              },
            ),
          );
        });
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
              if (value.isNotEmpty) {
                isHideRecent = true;
              } else {
                isHideRecent = false;
              }

              print('value: $value');
              context.read<SearchBloc>().add(
                    SearchEvent.fetch(
                      length: Constants.FETCH_SEARCH_LENGTH_WHILE_TYPING,
                      name: value.isEmpty
                          ? Constants.FETCH_SEARCH_INITIAL_NAME
                          : value,
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
            style: TextStyles.h4MedAccGrayDark,
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: I18N(context).searchHint,
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
                child: ArrowBackWidget(),
              ),
            ),
          ),
        ),
        //Блок поиска item's
        isHideRecent
            ? Container()
            : Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    I18N(context).searchRecent,
                    style: TextStyle(
                        color: AppColors.accentGrayDark,
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                ],
              ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: Column(
            children: [
              isActive ? searchListItems : Container(),
            ],
          ),
        ),
      ],
    );
  }

  void deleteOldCachedData() {
    if (cachedListData!.length > 10) {
      cachedListData!.removeAt(cachedListData!.length - 1);
      sl<SharedPreferences>()
          .setStringList(Constants.CACHED_SEARCH_LIST, cachedListData!);
    }
  }
}

class ErrorSearchListItemsWidget extends StatelessWidget {
  const ErrorSearchListItemsWidget({
    super.key,
    required this.cachedSearchList,
    required this.screenSize,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final SearchList cachedSearchList;
  final Size screenSize;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          (cachedSearchList.searchs!.isNotEmpty)
              ? AudiencesCachedList(
                  cachedSearchList: cachedSearchList.copyWith(),
                  screenSize: screenSize,
                  searchController: _searchController)
              : Container(),
          DefaultErrorMessage(),
        ],
      ),
    );
  }
}

class LoadingSearchListItemsWidget extends StatelessWidget {
  const LoadingSearchListItemsWidget({
    super.key,
    required this.cachedSearchList,
    required this.screenSize,
    required TextEditingController searchController,
    required this.isHideRecent,
  }) : _searchController = searchController;

  final SearchList cachedSearchList;
  final Size screenSize;
  final TextEditingController _searchController;
  final bool isHideRecent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          (cachedSearchList.searchs!.isNotEmpty && !isHideRecent)
              ? AudiencesCachedList(
                  cachedSearchList: cachedSearchList.copyWith(),
                  screenSize: screenSize,
                  searchController: _searchController)
              : Container(),
          DefaultLoadingIndicator(),
        ],
      ),
    );
  }
}

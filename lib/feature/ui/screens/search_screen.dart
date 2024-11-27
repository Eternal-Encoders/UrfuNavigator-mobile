// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/common/institute_colors.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/search/search_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institutes_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/error_message.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/loading_indicator.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class SearchScreen extends StatefulWidget {
  final bool autofocus;
  SearchScreen(
    Key? key, {
    required this.autofocus,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    isActive = true;

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
    SearchModel searchState = Provider.of<SearchModel>(context, listen: false);
    InstitutesModel instModelState =
        Provider.of<InstitutesModel>(context, listen: false);
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
        isActive
            ? state.when(
                loading: () => DefaultLoadingIndicator(),
                error: () => DefaultErrorMessage(),
                loaded: (SearchList searchLoaded) {
                  WidgetsBinding.instance
                      .addPostFrameCallback((Duration timeStamp) {
                    searchState.changeSearch(searchLoaded);
                  });

                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: searchLoaded.searchs!.length,
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
                                              color: switch (searchLoaded
                                                  .searchs![index].institute) {
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
                                                color: switch (searchLoaded
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
                                      width: screenSize.width - 72,
                                      child: ListTile(
                                        title: Text(searchLoaded
                                            .searchs![index].names![0]),
                                        onTap: () {
                                          searchState
                                              .changeEvent(EEvent.search);
                                          Navigator.pushReplacementNamed(
                                            context,
                                            RoutePaths.institute,
                                            arguments: InstituteArguments(
                                                institute: instModelState
                                                    .institutes.institutes!
                                                    .where((inst) =>
                                                        inst.name ==
                                                        searchLoaded
                                                            .searchs![index]
                                                            .institute)
                                                    .first,
                                                coordinates: {
                                                  'x': searchLoaded
                                                      .searchs![index].x,
                                                  'y': searchLoaded
                                                      .searchs![index].y,
                                                  'floor': searchLoaded
                                                      .searchs![index].floor,
                                                }),
                                          );
                                          log('Selected: ${searchLoaded.searchs![index].names![0]}');
                                          searchState.changeSelectedQuery(
                                              searchLoaded
                                                  .searchs![index].names![0]);
                                          _searchController.text = searchLoaded
                                              .searchs![index].names![0];
                                        },
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
                        ),
                      ],
                    ),
                  );
                })
            : Container(),
      ],
    );
  }
}

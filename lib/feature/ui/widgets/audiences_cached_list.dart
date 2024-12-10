import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/common/institute_colors.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institutes_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class AudiencesCachedList extends StatelessWidget {
  const AudiencesCachedList({
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
    if (cachedSearchList.searchs!.length > 5) {
      cachedSearchList.searchs!
          .removeRange(5, cachedSearchList.searchs!.length);
    }
    return Expanded(
        child: ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: cachedSearchList.searchs!.length,
      itemBuilder: (BuildContext context, int index) {
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
                            cachedSearchList.searchs![index].institute) {
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
                          color: switch (
                              cachedSearchList.searchs![index].institute) {
                            'ИРИТ-РТФ' => InstituteColors.iritrtfInside,
                            'ГУК' => InstituteColors.gukInside,
                            'УРАЛЭНИН' => InstituteColors.uraleninInside,
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
                width: screenSize.width - 72,
                child: ListTile(
                  title: Text(cachedSearchList.searchs![index].names![0]),
                  onTap: () {
                    if (context.read<SearchModel>().calledByEvent ==
                            EEvent.fromRoute ||
                        context.read<SearchModel>().calledByEvent ==
                            EEvent.toRoute) {
                      Navigator.pop(
                        context,
                        InstituteArguments(
                          institute: context
                              .read<InstitutesModel>()
                              .institutes
                              .institutes!
                              .where((inst) =>
                                  inst.name ==
                                  cachedSearchList.searchs![index].institute)
                              .first,
                          search: cachedSearchList.searchs![index],
                        ),
                      );
                    } else {
                      context.read<SearchModel>().changeEvent(EEvent.search);
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
                                    cachedSearchList.searchs![index].institute)
                                .first,
                            search: cachedSearchList.searchs![index]),
                      );
                    }
                    log('Selected: ${cachedSearchList.searchs![index].names![0]}');
                    context.read<SearchModel>().changeSelectedQuery(
                        cachedSearchList.searchs![index].names![0]);
                    _searchController.text =
                        cachedSearchList.searchs![index].names![0];
                  },
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
    ));
  }
}

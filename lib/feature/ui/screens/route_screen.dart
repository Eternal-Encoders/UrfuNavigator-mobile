// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/common/institute_colors.dart';
import 'package:urfu_navigator_mobile/common/text_styles.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/path/path_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institutes_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/slider_text.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/loading_indicator.dart';
import 'package:urfu_navigator_mobile/locator_service.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class RouteScreen extends StatefulWidget {
  final bool autofocus;
  RouteScreen(
    Key? key, {
    required this.autofocus,
  }) : super(key: key);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  late bool isActive;
  late bool isLoading;
  late bool areValuesFilled;
  late String hintFrom;
  late String hintTo;
  InstituteArguments? fromInst = InstituteArguments(institute: null);
  InstituteArguments? toInst = InstituteArguments(institute: null);
  SearchList cachedSearchList = SearchList(searchs: List.empty(growable: true));
  late List<String>? cachedListData;

  @override
  void initState() {
    super.initState();
    isActive = true;
    isLoading = false;
    areValuesFilled = false;

    cachedListData =
        sl<SharedPreferences>().getStringList(Constants.CACHED_SEARCH_LIST);

    if (cachedListData != null) {
      var decodedData =
          cachedListData!.map((item) => jsonDecode(item)).toList();
      cachedSearchList = SearchList.fromJson(decodedData);
    }

    print('init 1');
  }

  void setField(String title) async {
    if (_fromController.text.isEmpty) {
      context.read<SearchModel>().changeEvent(EEvent.fromRoute);

      var data = await Navigator.pushNamed(context, RoutePaths.search,
          arguments: title);

      if (data == null) return;

      setState(() {
        fromInst = data as InstituteArguments;
        WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
          _fromController.text = data.search!.names![0];
          context.read<SearchModel>().setFromFloor(fromInst!.search!.floor!);
        });
      });
    } else {
      context.read<SearchModel>().changeEvent(EEvent.toRoute);

      var data = await Navigator.pushNamed(context, RoutePaths.search,
          arguments: title);

      if (data == null) return;

      setState(() {
        toInst = data as InstituteArguments;
        WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
          _toController.text = data.search!.names![0];
          context.read<SearchModel>().setToFloor(toInst!.search!.floor!);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (fromInst!.search != null) {
      print(fromInst!.search!.names![0]);
    }
    Size screenSize = MediaQuery.of(context).size;
    var pathState = context.watch<PathBloc>().state;
    var areValuesFilled =
        _fromController.text.isNotEmpty && _toController.text.isNotEmpty;
    hintFrom = I18N(context).routeFromHint;
    hintTo = I18N(context).routeToHint;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 149,
            padding: EdgeInsets.only(left: 16, right: 16, top: 56),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(0.0),
                  width: 24,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.read<SearchModel>().changeEvent(EEvent.none);
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 24,
                      )),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 44,
                      width: screenSize.width * 0.75,
                      child: TextField(
                        onTap: () async {
                          context
                              .read<SearchModel>()
                              .changeEvent(EEvent.fromRoute);

                          var data = await Navigator.pushNamed(
                              context, RoutePaths.search,
                              arguments: _fromController.text);

                          if (data == null) return;

                          setState(() {
                            fromInst = data as InstituteArguments;
                            WidgetsBinding.instance
                                .addPostFrameCallback((Duration timeStamp) {
                              _fromController.text = data.search!.names![0];
                              context
                                  .read<SearchModel>()
                                  .setFromFloor(fromInst!.search!.floor!);
                            });
                          });
                        },
                        autofocus: widget.autofocus,
                        readOnly: true,
                        cursorColor: AppColors.accentGray,
                        cursorErrorColor: AppColors.accentGray,
                        cursorWidth: 2,
                        cursorHeight: 20,
                        controller: _fromController,
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        expands: true,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyles.h4MedAccGrayDark,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          icon: Icon(
                            Icons.location_on_outlined,
                            size: 24,
                          ),
                          // isDense: true,
                          // disabledBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: AppColors.accentGray),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: AppColors.secondPaleGrayLight)),
                          hintText: hintFrom,
                          hintStyle: TextStyle(
                              fontSize: 12, color: AppColors.accentGray),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 44,
                      width: screenSize.width * 0.75,
                      child: TextField(
                        onTap: () async {
                          context
                              .read<SearchModel>()
                              .changeEvent(EEvent.toRoute);

                          var data = await Navigator.pushNamed(
                              context, RoutePaths.search,
                              arguments: _toController.text);

                          if (data == null) return;

                          setState(() {
                            toInst = data as InstituteArguments;
                            WidgetsBinding.instance
                                .addPostFrameCallback((Duration timeStamp) {
                              _toController.text = data.search!.names![0];
                              context
                                  .read<SearchModel>()
                                  .setToFloor(toInst!.search!.floor!);
                            });
                          });
                        },
                        autofocus: widget.autofocus,
                        readOnly: true,
                        cursorColor: AppColors.accentGray,
                        cursorErrorColor: AppColors.accentGray,
                        cursorWidth: 2,
                        cursorHeight: 20,
                        controller: _toController,
                        expands: true,
                        maxLines: null,
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyles.h4MedAccGrayDark,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          icon: Icon(
                            Icons.gps_fixed_outlined,
                            size: 24,
                          ),
                          // isDense: true,
                          // disabledBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: AppColors.accentGray),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: AppColors.secondPaleGrayLight)),
                          hintText: hintTo,
                          hintStyle: TextStyle(
                              fontSize: 12, color: AppColors.accentGray),
                        ),
                      ),
                    ),
                    // TextField()
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0.0),
                    height: 24,
                    width: 24,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          String temp = _fromController.text;
                          _fromController.text = _toController.text;
                          _toController.text = temp;
                          var temp2 = context.read<SearchModel>();
                          int tempFloor = temp2.fromFloor;
                          temp2.setFromFloor(temp2.toFloor);
                          temp2.setToFloor(tempFloor);
                          var temp3 = fromInst!;
                          fromInst = toInst!;
                          toInst = temp3;
                        },
                        icon: Icon(
                          Icons.compare_arrows_outlined,
                          size: 24,
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            color: AppColors.secondPaleGrayLight,
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 44,
              width: screenSize.width * 0.91,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.mainWhiteLight,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 3,
                    // offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => setState(
                        () => isActive = false,
                      ),
                      child: SliderText(
                        screenSize: screenSize,
                        title: I18N(context).sliderHistoryTitle,
                        isActive: !isActive,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () => setState(
                        () => isActive = true,
                      ),
                      child: SliderText(
                        screenSize: screenSize,
                        title: I18N(context).sliderCategoryTitle,
                        isActive: isActive,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          isActive
              ? Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                I18N(context).routeFoodTitle,
                                style: TextStyle(
                                    color: AppColors.accentGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 34,
                                        child: ActionChip(
                                            onPressed: () async {
                                              setField(Constants
                                                  .ROUTE_CATEGORY_COFFEE_INITIAL_VALUE);
                                            },
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 5),
                                            labelStyle: TextStyles.h3MedOrange,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: AppColors
                                                    .secondPaleGrayLight,
                                                width: 1,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            avatar: SvgIcons.coffeeOrangeSvg,
                                            label: Text(I18N(context)
                                                .routeCategoryCoffeeTitle)),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 34,
                                        child: ActionChip(
                                            onPressed: () async {
                                              setField(Constants
                                                  .ROUTE_CATEGORY_VENDING_INITIAL_VALUE);
                                            },
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 5),
                                            labelStyle: TextStyles.h3MedOrange,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: AppColors
                                                    .secondPaleGrayLight,
                                                width: 1,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            avatar: SvgIcons.vendingOrangeSvg,
                                            label: Text(I18N(context)
                                                .routeCategoryVendingTitle)),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 34,
                                        child: ActionChip(
                                            onPressed: () async {
                                              setField(Constants
                                                  .ROUTE_CATEGORY_DINNING_INITIAL_VALUE);
                                            },
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 5),
                                            labelStyle: TextStyles.h3MedOrange,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                color: AppColors
                                                    .secondPaleGrayLight,
                                                width: 1,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            avatar: SvgIcons.dinningOrangeSvg,
                                            label: Text(I18N(context)
                                                .routeCategoryDinningTitle)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                I18N(context).routeSocietyPlacesTitle,
                                style: TextStyle(
                                    color: AppColors.accentGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 34,
                                          child: ActionChip(
                                              onPressed: () async {
                                                setField(Constants
                                                    .ROUTE_CATEGORY_TOILETM_INITIAL_VALUE);
                                              },
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 5),
                                              labelStyle: TextStyles.h3MedGreen,
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColors
                                                      .secondPaleGrayLight,
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              avatar: SvgIcons.manGreenSvg,
                                              label: Text(I18N(context)
                                                  .routeCategoryToiletmTitle)),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          height: 34,
                                          child: ActionChip(
                                              onPressed: () async {
                                                setField(Constants
                                                    .ROUTE_CATEGORY_TOILETW_INITIAL_VALUE);
                                              },
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 5),
                                              labelStyle: TextStyles.h3MedGreen,
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColors
                                                      .secondPaleGrayLight,
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              avatar: SvgIcons.womanGreenSvg,
                                              label: Text(I18N(context)
                                                  .routeCategoryToiletwTitle)),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          height: 34,
                                          child: ActionChip(
                                              onPressed: () async {
                                                setField(Constants
                                                    .ROUTE_CATEGORY_WARDEROB_INITIAL_VALUE);
                                              },
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 5),
                                              labelStyle: TextStyles.h3MedGreen,
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColors
                                                      .secondPaleGrayLight,
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              avatar: SvgIcons.wardrobeGreenSvg,
                                              label: Text(I18N(context)
                                                  .routeCategoryWardrobeTitle)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () async {},
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          child: SizedBox(
                                            height: 34,
                                            child: ActionChip(
                                                onPressed: () async {
                                                  setField(Constants
                                                      .ROUTE_CATEGORY_COWORKING_INITIAL_VALUE);
                                                },
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 5),
                                                labelStyle:
                                                    TextStyles.h3MedGreen,
                                                clipBehavior: Clip.antiAlias,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color: AppColors
                                                        .secondPaleGrayLight,
                                                    width: 1,
                                                    style: BorderStyle.solid,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                ),
                                                backgroundColor:
                                                    Colors.transparent,
                                                avatar:
                                                    SvgIcons.notebookGreenSvg,
                                                label: Text(I18N(context)
                                                    .routeCategoryCoworkingTitle)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                I18N(context).routeServicesTitle,
                                style: TextStyle(
                                    color: AppColors.accentGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 34,
                                          child: ActionChip(
                                              onPressed: () async {
                                                setField(Constants
                                                    .ROUTE_CATEGORY_PRINT_INITIAL_VALUE);
                                              },
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 5),
                                              labelStyle: TextStyles.h3MedBlue,
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColors
                                                      .secondPaleGrayLight,
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              avatar: SvgIcons.printerBlueSvg,
                                              label: Text(I18N(context)
                                                  .routeCategoryPrintTitle)),
                                        ),
                                        // SizedBox(
                                        //   height: 8,
                                        // ),
                                        // // InkWell(
                                        // //   onTap: () async {
                                        // //     if (_fromController.text.isEmpty) {
                                        // //       context
                                        // //           .read<SearchModel>()
                                        // //           .changeEvent(EEvent.fromRoute);

                                        // //       var data = await Navigator.pushNamed(
                                        // //           context, RoutePaths.search,
                                        // //           arguments: I18N
                                        // //               .ROUTE_CATEGORY_CHARGER_INITIAL_VALUE);

                                        // //       if (data == null) return;

                                        // //       setState(() {
                                        // //         fromInst =
                                        // //             data as InstituteArguments;
                                        // //         WidgetsBinding.instance
                                        // //             .addPostFrameCallback(
                                        // //                 (Duration timeStamp) {
                                        // //           _fromController.text =
                                        // //               data.search!.names![0];
                                        // //           context
                                        // //               .read<SearchModel>()
                                        // //               .setFromFloor(
                                        // //                   fromInst!.search!.floor!);
                                        // //         });
                                        // //       });
                                        // //     } else {
                                        // //       context
                                        // //           .read<SearchModel>()
                                        // //           .changeEvent(EEvent.toRoute);

                                        // //       var data = await Navigator.pushNamed(
                                        // //           context, RoutePaths.search,
                                        // //           arguments: I18N
                                        // //               .ROUTE_CATEGORY_CHARGER_INITIAL_VALUE);

                                        // //       if (data == null) return;

                                        // //       setState(() {
                                        // //         toInst = data as InstituteArguments;
                                        // //         WidgetsBinding.instance
                                        // //             .addPostFrameCallback(
                                        // //                 (Duration timeStamp) {
                                        // //           _toController.text =
                                        // //               data.search!.names![0];
                                        // //           context
                                        // //               .read<SearchModel>()
                                        // //               .setToFloor(
                                        // //                   toInst!.search!.floor!);
                                        // //         });
                                        // //       });
                                        // //     }
                                        // //   },
                                        // //   borderRadius:
                                        // //       BorderRadius.all(Radius.circular(20)),
                                        // //   child: RouteCategoryCard(
                                        // //     title: I18N
                                        // //         .ROUTE_CATEGORY_CHARGER_TITLE,
                                        // //     textStyle: TextStyles.h3MedBlue,
                                        // //     icon: SvgIcons.chargerBlueSvg,
                                        // //   ),
                                        // // ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          height: 34,
                                          child: ActionChip(
                                              onPressed: () async {
                                                setField(Constants
                                                    .ROUTE_CATEGORY_ATM_INITIAL_VALUE);
                                              },
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 5),
                                              labelStyle: TextStyles.h3MedBlue,
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColors
                                                      .secondPaleGrayLight,
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              avatar: SvgIcons.atmBlueSvg,
                                              label: Text(I18N(context)
                                                  .routeCategoryAtmTitle)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                I18N(context).routeAdministrationTitle,
                                style: TextStyle(
                                    color: AppColors.accentGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 34,
                                          child: ActionChip(
                                              onPressed: () async {
                                                setField(Constants
                                                    .ROUTE_CATEGORY_STUDENTS_INITIAL_VALUE);
                                              },
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 5),
                                              labelStyle:
                                                  TextStyles.h3MedFireLight,
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColors
                                                      .secondPaleGrayLight,
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              avatar: SvgIcons.flagRedSvg,
                                              label: Text(I18N(context)
                                                  .routeCategoryStudentsTitle)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.45,
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 34,
                                          child: ActionChip(
                                              onPressed: () async {
                                                setField(Constants
                                                    .ROUTE_CATEGORY_DEANERY_INITIAL_VALUE);
                                              },
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 5),
                                              labelStyle:
                                                  TextStyles.h3MedFireLight,
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColors
                                                      .secondPaleGrayLight,
                                                  width: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              avatar: SvgIcons.toolsRedSvg,
                                              label: Text(I18N(context)
                                                  .routeCategoryDeaneryTitle)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            // disabledColor: AppColors.secondPaleGrayLight,
                            onPressed: () {
                              areValuesFilled ? search() : null;
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: areValuesFilled
                                  ? AppColors.secondOrangeLight
                                  : null,
                              shape: CircleBorder(), // Круглая форма для кнопки
                              side: BorderSide(
                                  width: 1,
                                  color: areValuesFilled
                                      ? Colors.transparent
                                      : const Color.fromARGB(255, 207, 207,
                                          207)), // Настройка границы
                            ),
                            // icon: Icon(
                            //   Icons.search,
                            //   shadows: const [
                            //     Shadow(
                            //       color: Colors.white,
                            //       blurRadius: 2.0,
                            //     ),
                            //   ],
                            // ),
                            // focusColor: areValuesFilled
                            //     ? Theme.of(context).focusColor
                            //     : null,
                            // hoverColor: areValuesFilled
                            //     ? Theme.of(context).hoverColor
                            //     : null,
                            // splashColor: areValuesFilled
                            //     ? Theme.of(context).splashColor
                            //     : null,
                            // highlightColor: areValuesFilled
                            //     ? Theme.of(context).highlightColor
                            //     : null,
                            // iconSize: 48,
                            // color: areValuesFilled
                            //     ? AppColors.accentOrange
                            //     : AppColors.accentGray,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  12.0), // Чтобы иконка не прилегала к границе
                              child: Icon(
                                Icons.search,
                                size: 32,
                                color: areValuesFilled
                                    ? AppColors.accentOrange
                                    : AppColors.accentGray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Container(
                  height: 55 * 10,
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                                      color: switch (cachedSearchList
                                          .searchs![index].institute) {
                                        'ИРИТ-РТФ' =>
                                          InstituteColors.iritrtfOutside,
                                        'ГУК' => InstituteColors.gukOutside,
                                        'УРАЛЭНИН' =>
                                          InstituteColors.uraleninOutside,
                                        'ИСА' => InstituteColors.isaOutside,
                                        'ИНМИТ-ХТИ' =>
                                          InstituteColors.inmitOutside,
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
                                        color: switch (cachedSearchList
                                            .searchs![index].institute) {
                                          'ИРИТ-РТФ' =>
                                            InstituteColors.iritrtfInside,
                                          'ГУК' => InstituteColors.gukInside,
                                          'УРАЛЭНИН' =>
                                            InstituteColors.uraleninInside,
                                          'ИСА' => InstituteColors.isaInside,
                                          'ИНМИТ-ХТИ' =>
                                            InstituteColors.inmitInside,
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
                                title: Text(
                                    cachedSearchList.searchs![index].names![0]),
                                onTap: () {
                                  if (context
                                              .read<SearchModel>()
                                              .calledByEvent ==
                                          EEvent.fromRoute ||
                                      context
                                              .read<SearchModel>()
                                              .calledByEvent ==
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
                                                cachedSearchList
                                                    .searchs![index].institute)
                                            .first,
                                        search:
                                            cachedSearchList.searchs![index],
                                      ),
                                    );
                                  } else {
                                    context
                                        .read<SearchModel>()
                                        .changeEvent(EEvent.search);
                                    Navigator.pushNamed(
                                      context,
                                      RoutePaths.institute,
                                      arguments: InstituteArguments(
                                          institute: context
                                              .read<InstitutesModel>()
                                              .institutes
                                              .institutes!
                                              .where((inst) =>
                                                  inst.name ==
                                                  cachedSearchList
                                                      .searchs![index]
                                                      .institute)
                                              .first,
                                          search:
                                              cachedSearchList.searchs![index]),
                                    );
                                  }
                                  developer.log(
                                      'Selected: ${cachedSearchList.searchs![index].names![0]}');
                                  context
                                      .read<SearchModel>()
                                      .changeSelectedQuery(cachedSearchList
                                          .searchs![index].names![0]);
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
                  )),
          isLoading
              ? pathState.when(loading: () {
                  return DefaultLoadingIndicator();
                }, loaded: (pathLoaded) {
                  setState(() {
                    isLoading = false;
                  });
                  WidgetsBinding.instance
                      .addPostFrameCallback((Duration timeStamp) {
                    context.read<SearchModel>().changeEvent(EEvent.route);
                  });

                  WidgetsBinding.instance
                      .addPostFrameCallback((Duration timeStamp) {
                    Navigator.pushNamed(
                      context,
                      RoutePaths.institute,
                      arguments: InstituteArguments(
                          institute: fromInst!.institute,
                          search: fromInst!.search,
                          path: pathLoaded),
                    );
                  });

                  return Container();
                }, error: () {
                  return Container();
                })
              : Container(),
        ],
      ),
    );
  }

  search() {
    setState(() {
      isLoading = true;
    });
    context.read<PathBloc>().add(
          PathEvent.fetch(from: fromInst!.search!.id!, to: toInst!.search!.id!),
        );
  }
}

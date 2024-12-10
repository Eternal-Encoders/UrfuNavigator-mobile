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
import 'package:urfu_navigator_mobile/feature/ui/widgets/route_category_card.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/slider_text.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class RouteScreen extends StatefulWidget {
  final bool autofocus;
  final SharedPreferences sharedPreferences;
  RouteScreen(
    Key? key, {
    required this.autofocus,
    required this.sharedPreferences,
  }) : super(key: key);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  late bool isActive;
  late bool isLoading;
  final String hintFrom = 'Откуда';
  final String hintTo = 'Куда';
  InstituteArguments? fromInst = InstituteArguments(institute: null);
  InstituteArguments? toInst = InstituteArguments(institute: null);
  SearchList cachedSearchList = SearchList(searchs: List.empty(growable: true));
  late List<String>? cachedListData;

  @override
  void initState() {
    super.initState();
    isActive = true;
    isLoading = false;

    cachedListData =
        widget.sharedPreferences.getStringList(Constants.CACHED_SEARCH_LIST);

    if (cachedListData != null) {
      var decodedData =
          cachedListData!.map((item) => jsonDecode(item)).toList();
      cachedSearchList = SearchList.fromJson(decodedData);
    }

    print('init 1');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var pathState = context.watch<PathBloc>().state;
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
                      constraints: BoxConstraints(),
                      onPressed: () {
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
                              context, RoutePaths.search);

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
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: AppColors.accentGray,
                        cursorErrorColor: AppColors.accentGray,
                        cursorWidth: 2,
                        cursorHeight: 20,
                        controller: _fromController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.location_on_outlined,
                            size: 24,
                          ),
                          // isDense: false,
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
                              fontSize: 12,
                              color: AppColors.accentGray,
                              height: 5.1),
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
                              context, RoutePaths.search);

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
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: AppColors.accentGray,
                        cursorErrorColor: AppColors.accentGray,
                        cursorWidth: 2,
                        cursorHeight: 20,
                        controller: _toController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.gps_fixed_outlined,
                            size: 24,
                          ),
                          // isDense: false,
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
                              fontSize: 12,
                              color: AppColors.accentGray,
                              height: 5.1),
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
                        constraints: BoxConstraints(),
                        onPressed: () {
                          if (fromInst!.search != null &&
                              toInst!.search != null) {
                            context.read<PathBloc>().add(PathEvent.fetch(
                                from: fromInst!.search!.id!,
                                to: toInst!.search!.id!));
                            setState(() {
                              isLoading = true;
                            });
                          }
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
                        title: Constants.SLIDER_HISTORY_TITLE,
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
                        title: Constants.SLIDER_CATEGORY_TITLE,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Constants.ROUTE_FOOD_TITLE,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_COFFEE_TITLE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_COFFEE_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_COFFEE_TITLE,
                                        textStyle: TextStyles.h3MedOrange,
                                        icon: SvgIcons.coffeeOrangeSvg,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_VENDING_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_VENDING_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_VENDING_TITLE,
                                        textStyle: TextStyles.h3MedOrange,
                                        icon: SvgIcons.coffeeOrangeSvg,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_DINNING_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_DINNING_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_DINNING_TITLE,
                                        textStyle: TextStyles.h3MedOrange,
                                        icon: SvgIcons.coffeeOrangeSvg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_COFFEMACHINE_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_COFFEMACHINE_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_COFFEMACHINE_TITLE,
                                        textStyle: TextStyles.h3MedOrange,
                                        icon: SvgIcons.coffeeOrangeSvg,
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
                            Constants.ROUTE_SOUL_TITLE,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_TOILETM_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_TOILETM_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_TOILETM_TITLE,
                                        textStyle: TextStyles.h3MedGreen,
                                        icon: SvgIcons.manGreenSvg,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_TOILETW_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_TOILETW_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_TOILETW_TITLE,
                                        textStyle: TextStyles.h3MedGreen,
                                        icon: SvgIcons.womanGreenSvg,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_WARDEROB_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_WARDEROB_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_WARDEROB_TITLE,
                                        textStyle: TextStyles.h3MedGreen,
                                        icon: SvgIcons.wardrobeGreenSvg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_COWORKING_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_COWORKING_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_COWORKING_TITLE,
                                        textStyle: TextStyles.h3MedGreen,
                                        icon: SvgIcons.notebookGreenSvg,
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
                            Constants.ROUTE_SERVICES_TITLE,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_PRINT_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_PRINT_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_PRINT_TITLE,
                                        textStyle: TextStyles.h3MedBlue,
                                        icon: SvgIcons.printerBlueSvg,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_CHARGER_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_CHARGER_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_CHARGER_TITLE,
                                        textStyle: TextStyles.h3MedBlue,
                                        icon: SvgIcons.chargerBlueSvg,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_ATM_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_ATM_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title:
                                            Constants.ROUTE_CATEGORY_ATM_TITLE,
                                        textStyle: TextStyles.h3MedBlue,
                                        icon: SvgIcons.atmBlueSvg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_WATERPUMP_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_WATERPUMP_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_WATERPUMP_TITLE,
                                        textStyle: TextStyles.h3MedBlue,
                                        icon: SvgIcons.coffeeBlueSvg,
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
                            Constants.ROUTE_ADMINISTRATION_TITLE,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_STUDENTS_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_STUDENTS_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_STUDENTS_TITLE,
                                        textStyle: TextStyles.h3MedFireLight,
                                        icon: SvgIcons.flagRedSvg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.45,
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (_fromController.text.isEmpty) {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.fromRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_DEANERY_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            fromInst =
                                                data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _fromController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setFromFloor(
                                                      fromInst!.search!.floor!);
                                            });
                                          });
                                        } else {
                                          context
                                              .read<SearchModel>()
                                              .changeEvent(EEvent.toRoute);

                                          var data = await Navigator.pushNamed(
                                              context, RoutePaths.search,
                                              arguments: Constants
                                                  .ROUTE_CATEGORY_DEANERY_INITIAL_VALUE);

                                          if (data == null) return;

                                          setState(() {
                                            toInst = data as InstituteArguments;
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (Duration timeStamp) {
                                              _toController.text =
                                                  data.search!.names![0];
                                              context
                                                  .read<SearchModel>()
                                                  .setToFloor(
                                                      toInst!.search!.floor!);
                                            });
                                          });
                                        }
                                      },
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: RouteCategoryCard(
                                        title: Constants
                                            .ROUTE_CATEGORY_DEANERY_TITLE,
                                        textStyle: TextStyles.h3MedFireLight,
                                        icon: SvgIcons.toolsRedSvg,
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
                  return Container();
                }, loaded: (pathLoaded) {
                  WidgetsBinding.instance
                      .addPostFrameCallback((Duration timeStamp) {
                    context.read<SearchModel>().changeEvent(EEvent.route);
                  });

                  WidgetsBinding.instance
                      .addPostFrameCallback((Duration timeStamp) {
                    Navigator.pushReplacementNamed(
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
}

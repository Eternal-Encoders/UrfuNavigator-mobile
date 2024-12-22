import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/floor/floor_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institute_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/error_message.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/loading_indicator.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class InstituteScreen extends StatefulWidget {
  final InstituteArguments data;
  const InstituteScreen({
    super.key,
    required this.data,
  });

  @override
  State<InstituteScreen> createState() => _InstituteScreenState();
}

class _InstituteScreenState extends State<InstituteScreen> {
  InstituteModel? _instituteModel;
  final Map<String, PictureInfo?> svgPictures = {};
  Future<void> loadSvgIcon(String svgString, String key) async {
    final pictureInfo = await vg.loadPicture(SvgStringLoader(svgString), null);
    setState(() {
      svgPictures[key] = pictureInfo;
    });
  }

  @override
  void initState() {
    super.initState();

    // Получаем ссылку на InstituteModel
    _instituteModel = Provider.of<InstituteModel>(context, listen: false);

    // Добавляем слушатель
    _instituteModel?.addListener(_onChange);
    log('context.read<SearchModel>().calledByEvent: ${context.read<SearchModel>().calledByEvent}');
    // Первый запрос
    log('floor from route: ${context.read<SearchModel>().fromFloor.toString()}');
    if (context.read<SearchModel>().calledByEvent == EEvent.route) {
      context.read<FloorBloc>().add(FloorEvent.fetch(
          floor: '${context.read<SearchModel>().fromFloor}',
          institute: widget.data.institute!.name!));
    } else if (context.read<SearchModel>().calledByEvent != EEvent.search) {
      context.read<FloorBloc>().add(FloorEvent.fetch(
          floor: '${_instituteModel!.selectedFloor}',
          institute: widget.data.institute!.name!));
    } else {
      context.read<FloorBloc>().add(FloorEvent.fetch(
          floor: '${widget.data.search!.floor}',
          institute: widget.data.institute!.name!));
    }

    loadSvgIcon(SvgIcons.wardrobeRawSvg, 'wardrobe');
    loadSvgIcon(SvgIcons.vendingRawSvg, 'vending');
    loadSvgIcon(SvgIcons.atmRawSvg, 'atm');
    loadSvgIcon(SvgIcons.cafeRawSvg, 'cafe');
    loadSvgIcon(SvgIcons.coworkingRawSvg, 'coworking');
    loadSvgIcon(SvgIcons.dinningRawSvg, 'dinning');
    loadSvgIcon(SvgIcons.elevatorRawSvg, 'elevator');
    loadSvgIcon(SvgIcons.printRawSvg, 'print');
    loadSvgIcon(SvgIcons.stairsDownRawSvg, 'stairsDown');
    loadSvgIcon(SvgIcons.stairsUpRawSvg, 'stairsUp');
    loadSvgIcon(SvgIcons.toiletmRawSvg, 'toiletm');
    loadSvgIcon(SvgIcons.toiletwRawSvg, 'toiletw');
    loadSvgIcon(SvgIcons.routePointRawSvg, 'routePoint');
  }

  void _onChange() {
    log('object changed');
    if (context.read<SearchModel>().calledByEvent == EEvent.search) {
      context.read<FloorBloc>().add(
            FloorEvent.fetch(
              floor: '${widget.data.search!.floor}',
              institute: widget.data.institute!.name!,
            ),
          );
      log('widget.coordinates!.floor: ${widget.data.search!.floor}, widget.institute.name!: ${widget.data.institute!.name!}');
    } else {
      context.read<FloorBloc>().add(
            FloorEvent.fetch(
              floor: '${_instituteModel!.selectedFloor}',
              institute: widget.data.institute!.name!,
            ),
          );
      log('instituteState.selectedFloor: ${_instituteModel!.selectedFloor}, widget.institute.name!: ${widget.data.institute!.name}');
    }
  }

  @override
  void dispose() {
    log('object disposed');
    // Убираем слушатель перед удалением виджета
    _instituteModel?.removeListener(_onChange);
    _instituteModel = null;
    super.dispose();
  }

  //TODO: Too many recalls
  @override
  Widget build(BuildContext context) {
    late TransformationController transformationController;
    if (context.read<SearchModel>().calledByEvent != EEvent.search) {
      final customController = CustomTransformationController(
          university: widget.data.institute!.name!, zoom: null);
      transformationController = customController.controller;
    } else {
      Size screenSize = MediaQuery.of(context).size;
      final customController = CustomTransformationController(
          university: widget.data.institute!.name!,
          zoom: widget.data.search,
          size: screenSize);
      transformationController = customController.controller;
    }
    final floorState = context.watch<FloorBloc>().state;
    return floorState.when(
        error: () => DefaultErrorMessage(),
        loading: () => DefaultLoadingIndicator(),
        loaded: (Floor floorLoaded) => Center(
              child: RepaintBoundary(
                child: InteractiveViewer(
                  constrained: false,
                  panEnabled: true, // Set it to false to prevent panning.
                  scaleEnabled: true,
                  transformationController: transformationController,
                  boundaryMargin:
                      EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                  // alignment: Alignment.center,
                  minScale: 0.5,
                  maxScale: 5,

                  child: Stack(
                    children: [
                      getFloorPaint(
                        floorLoaded.audiences!,
                        floorLoaded.service!,
                        svgPictures,
                        floorLoaded.width!,
                        floorLoaded.height!,
                      ),
                      ((context.read<SearchModel>().calledByEvent ==
                                      EEvent.route ||
                                  context.read<SearchModel>().calledByEvent ==
                                      EEvent.floor) &&
                              widget.data.search != null &&
                              widget.data.path != null)
                          ? getPath(
                              widget.data.path!.result![widget.data.institute!
                                  .name!]!['${floorLoaded.floor}'],
                              svgPictures['routePoint'],
                              floorLoaded.width!,
                              floorLoaded.height!,
                              floorLoaded.floor!,
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ));
  }
}

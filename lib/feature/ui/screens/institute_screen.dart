import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart'
    // ignore: library_prefixes
    as PathModel;
import 'package:urfu_navigator_mobile/feature/ui/bloc/floor/floor_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institute_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/error_message.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/loading_indicator.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class InstituteScreen extends StatefulWidget {
  final Institute institute;
  const InstituteScreen({
    super.key,
    required this.institute,
  });

  @override
  State<InstituteScreen> createState() => _InstituteScreenState();
}

class _InstituteScreenState extends State<InstituteScreen> {
  InstituteModel? _instituteModel;
  late Future<PathModel.Path> pathData;
  late Future<Floor> floorData;
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

    // Первый запрос
    // context.read<FloorBloc>().add(FloorEvent.fetch(
    //     floor: '${floorState.selectedFloor}', institute: 'ИРИТ-РТФ'));

    loadSvgIcon(SvgIcons.wardrobeSvg, 'wardrobe');
    loadSvgIcon(SvgIcons.vendingSvg, 'vending');
    loadSvgIcon(SvgIcons.atmSvg, 'atm');
    loadSvgIcon(SvgIcons.cafeSvg, 'cafe');
    loadSvgIcon(SvgIcons.coworkingSvg, 'coworking');
    loadSvgIcon(SvgIcons.dinningSvg, 'dinning');
    loadSvgIcon(SvgIcons.elevatorSvg, 'elevator');
    loadSvgIcon(SvgIcons.printSvg, 'print');
    loadSvgIcon(SvgIcons.stairsDownSvg, 'stairsDown');
    loadSvgIcon(SvgIcons.stairsUpSvg, 'stairsUp');
    loadSvgIcon(SvgIcons.toiletmSvg, 'toiletm');
    loadSvgIcon(SvgIcons.toiletwSvg, 'toiletw');
  }

  void _onChange() {
    log('object changed');
    InstituteModel instituteState =
        Provider.of<InstituteModel>(context, listen: false);
    log('instituteState.selectedFloor: ${instituteState.selectedFloor}, instituteState.selectedInstitute: ${widget.institute.name}');
    context.read<FloorBloc>().add(
          FloorEvent.fetch(
            floor: '${instituteState.selectedFloor}',
            institute: widget.institute.name!,
          ),
        );
  }

  @override
  void dispose() {
    log('object disposed');
    // Убираем слушатель перед удалением виджета
    _instituteModel?.removeListener(_onChange);
    _instituteModel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customController = CustomTransformationController();
    final transformationController = customController.controller;
    final state = context.watch<FloorBloc>().state;
    return state.when(
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
                  // minScale: 0.5,
                  // maxScale: 10,

                  child: RepaintBoundary(
                    child: getFloorPaint(
                        floorLoaded.audiences!,
                        floorLoaded.service!,
                        svgPictures,
                        floorLoaded.width!,
                        floorLoaded.height!),
                  ),
                ),
              ),
            ));
  }
}

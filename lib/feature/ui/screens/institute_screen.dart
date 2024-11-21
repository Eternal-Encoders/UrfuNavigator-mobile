import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart'
    // ignore: library_prefixes
    as PathModel;
import 'package:urfu_navigator_mobile/feature/ui/bloc/floor/floor_bloc.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class InstituteScreen extends StatefulWidget {
  @override
  State<InstituteScreen> createState() => _InstituteScreenState();
}

class _InstituteScreenState extends State<InstituteScreen> {
  late Future<PathModel.Path> pathData;
  late Future<Floor> floorData;
  final Map<String, PictureInfo?> svgPictures = {};
  PictureInfo? wardrobeSvgPicture;
  PictureInfo? vendingSvgPicture;
  PictureInfo? toiletwSvgPicture;
  PictureInfo? toiletmSvgPicture;
  PictureInfo? stairsUpSvgPicture;
  PictureInfo? stairsDownSvgPicture;
  PictureInfo? printSvgPicture;
  PictureInfo? elevatorSvgPicture;
  PictureInfo? dinningSvgPicture;
  PictureInfo? coworkingSvgPicture;
  PictureInfo? cafeSvgPicture;
  PictureInfo? atmSvgPicture;
  Future<void> loadSvgIcon(String svgString, String key) async {
    final pictureInfo = await vg.loadPicture(SvgStringLoader(svgString), null);
    setState(() {
      svgPictures[key] = pictureInfo;
    });
  }

  @override
  void initState() {
    context
        .read<FloorBloc>()
        .add(const FloorEvent.fetch(floor: '1', institute: 'ИРИТ-РТФ'));
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    final customController = CustomTransformationController();
    final transformationController = customController.controller;
    final state = context.watch<FloorBloc>().state;
    return state.when(
        error: () =>
            Center(child: const Text('Ошибка на сервере, попробуйте позже.')),
        loading: () {
          return Center(
            child: RepaintBoundary(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue[200],
              ),
            ),
          );
        },
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
                  child: getFloorPaint(
                      floorLoaded.audiences!,
                      floorLoaded.service!,
                      svgPictures,
                      floorLoaded.width!,
                      floorLoaded.height!),
                ),
              ),
            ));
  }
}

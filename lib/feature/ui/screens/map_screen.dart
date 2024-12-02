import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institutes_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/map_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/types/map_point.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: YandexMap(
        onCameraPositionChanged: (position, reason, isChanged) {
          context
              .read<MapModel>()
              .onCameraPositionChanged(position, reason, isChanged);
        },
        onMapCreated: (controller) async {
          _mapController = controller;
          // приближаем вид карты ближе к Европе
          await _mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: Point(
                  latitude: 56.842,
                  longitude: 60.652,
                ),
                zoom: 15,
              ),
            ),
          );
        },
        mapObjects: _getPlacemarkObjects(context),
        // onMapTap: (Point point) => log('map tapped on $point'),
        // onMapLongTap: (Point point) => log('map long-tapped on $point'),
      ),
    );
  }
}

/// Метод для генерации точек на карте
List<MapPoint> _getMapPoints() {
  return const [
    MapPoint(
        name: 'ИРИТ-РТФ',
        displayableName: 'ИРИТ-РТФ (Р)',
        latitude: 56.840991,
        longitude: 60.65080),
    MapPoint(
        name: 'ИСА',
        displayableName: 'ИСА (С, СП)',
        latitude: 56.845172,
        longitude: 60.650795),
    MapPoint(
        name: 'ИНМИТ-ХТИ',
        displayableName: 'ИНМИТ и ХТИ (МТ, Х)',
        latitude: 56.842294,
        longitude: 60.649083),
    MapPoint(
        name: 'УГИ',
        displayableName: 'УГИ (УГИ)',
        latitude: 56.840575451892274,
        longitude: 60.61598242404035),
    MapPoint(
        name: 'УРАЛЭНИН',
        displayableName: 'УралЭНИН (Т)',
        latitude: 56.842994,
        longitude: 60.655210),
    MapPoint(
        name: 'ГУК',
        displayableName: 'ГУК (ГУК, Э, И, М)',
        latitude: 56.844414,
        longitude: 60.653687),
  ];
}

/// Метод для генерации объектов маркеров для отображения на карте
List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
  return _getMapPoints()
      .map(
        (point) => PlacemarkMapObject(
          mapId: MapObjectId('MapObject $point'),
          point: Point(latitude: point.latitude, longitude: point.longitude),
          opacity: 1,
          zIndex: 2,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage(
                'assets/img/points/map_point.png',
              ),
              zIndex: -1,
              scale: 2,
              // scale: 0,
            ),
          ),
          text: PlacemarkText(
              text: point.displayableName,
              style: const PlacemarkTextStyle(
                size: 10,
                outlineColor: Colors.white,
                placement: TextStylePlacement.right,
                offset: 8,
                offsetFromIcon: true,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
          onTap: (_, __) {
            context.read<SearchModel>().changeEvent(EEvent.card);

            Navigator.pushNamed(
              context,
              RoutePaths.institute,
              arguments: InstituteArguments(
                institute: context
                    .read<InstitutesModel>()
                    .institutes
                    .institutes!
                    .where((inst) => inst.name == point.name)
                    .first,
                coordinates: null,
              ),
            );
          },
        ),
      )
      .toList();
}

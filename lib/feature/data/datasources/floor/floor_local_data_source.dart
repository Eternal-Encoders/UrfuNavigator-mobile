// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';

abstract class FloorLocalDataSource {
  Future<Floor> getLastFloorFromCache();
  Future<void> floorToCache(Floor floor);
}

// ignore: constant_identifier_names
const CACHED_FLOOR = 'CACHED_FLOOR';

class FloorLocalDataSourceImpl implements FloorLocalDataSource {
  final SharedPreferences sharedPreferences;

  FloorLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<Floor> getLastFloorFromCache() {
    final jsonFloor = sharedPreferences.getString(CACHED_FLOOR);
    if (jsonFloor != null) {
      return Future.value(Floor.fromJson(json.decode(jsonFloor)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> floorToCache(Floor floor) {
    final String jsonFloor = json.encode(floor.toJson());

    sharedPreferences.setString(CACHED_FLOOR, jsonFloor);

    print('Floor to write Cache: $jsonFloor');

    // ignore: void_checks
    return Future.value(jsonFloor);
  }
}

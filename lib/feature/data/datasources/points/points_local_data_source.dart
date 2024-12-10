// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';
import 'package:urfu_navigator_mobile/feature/data/models/points/points.dart';

abstract class PointsLocalDataSource {
  Future<PointsList> getLastPointsFromCache();
  Future<void> pointToCache(Point point);
  Future<Point> getLastPointFromCache();
  Future<void> pointsToCache(PointsList points);
}

const CACHED_POINTS = 'CACHED_POINTS';
const CACHED_POINT = 'CACHED_POINT';

class PointsLocalDataSourceImpl implements PointsLocalDataSource {
  final SharedPreferences sharedPreferences;

  PointsLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<Point> getLastPointFromCache() {
    final jsonPoint = sharedPreferences.getString(CACHED_POINT);
    if (jsonPoint != null) {
      return Future.value(Point.fromJson(json.decode(jsonPoint)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<PointsList> getLastPointsFromCache() {
    final jsonPoints = sharedPreferences.getString(CACHED_POINTS);
    if (jsonPoints != null) {
      return Future.value(PointsList.fromJson(json.decode(jsonPoints)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> pointToCache(Point point) {
    final String jsonPoints = json.encode(point.toJson());

    sharedPreferences.setString(CACHED_POINT, jsonPoints);

    log('Point to write Cache: $jsonPoints');

    // ignore: void_checks
    return Future.value(jsonPoints);
  }

  @override
  Future<void> pointsToCache(PointsList points) {
    final String jsonPoints = json.encode(points.toJson());

    sharedPreferences.setString(CACHED_POINTS, jsonPoints);

    log('Points to write Cache: $jsonPoints');

    // ignore: void_checks
    return Future.value(jsonPoints);
  }
}

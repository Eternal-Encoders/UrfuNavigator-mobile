// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';
import 'package:urfu_navigator_mobile/feature/data/models/points/points.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

abstract class PointsRemoteDataSource {
  Future<PointsList> getPointsByType(EPointTypes? type, String? institute,
      String? floor, String? name, String? length);
  Future<Point> getPointById(String id);
}

class PointsRemoteDataSourceImpl implements PointsRemoteDataSource {
  final http.Client client;

  PointsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<Point> getPointById(String id) async {
    final queryParams = {
      'id': id,
    };
    var url =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_POINT, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Point.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PointsList> getPointsByType(EPointTypes? type, String? institute,
      String? floor, String? name, String? length) async {
    final queryParams = {
      if (type != null) 'type': type.name,
      if (floor != null) 'floor': floor,
      if (institute != null) 'institute': institute,
      if (name != null) 'name': name,
      if (length != null) 'length': length,
    };
    var url =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_POINTS, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return PointsList.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw ServerException();
    }
  }
}

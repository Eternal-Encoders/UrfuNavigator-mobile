// ignore_for_file: library_prefixes

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urfu_navigator_mobile/models/floor/floor.dart';
import 'package:urfu_navigator_mobile/models/institute/institute.dart'
    as InstituteModel;
import 'package:urfu_navigator_mobile/models/institutes/institutes.dart';
import 'package:urfu_navigator_mobile/models/path/path.dart' as PathModel;
import 'package:urfu_navigator_mobile/models/point/point.dart';
import 'package:urfu_navigator_mobile/models/points/points.dart';
import 'package:urfu_navigator_mobile/models/search/search.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class InstitutesApi {
  static Future<InstitutesList> getInstitutesList() async {
    var url = Uri.https(Constants.API_DOMAIN, Constants.API_PATH_INSTITUTES);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return InstitutesList.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  static Future<InstituteModel.Institute> getInstituteByUrl(
      {required String instUrl}) async {
    var queryParams = {
      'institute': instUrl,
    };
    var url = Uri.https(
        Constants.API_DOMAIN, Constants.API_PATH_INSTITUTE, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return InstituteModel.Institute.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  static Future<Floor> getFloorList(
      {required String floor, required String instNameRU}) async {
    var queryParams = {
      'floor': floor,
      'institute': instNameRU,
    };
    var url =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_FLOOR, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Floor.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  static Future<PointsList> getPointsByTypeList(
      {EPointTypes? type,
      String? institute,
      String? floor,
      String? name,
      String? length}) async {
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
      print(json.decode(utf8.decode(response.bodyBytes)));
      return PointsList.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  static Future<Point> getPointById({required String id}) async {
    var queryParams = {
      'id': id,
    };
    var url =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_POINT, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Point.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  static Future<PathModel.Path> getPath(
      {required String from, required String to}) async {
    var queryParams = {
      'from': from,
      'to': to,
    };
    var url =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_PATH, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return PathModel.Path.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  static Future<SearchList> searchPointsList(
      {String? name, String? length}) async {
    var queryParams = {
      if (name != null) 'name': name,
      if (length != null) 'length': length,
    };
    var url =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_SEARCH, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return SearchList.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/floor/floor.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

abstract class FloorRemoteDataSource {
  Future<Floor> getFloor(String floor, String instNameRU);
}

class FloorRemoteDataSourceImpl implements FloorRemoteDataSource {
  final http.Client client;

  FloorRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<Floor> getFloor(String floor, String instNameRU) async {
    final queryParams = {
      'floor': floor,
      'institute': instNameRU,
    };

    var url =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_FLOOR, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Floor.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw ServerException();
    }
  }
}

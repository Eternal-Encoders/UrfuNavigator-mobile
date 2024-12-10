// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart'
    // ignore: library_prefixes
    as PathModel;
import 'package:urfu_navigator_mobile/utils/const.dart';

abstract class PathRemoteDataSource {
  Future<PathModel.Path> getPath(String from, String to);
}

class PathRemoteDataSourceImpl implements PathRemoteDataSource {
  final http.Client client;

  PathRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<PathModel.Path> getPath(String from, String to) async {
    final queryParams = {
      'from': from,
      'to': to,
    };
    var uriUrl =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_PATH, queryParams);
    final response = await http.get(uriUrl);
    if (response.statusCode == 200) {
      return PathModel.Path.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw ServerException();
    }
  }
}

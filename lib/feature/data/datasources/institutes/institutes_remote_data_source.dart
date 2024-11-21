// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

abstract class InstitutesRemoteDataSource {
  Future<InstitutesList> getInstitutes();
  Future<Institute> getInstituteByUrl(String url);
}

class InstitutesRemoteDataSourceImpl implements InstitutesRemoteDataSource {
  final http.Client client;

  InstitutesRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<InstitutesList> getInstitutes() async {
    var url = Uri.https(Constants.API_DOMAIN, Constants.API_PATH_INSTITUTES);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return InstitutesList.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Institute> getInstituteByUrl(String url) async {
    final queryParams = {
      'url': url,
    };
    var uri = Uri.https(
        Constants.API_DOMAIN, Constants.API_PATH_INSTITUTE, queryParams);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Institute.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw ServerException();
    }
  }
}

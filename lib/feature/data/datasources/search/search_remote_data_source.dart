// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

abstract class SearchRemoteDataSource {
  Future<SearchList> getSearchPoints(String name, String? length);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final http.Client client;

  SearchRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<SearchList> getSearchPoints(String name, String? length) async {
    var queryParams = {
      'name': name,
      'length': length,
    };
    var url =
        Uri.https(Constants.API_DOMAIN, Constants.API_PATH_SEARCH, queryParams);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return SearchList.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw ServerException();
    }
  }
}

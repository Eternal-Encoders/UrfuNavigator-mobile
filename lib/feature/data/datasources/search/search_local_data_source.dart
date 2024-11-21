// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';

abstract class SearchLocalDataSource {
  Future<SearchList> getLastSearchFromCache();
  Future<void> searchToCache(SearchList search);
}

const CACHED_SEARCH = 'CACHED_SEARCH';

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final SharedPreferences sharedPreferences;

  SearchLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> searchToCache(SearchList search) {
    final String jsonSearch = json.encode(search.toJson());

    sharedPreferences.setString(CACHED_SEARCH, jsonSearch);

    print('Search to write Cache: $jsonSearch');

    // ignore: void_checks
    return Future.value(jsonSearch);
  }

  @override
  Future<SearchList> getLastSearchFromCache() {
    final jsonSearch = sharedPreferences.getString(CACHED_SEARCH);
    if (jsonSearch != null) {
      return Future.value(SearchList.fromJson(json.decode(jsonSearch)));
    } else {
      throw CacheException();
    }
  }
}

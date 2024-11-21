// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/path/path.dart'
    // ignore: library_prefixes
    as PathModel;

abstract class PathLocalDataSource {
  Future<PathModel.Path> getLastPathFromCache();
  Future<void> pathToCache(PathModel.Path path);
}

const CACHED_PATH = 'CACHED_PATH';

class PathLocalDataSourceImpl implements PathLocalDataSource {
  final SharedPreferences sharedPreferences;

  PathLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> pathToCache(PathModel.Path path) {
    final String jsonPath = json.encode(path.toJson());

    sharedPreferences.setString(CACHED_PATH, jsonPath);

    print('Path to write Cache: $jsonPath');

    // ignore: void_checks
    return Future.value(jsonPath);
  }

  @override
  Future<PathModel.Path> getLastPathFromCache() {
    final jsonPath = sharedPreferences.getString(CACHED_PATH);
    if (jsonPath != null) {
      return Future.value(PathModel.Path.fromJson(json.decode(jsonPath)));
    } else {
      throw CacheException();
    }
  }
}

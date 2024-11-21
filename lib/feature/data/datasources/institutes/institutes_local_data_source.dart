// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/core/error/exception.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';

abstract class InstitutesLocalDataSource {
  Future<InstitutesList> getLastInstitutesFromCache();
  Future<Institute> getLastInstituteFromCache();
  Future<void> institutesToCache(InstitutesList institutes);
  Future<void> instituteToCache(Institute institute);
}

const CACHED_INSTITUTES = 'CACHED_INSTITUTES';
const CACHED_INSTITUTE = 'CACHED_INSTITUTE';

class InstitutesLocalDataSourceImpl implements InstitutesLocalDataSource {
  final SharedPreferences sharedPreferences;

  InstitutesLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<InstitutesList> getLastInstitutesFromCache() {
    final jsonInstitutes = sharedPreferences.getString(CACHED_INSTITUTES);
    if (jsonInstitutes != null) {
      return Future.value(InstitutesList.fromJson(json.decode(jsonInstitutes)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> institutesToCache(InstitutesList institutes) {
    final String jsonInstitutes = json.encode(institutes.toJson());

    sharedPreferences.setString(CACHED_INSTITUTES, jsonInstitutes);

    print('Insts to write Cache: $jsonInstitutes');

    // ignore: void_checks
    return Future.value(jsonInstitutes);
  }

  @override
  Future<void> instituteToCache(Institute institute) {
    final String jsonInstitute = json.encode(institute.toJson());

    sharedPreferences.setString(CACHED_INSTITUTE, jsonInstitute);

    print('Inst to write Cache: $jsonInstitute');

    // ignore: void_checks
    return Future.value(jsonInstitute);
  }

  @override
  Future<Institute> getLastInstituteFromCache() {
    final jsonInstitute = sharedPreferences.getString(CACHED_INSTITUTE);
    if (jsonInstitute != null) {
      return Future.value(Institute.fromJson(json.decode(jsonInstitute)));
    } else {
      throw CacheException();
    }
  }
}

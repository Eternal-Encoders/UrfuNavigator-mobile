// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Path _$PathFromJson(Map<String, dynamic> json) => Path(
      result: (json['result'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  k,
                  (e as List<dynamic>)
                      .map((e) => (e as List<dynamic>)
                          .map((e) => Point.fromJson(e as Map<String, dynamic>))
                          .toList())
                      .toList()),
            )),
      ),
    );

Map<String, dynamic> _$PathToJson(Path instance) => <String, dynamic>{
      'result': instance.result,
    };

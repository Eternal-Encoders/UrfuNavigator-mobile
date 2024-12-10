// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) => Point(
      id: json['id'] as String?,
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      names:
          (json['names'] as List<dynamic>?)?.map((e) => e as String).toList(),
      floor: (json['floor'] as num?)?.toInt(),
      institute: json['institute'] as String?,
      time: (json['time'] as List<dynamic>?)
          ?.map((e) => Time.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      info: json['info'] as String?,
      menuId: json['menuId'] as String?,
      isPassFree: json['isPassFree'] as bool?,
      stairId: json['stairId'] as String?,
    );

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
      'links': instance.links,
      'types': instance.types,
      'names': instance.names,
      'floor': instance.floor,
      'institute': instance.institute,
      'time': instance.time,
      'description': instance.description,
      'info': instance.info,
      'menuId': instance.menuId,
      'isPassFree': instance.isPassFree,
      'stairId': instance.stairId,
    };

Time _$TimeFromJson(Map<String, dynamic> json) => Time(
      from: json['from'] as String?,
      to: json['to'] as String?,
      isDayOf: json['isDayOf'],
    );

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'isDayOf': instance.isDayOf,
    };

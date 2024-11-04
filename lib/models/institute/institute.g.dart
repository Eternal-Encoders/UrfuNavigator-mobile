// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Institute _$InstituteFromJson(Map<String, dynamic> json) => Institute(
      name: json['name'] as String?,
      displayableName: json['displayableName'] as String?,
      minFloor: (json['minFloor'] as num?)?.toInt(),
      maxFloor: (json['maxFloor'] as num?)?.toInt(),
      url: json['url'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      icon: json['icon'] == null
          ? null
          : Icon.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InstituteToJson(Institute instance) => <String, dynamic>{
      'name': instance.name,
      'displayableName': instance.displayableName,
      'minFloor': instance.minFloor,
      'maxFloor': instance.maxFloor,
      'url': instance.url,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'icon': instance.icon,
    };

Icon _$IconFromJson(Map<String, dynamic> json) => Icon(
      url: json['url'] as String?,
      alt: json['alt'] as String?,
    );

Map<String, dynamic> _$IconToJson(Icon instance) => <String, dynamic>{
      'url': instance.url,
      'alt': instance.alt,
    };

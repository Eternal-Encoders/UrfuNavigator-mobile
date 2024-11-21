// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Floor _$FloorFromJson(Map<String, dynamic> json) => Floor(
      institute: json['institute'] as String?,
      floor: (json['floor'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      audiences: (json['audiences'] as List<dynamic>?)
          ?.map((e) => Audience.fromJson(e as Map<String, dynamic>))
          .toList(),
      service: (json['service'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FloorToJson(Floor instance) => <String, dynamic>{
      'institute': instance.institute,
      'floor': instance.floor,
      'width': instance.width,
      'height': instance.height,
      'audiences': instance.audiences,
      'service': instance.service,
    };

Audience _$AudienceFromJson(Map<String, dynamic> json) => Audience(
      id: json['id'] as String?,
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      fill: json['fill'] as String?,
      stroke: json['stroke'] as String?,
      pointId: json['pointId'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
          .toList(),
      doors: (json['doors'] as List<dynamic>?)
          ?.map((e) => Door.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AudienceToJson(Audience instance) => <String, dynamic>{
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'fill': instance.fill,
      'stroke': instance.stroke,
      'pointId': instance.pointId,
      'children': instance.children,
      'doors': instance.doors,
    };

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      type: json['type'] as String?,
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      identifier: json['identifier'] as String?,
      alignX: json['alignX'] as String?,
      alignY: json['alignY'] as String?,
    );

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'type': instance.type,
      'x': instance.x,
      'y': instance.y,
      'identifier': instance.identifier,
      'alignX': instance.alignX,
      'alignY': instance.alignY,
    };

Door _$DoorFromJson(Map<String, dynamic> json) => Door(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      fill: json['fill'] as String?,
    );

Map<String, dynamic> _$DoorToJson(Door instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'fill': instance.fill,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      data: json['data'] as String?,
      stroke: json['stroke'] as String?,
      fill: json['fill'],
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'data': instance.data,
      'stroke': instance.stroke,
      'fill': instance.fill,
    };

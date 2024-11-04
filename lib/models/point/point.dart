import 'package:json_annotation/json_annotation.dart';

part 'point.g.dart';

@JsonSerializable()
class Point {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "x")
  final double? x;
  @JsonKey(name: "y")
  final double? y;
  @JsonKey(name: "links")
  final List<String>? links;
  @JsonKey(name: "types")
  final List<String>? types;
  @JsonKey(name: "names")
  final List<String>? names;
  @JsonKey(name: "floor")
  final int? floor;
  @JsonKey(name: "institute")
  final String? institute;
  @JsonKey(name: "time")
  final List<Time>? time;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "info")
  final String? info;
  @JsonKey(name: "menuId")
  final String? menuId;
  @JsonKey(name: "isPassFree")
  final bool? isPassFree;
  @JsonKey(name: "stairId")
  final String? stairId;

  Point({
    this.id,
    this.x,
    this.y,
    this.links,
    this.types,
    this.names,
    this.floor,
    this.institute,
    this.time,
    this.description,
    this.info,
    this.menuId,
    this.isPassFree,
    this.stairId,
  });

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}

@JsonSerializable()
class Time {
  @JsonKey(name: "from")
  final String? from;
  @JsonKey(name: "to")
  final String? to;
  @JsonKey(name: "isDayOf")
  final dynamic isDayOf;

  Time({
    this.from,
    this.to,
    this.isDayOf,
  });

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'floor.g.dart';

@JsonSerializable()
class Floor {
  @JsonKey(name: "institute")
  final String? institute;
  @JsonKey(name: "floor")
  final int? floor;
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "audiences")
  final List<Audience>? audiences;
  @JsonKey(name: "service")
  final List<Service>? service;

  Floor({
    this.institute,
    this.floor,
    this.width,
    this.height,
    this.audiences,
    this.service,
  });

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);
}

@JsonSerializable()
class Audience {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "x")
  final double? x;
  @JsonKey(name: "y")
  final double? y;
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "fill")
  final String? fill;
  @JsonKey(name: "stroke")
  final String? stroke;
  @JsonKey(name: "pointId")
  final String? pointId;
  @JsonKey(name: "children")
  final List<Child>? children;
  @JsonKey(name: "doors")
  final List<Door>? doors;

  Audience({
    this.id,
    this.x,
    this.y,
    this.width,
    this.height,
    this.fill,
    this.stroke,
    this.pointId,
    this.children,
    this.doors,
  });

  factory Audience.fromJson(Map<String, dynamic> json) =>
      _$AudienceFromJson(json);

  Map<String, dynamic> toJson() => _$AudienceToJson(this);
}

@JsonSerializable()
class Child {
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "x")
  final double? x;
  @JsonKey(name: "y")
  final int? y;
  @JsonKey(name: "identifier")
  final String? identifier;
  @JsonKey(name: "alignX")
  final String? alignX;
  @JsonKey(name: "alignY")
  final String? alignY;

  Child({
    this.type,
    this.x,
    this.y,
    this.identifier,
    this.alignX,
    this.alignY,
  });

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);

  Map<String, dynamic> toJson() => _$ChildToJson(this);
}

@JsonSerializable()
class Door {
  @JsonKey(name: "x")
  final double? x;
  @JsonKey(name: "y")
  final double? y;
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "height")
  final double? height;
  @JsonKey(name: "fill")
  final String? fill;

  Door({
    this.x,
    this.y,
    this.width,
    this.height,
    this.fill,
  });

  factory Door.fromJson(Map<String, dynamic> json) => _$DoorFromJson(json);

  Map<String, dynamic> toJson() => _$DoorToJson(this);
}

@JsonSerializable()
class Service {
  @JsonKey(name: "x")
  final double? x;
  @JsonKey(name: "y")
  final double? y;
  @JsonKey(name: "data")
  final String? data;
  @JsonKey(name: "stroke")
  final String? stroke;
  @JsonKey(name: "fill")
  final dynamic fill;

  Service({
    this.x,
    this.y,
    this.data,
    this.stroke,
    this.fill,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

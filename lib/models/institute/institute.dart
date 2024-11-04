import 'package:json_annotation/json_annotation.dart';

part 'institute.g.dart';

@JsonSerializable()
class Institute {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "displayableName")
  final String? displayableName;
  @JsonKey(name: "minFloor")
  final int? minFloor;
  @JsonKey(name: "maxFloor")
  final int? maxFloor;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "latitude")
  final double? latitude;
  @JsonKey(name: "longitude")
  final double? longitude;
  @JsonKey(name: "icon")
  final Icon? icon;

  Institute({
    this.name,
    this.displayableName,
    this.minFloor,
    this.maxFloor,
    this.url,
    this.latitude,
    this.longitude,
    this.icon,
  });

  factory Institute.fromJson(Map<String, dynamic> json) =>
      _$InstituteFromJson(json);

  Map<String, dynamic> toJson() => _$InstituteToJson(this);
}

@JsonSerializable()
class Icon {
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "alt")
  final String? alt;

  Icon({
    this.url,
    this.alt,
  });

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);

  Map<String, dynamic> toJson() => _$IconToJson(this);
}

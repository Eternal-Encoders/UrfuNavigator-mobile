import 'package:json_annotation/json_annotation.dart';
import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';

part 'path.g.dart';

@JsonSerializable()
class Path {
  @JsonKey(name: "result")
  final Map<String, Map<String, List<List<Point>>>>? result;

  Path({
    this.result,
  });

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);

  Map<String, dynamic> toJson() => _$PathToJson(this);
}

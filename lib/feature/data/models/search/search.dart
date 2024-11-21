import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

class SearchList {
  List<Search>? searchs;
  SearchList({required this.searchs});

  factory SearchList.fromJson(List<dynamic> json) {
    var searchsJson = json;

    List<Search> searchList =
        searchsJson.map((e) => Search.fromJson(e)).toList();

    return SearchList(
      searchs: searchList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'searchs': searchs,
    };
  }
}

@JsonSerializable()
class Search {
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
  final dynamic menuId;
  @JsonKey(name: "isPassFree")
  final dynamic isPassFree;
  @JsonKey(name: "stairId")
  final dynamic stairId;

  Search({
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

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
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

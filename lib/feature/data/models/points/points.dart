import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';

class PointsList {
  List<Point>? points;
  PointsList({required this.points});

  factory PointsList.fromJson(List<dynamic> json) {
    var pointsJson = json;

    List<Point> pointsList = pointsJson.map((e) => Point.fromJson(e)).toList();

    return PointsList(points: pointsList);
  }

  Map<String, dynamic> toJson() {
    return {
      'points': points,
    };
  }
}

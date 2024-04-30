class Time {
  bool? isDayOff;
  late String from;
  late String to;
}

class GraphPoint {
  late String id;
  late double x;
  late double y;
  late List<String> links;
  late List<String> types;
  late List<String> names;
  late int floor;
  late String institute;
  late (Time?, Time?, Time?, Time?, Time?, Time?, Time?) time;
  late String description;
  late String info;
  late String? menuId;
  late bool? isPassFree;
  late String? stairId;
}

class StairLinks {
  late String id;
  late int floor;
}

class Stair {
  late String stairPoint;
  late List<StairLinks> links;
}
class AuditoriumDoors {
  final double x;
  final double y;
  final double width;
  final double height;
  final String fill;

  const AuditoriumDoors({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.fill,
  });

  factory AuditoriumDoors.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'x': dynamic x,
        'y': dynamic y,
        'width': dynamic width,
        'height': dynamic height,
        'fill': String fill
      } => AuditoriumDoors(
        x: x.toDouble(), 
        y: y.toDouble(), 
        width: width.toDouble(), 
        height: height.toDouble(), 
        fill: fill
      ),
      _ => throw const FormatException('Failed to load AuditoriumDoors')
    };
  }
}

class AuditoriumChild {
  final String type;
  final double x;
  final double y;
  final String identifier;
  final String? alignX;
  final String? alignY;

  const AuditoriumChild({
    required this.type,
    required this.x,
    required this.y,
    required this.identifier,
    this.alignX,
    this.alignY,
  });

  factory AuditoriumChild.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'type': String type,
        'x': dynamic x,
        'y': dynamic y,
        'identifier': String identifier
      } => AuditoriumChild(
        type: type, 
        x: x.toDouble(), 
        y: y.toDouble(), 
        identifier: identifier,
        alignX: json['alignX'],
        alignY: json['alignY']
      ),
      _ => throw const FormatException('Failed to load AuditoriumChild')
    };
  }
}
  
class Auditorium {
  final String id;
  final double x;
  final double y;
  final double width;
  final double height;
  final String? fill;
  final String? stroke;
  final String? pointId;
  final List<AuditoriumChild> children;
  final List<AuditoriumDoors> doors;

  const Auditorium({
    required this.id,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.children,
    required this.doors,
    this.fill,
    this.stroke,
    this.pointId,
  });

  factory Auditorium.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'id': String id,
        'x': dynamic x,
        'y': dynamic y,
        'width': dynamic width,
        'height': dynamic height,
        'children': List<dynamic> children,
        'doors': List<dynamic> doors
      } => Auditorium(
        id: id, 
        x: x.toDouble(), 
        y: y.toDouble(), 
        width: width.toDouble(), 
        height: height.toDouble(), 
        children: children.map((currentChildren) => AuditoriumChild.fromJson(currentChildren)).toList(), 
        doors: doors.map((currentDoors) => AuditoriumDoors.fromJson(currentDoors)).toList(),
        fill: json['fill'],
        stroke: json['stroke'],
        pointId: json['pointId']
      ),
      _ => throw const FormatException('Failed to load Auditorium')
    };
  }
}

class Service {
  final double x;
  final double y;
  final String data;
  final String? stroke;
  final String? fiil;

  const Service({
    required this.x,
    required this.y,
    required this.data,
    this.stroke,
    this.fiil
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'x': dynamic x,
        'y': dynamic y,
        'data': String data
      } => Service(
        x: x.toDouble(), 
        y: y.toDouble(), 
        data: data,
        stroke: json['stroke'],
        fiil: json['fiil']
      ),
      _ => throw const FormatException('Failed to load Service')
    };
  }
}

class MapObject {
  final List<Service> service;
  final List<Auditorium> audiences;
  final double width;
  final double height;

  const MapObject({
    required this.service,
    required this.audiences,
    required this.width,
    required this.height
  });

  factory MapObject.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'width': dynamic width,
        'height': dynamic height,
        'service': List<dynamic> service,
        'audiences': List<dynamic> audiences
      } => MapObject(
        service: service.map((currentService) => Service.fromJson(currentService)).toList(), 
        audiences: audiences.map((currentAudiences) => Auditorium.fromJson(currentAudiences)).toList(),
        width: width.toDouble(), 
        height: height.toDouble()
      ), 
      _ => throw const FormatException('Failed to load MapObject')
    };
  }
}
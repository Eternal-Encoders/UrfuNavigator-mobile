import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:urfu_navigator_mobile/helpers/color_helper.dart';
import 'package:urfu_navigator_mobile/helpers/text_helper.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

part 'floor.g.dart';

@JsonSerializable()
class Floor {
  @JsonKey(name: "institute")
  final String? institute;
  @JsonKey(name: "floor")
  final int? floor;
  @JsonKey(name: "width")
  final double? width;
  @JsonKey(name: "height")
  final double? height;
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

  static List<Widget> getFloor(
    Floor floor,
    Map<String, PictureInfo?> svgPictures,
  ) {
    List<Widget> filledAudiences = [];
    List<Widget> filledServices = [];

    for (var auditorium in floor.audiences!) {
      filledAudiences.add(Audience.getRectAudience(
        key: auditorium.id,
        x: auditorium.x,
        y: auditorium.y,
        width: auditorium.width,
        height: auditorium.height,
        stroke: auditorium.stroke,
        fill: auditorium.fill,
        children: auditorium.children,
        doors: auditorium.doors,
        svgPictures: svgPictures,
      ));
    }

    for (var service in floor.service!) {
      filledServices.add(Service.getRectService(
        x: service.x,
        y: service.y,
        data: service.data,
        fill: service.fill,
        stroke: service.stroke,
      ));
    }
    //TODO: add with service after implementation
    return filledAudiences;
  }

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);
}

class AudiencePainter extends CustomPainter {
  AudiencePainter(
      {required this.x,
      required this.y,
      required this.stroke,
      required this.fill,
      required this.width,
      required this.height,
      required this.children,
      required this.svgPictures,
      required this.doors});

  double? x;
  double? y;
  String? stroke;
  String? fill;
  double? width;
  double? height;
  List<Child>? children;
  List<Door>? doors;
  Map<String, PictureInfo?> svgPictures;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(Constants.CANVAS_SCALE);

    paintRectStroke(canvas);

    paintFilledRect(canvas);

    paintTextAndIcons(size, canvas);

    paintDoors(canvas);
  }

  void paintDoors(Canvas canvas) {
    if (doors != null) {
      if (doors!.isNotEmpty) {
        for (var door in doors!) {
          canvas.save();
          canvas.translate(x!, y!);
          Paint paint = Paint();
          paint.color = HexColor(door.fill!);
          paint.strokeWidth = Constants.PAINT_DOOR_STROKE_WIDTH;
          paint.style = PaintingStyle.fill;
          final p1 = Offset(door.x! + 2.5, door.y! + 2.5);
          final p2 =
              Offset(door.x! + 2.5 + door.width!, door.y! + 2.5 + door.height!);
          canvas.drawLine(p1, p2, paint);
          canvas.restore();
        }
      }
    }
  }

  void paintTextAndIcons(Size size, Canvas canvas) {
    if (children != null) {
      if (children!.isNotEmpty) {
        for (var child in children!) {
          switch (child.type) {
            case 'text':
              paintText(child, size, canvas);
            case 'icon':
              switch (child.identifier) {
                case 'Лестница вверх':
                  if (svgPictures['stairsUp'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['stairsUp']!.picture);
                    canvas.restore();
                  }
                case 'Лестница вниз':
                  if (svgPictures['stairsDown'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['stairsDown']!.picture);
                    canvas.restore();
                  }
                case 'Банкомат':
                  if (svgPictures['atm'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['atm']!.picture);
                    canvas.restore();
                  }
                case 'Торговый автомат':
                  if (svgPictures['vending'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['vending']!.picture);
                    canvas.restore();
                  }
                case 'Столовая':
                  if (svgPictures['dinning'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['dinning']!.picture);
                    canvas.restore();
                  }
                case 'Женский туалет':
                  if (svgPictures['toiletw'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['toiletw']!.picture);
                    canvas.restore();
                  }
                case 'Мужской туалет':
                  if (svgPictures['toiletm'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['toiletm']!.picture);
                    canvas.restore();
                  }
                case 'Кафе':
                  if (svgPictures['cafe'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['cafe']!.picture);
                    canvas.restore();
                  }
                case 'Коворкинг':
                  if (svgPictures['coworking'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['coworking']!.picture);
                    canvas.restore();
                  }
                case 'Гардероб':
                  if (svgPictures['wardrobe'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['wardrobe']!.picture);
                    canvas.restore();
                  }
                case 'Лифт':
                  if (svgPictures['elevator'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['elevator']!.picture);
                    canvas.restore();
                  }
                case 'Принтер':
                  if (svgPictures['printer'] != null) {
                    canvas.save();
                    // canvas.scale(50, 50);
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['printer']!.picture);
                    canvas.restore();
                  }
                default:
                  print('Нет ${child.identifier} иконки');
                  return;
              }
            default:
              print('Нет ${child.type} типа иконок');
              return;
          }
        }
      }
    }
  }

  void paintText(Child child, Size size, Canvas canvas) {
    const textStyle = TextStyle(
      color: Color(0xFF3A3A3A),
      fontSize: 16,
    );
    var textSpan = TextSpan(
      text: child.identifier,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: convertAlign(child.alignX ?? ''),
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = x! +
        child.x! +
        textPainter.width / 2 * Constants.CANVAS_TEXT_OFFSET_RATIO;
    final yCenter = y! +
        child.y! +
        textPainter.height / 2 * Constants.CANVAS_TEXT_OFFSET_RATIO;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  void paintFilledRect(Canvas canvas) {
    canvas.save();
    Paint paintWidth = Paint();
    paintWidth.color = HexColor(fill ?? "FCFCFC");
    paintWidth.style = PaintingStyle.fill;
    Rect rectFilled = Rect.fromLTWH(x!, y!, width!, height!);
    canvas.drawRect(rectFilled, paintWidth);
    canvas.restore();
  }

  void paintRectStroke(Canvas canvas) {
    canvas.save();
    Paint paintStroke = Paint();
    paintStroke.strokeWidth =
        stroke != null ? Constants.PAINT_AUDIENCE_STROKE_WIDTH : 0;
    paintStroke.color = HexColor(stroke ?? "FCFCFC");
    paintStroke.style = PaintingStyle.stroke;
    Rect rectStroke = Rect.fromLTWH(x!, y!, width!, height!);
    canvas.drawRect(rectStroke, paintStroke);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
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
  final double? width;
  @JsonKey(name: "height")
  final double? height;
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

  static CustomPaint getRectAudience({
    required String? key,
    required double? x,
    required double? y,
    required double? width,
    required double? height,
    required String? stroke,
    required String? fill,
    required List<Child>? children,
    required List<Door>? doors,
    required Map<String, PictureInfo?> svgPictures,
  }) {
    return CustomPaint(
      painter: AudiencePainter(
          x: x,
          y: y,
          width: width,
          height: height,
          stroke: stroke,
          fill: fill,
          children: children,
          doors: doors,
          svgPictures: svgPictures),
      size: Size(width!, height!),
    );
  }
}

@JsonSerializable()
class Child {
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "x")
  final double? x;
  @JsonKey(name: "y")
  final double? y;
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
  final double? width;
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

class ServicePainter extends CustomPainter {
  ServicePainter(
      {required this.x,
      required this.y,
      required this.data,
      required this.fill,
      required this.stroke});

  double? x;
  double? y;
  String? data;
  String? fill;
  String? stroke;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.scale(Constants.CANVAS_SCALE);
    canvas.save();
    Paint paint = Paint();

    paint.strokeWidth = 5;
    paint.color = HexColor(fill!);
    paint.style = PaintingStyle.stroke;

    // canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
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

  static CustomPaint getRectService(
      {required double? x,
      required double? y,
      required String? data,
      required fill,
      required String? stroke}) {
    return CustomPaint(
      painter:
          ServicePainter(x: x, y: y, data: data, fill: fill, stroke: stroke),
      size: Size(200, 200),
    );
  }

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

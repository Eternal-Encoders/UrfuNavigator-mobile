import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/data/models/point/point.dart';
import 'package:urfu_navigator_mobile/helpers/color_helper.dart';
import 'package:urfu_navigator_mobile/helpers/text_helper.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

part 'floor.g.dart';

class FloorPainter extends CustomPainter {
  final List<Audience> audiences;
  final List<Service> services;
  final Map<String, PictureInfo?> svgPictures;

  FloorPainter({
    required this.audiences,
    required this.services,
    required this.svgPictures,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(Constants.CANVAS_SCALE);
    // Рисуем аудитории
    for (final audience in audiences) {
      AudiencePainter(
        x: audience.x,
        y: audience.y,
        width: audience.width,
        height: audience.height,
        stroke: audience.stroke,
        fill: audience.fill,
        children: audience.children,
        doors: audience.doors,
        svgPictures: svgPictures,
      ).paint(canvas, size);
    }
    // Рисуем сервисы
    for (final service in services) {
      ServicePainter(
        x: service.x,
        y: service.y,
        data: service.data,
        fill: service.fill,
        stroke: service.stroke,
      ).paint(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PathPointer extends CustomPainter {
  final List<List<Point>>? listListOfPoints;
  final PictureInfo? svgPicture;
  int floor;

  PathPointer({
    required this.listListOfPoints,
    required this.svgPicture,
    required this.floor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(Constants.CANVAS_SCALE);
    // Рисуем аудитории
    paintRoute(canvas, size);
  }

  void paintRoute(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (var pathPoints in listListOfPoints!) {
      if (pathPoints.isNotEmpty) {
        final path = Path();
        path.moveTo(pathPoints[0].x!, pathPoints[0].y!); // Начальная точка

        for (var point in pathPoints.skip(1)) {
          path.lineTo(point.x!, point.y!); // Провести линии к следующим точкам
        }
        canvas.drawPath(path, paint);
        // Нарисовать путь
        drawRoutePointWithRotation(canvas, pathPoints, pathPoints[0].x!,
            pathPoints[0].y!, pathPoints[1].x!, pathPoints[1].y!, true);

        drawRoutePointWithRotation(
            canvas,
            pathPoints,
            pathPoints[pathPoints.length - 1].x!,
            pathPoints[pathPoints.length - 1].y!,
            pathPoints[pathPoints.length - 2].x!,
            pathPoints[pathPoints.length - 2].y!,
            false);
      }
    }
  }

  void drawRoutePointWithRotation(
      Canvas canvas,
      List<Point> pathPoints,
      double firstPointX,
      double firstPointY,
      double secondPointX,
      double secondPointY,
      bool isEnd) {
    canvas.save();

    // Перемещаем канвас к первой точке
    canvas.translate(
      firstPointX,
      firstPointY,
    );

    // Вычисляем угол между двумя точками
    double angle = atan2(
      secondPointY - firstPointY,
      secondPointX - firstPointX,
    );

    // Поворачиваем канвас на вычисленный угол
    canvas.rotate(isEnd
        ? (angle == 0 ? -pi : (angle.toInt() == -3 ? 0 : -angle))
        : angle);

    // Сдвигаем канвас обратно на половину ширины и высоты указателя,
    // чтобы центрировать изображение указателя.
    canvas.translate(
      -svgPicture!.size.width / 2,
      -svgPicture!.size.height / 2,
    );

    // Рисуем указатель
    canvas.drawPicture(svgPicture!.picture);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

CustomPaint getFloorPaint(
  List<Audience> audiences,
  List<Service> services,
  Map<String, PictureInfo?> svgPictures,
  double width,
  double height,
) {
  print('width: $width, height: $height');
  print('width2: ${width / 6.5}, height2: ${height / 6.5}');
  return CustomPaint(
    isComplex: false,
    willChange: true,
    painter: FloorPainter(
      audiences: audiences,
      services: services,
      svgPictures: svgPictures,
    ),
    size: Size(width / 6.5, height / 6.5),
  );
}

CustomPaint getPath(
  List<List<Point>>? listListOfPoints,
  PictureInfo? svgPicture,
  double width,
  double height,
  int floor,
) {
  print('path-width: $width, path-height: $height');
  print('path-width2: ${width / 6.5}, path-height2: ${height / 6.5}');
  return CustomPaint(
    isComplex: false,
    willChange: true,
    painter: PathPointer(
      listListOfPoints: listListOfPoints,
      svgPicture: svgPicture,
      floor: floor,
    ),
    size: Size(width / 6.5, height / 6.5),
  );
}

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
    // canvas.scale(Constants.CANVAS_SCALE);

    paintFilledRect(canvas);

    paintRectStroke(canvas);

    paintTextAndIcons(size, canvas);

    paintDoors(canvas);
  }

  void paintDoors(Canvas canvas) {
    if (doors != null) {
      if (doors!.isNotEmpty) {
        for (var door in doors!) {
          canvas.save();
          canvas.translate(x!, y!);
          Paint paint = Paint()
            ..color = HexColor(door.fill ?? '#cccccc')
            ..strokeWidth = Constants.PAINT_DOOR_STROKE_WIDTH
            ..style = PaintingStyle.fill;
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
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['stairsUp']!.picture);
                    canvas.restore();
                  }
                case 'Лестница вниз':
                  if (svgPictures['stairsDown'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['stairsDown']!.picture);
                    canvas.restore();
                  }
                case 'Банкомат':
                  if (svgPictures['atm'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['atm']!.picture);
                    canvas.restore();
                  }
                case 'Торговый автомат':
                  if (svgPictures['vending'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['vending']!.picture);
                    canvas.restore();
                  }
                case 'Столовая':
                  if (svgPictures['dinning'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['dinning']!.picture);
                    canvas.restore();
                  }
                case 'Женский туалет':
                  if (svgPictures['toiletw'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['toiletw']!.picture);
                    canvas.restore();
                  }
                case 'Мужской туалет':
                  if (svgPictures['toiletm'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['toiletm']!.picture);
                    canvas.restore();
                  }
                case 'Кафе':
                  if (svgPictures['cafe'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['cafe']!.picture);
                    canvas.restore();
                  }
                case 'Коворкинг':
                  if (svgPictures['coworking'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['coworking']!.picture);
                    canvas.restore();
                  }
                case 'Гардероб':
                  if (svgPictures['wardrobe'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['wardrobe']!.picture);
                    canvas.restore();
                  }
                case 'Лифт':
                  if (svgPictures['elevator'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['elevator']!.picture);
                    canvas.restore();
                  }
                case 'Принтер':
                  if (svgPictures['printer'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['printer']!.picture);
                    canvas.restore();
                  }
                case 'Указатель Ф':
                  if (svgPictures['routePoint'] != null) {
                    canvas.save();
                    canvas.translate(x! + child.x!, y! + child.y!);
                    canvas.drawPicture(svgPictures['routePoint']!.picture);
                    canvas.restore();
                  }
                default:
                  developer.log('Нет ${child.identifier} иконки');
                  return;
              }
            default:
              developer.log('Нет ${child.type} типа иконок');
              return;
          }
        }
      }
    }
  }

  void paintText(Child child, Size size, Canvas canvas) {
    const textStyle = TextStyle(
      color: AppColors.accentGrayDark,
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
    Paint paint = Paint();
    paint.color = HexColor(fill ?? "FCFCFC");
    paint.style = PaintingStyle.fill;
    Rect rectFilled = Rect.fromLTWH(x!, y!, width!, height!);
    canvas.drawRect(rectFilled, paint);
  }

  void paintRectStroke(Canvas canvas) {
    Paint paint = Paint();
    paint.strokeWidth =
        stroke != null ? Constants.PAINT_AUDIENCE_STROKE_WIDTH : 0;
    paint.color = HexColor(stroke ?? "FCFCFC");
    paint.style = PaintingStyle.stroke;
    Rect rectStroke = Rect.fromLTWH(x!, y!, width!, height!);
    canvas.drawRect(rectStroke, paint);
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
    canvas.save();
    canvas.translate(x!, y!);
    if (x != null && y != null && data != null) {
      var border = Paint()
        ..color = HexColor(stroke ?? fill ?? '#cccccc')
        ..strokeWidth = Constants.PAINT_SERVICE_STROKE_WIDTH
        ..style = PaintingStyle.stroke;
      canvas.drawPath(parseSvgPath(data!), border);
    }
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

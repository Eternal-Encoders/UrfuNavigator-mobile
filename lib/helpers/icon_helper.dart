import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart' show rootBundle;

/// Load [Image] from asset path.
/// https://stackoverflow.com/a/61338308/1321917
Future<ui.Image> loadUiImage(String assetPath) async {
  final data = await rootBundle.load(assetPath);
  final list = Uint8List.view(data.buffer);
  final completer = Completer<ui.Image>();
  ui.decodeImageFromList(list, completer.complete);
  return completer.future;
}

//ICONS
enum EIcon {
  atm,
  cafe,
  coworking,
  dinning,
  elevator,
  print,
  stairsdown,
  stairsup,
  toiletm,
  toiletw,
  vending,
  wardrobe
}

extension EIconExtension on EIcon {
  static const List<EIcon> values = EIcon.values;

  int get index => values.indexOf(this);

  String get nameRU {
    switch (this) {
      case EIcon.atm:
        return 'Банкомат';
      case EIcon.cafe:
        return 'Кафе';
      case EIcon.coworking:
        return 'Коворкинг';
      case EIcon.dinning:
        return 'Столовая';
      case EIcon.elevator:
        return 'Лифт';
      case EIcon.print:
        return 'Принтер';
      case EIcon.stairsdown:
        return 'Лестница вниз';
      case EIcon.stairsup:
        return 'Лестница вверх';
      case EIcon.toiletm:
        return 'Мужской туалет';
      case EIcon.toiletw:
        return 'Женский туалет';
      case EIcon.vending:
        return 'Торговый автомат';
      case EIcon.wardrobe:
        return 'Гардероб';
      default:
        return 'no such icon';
    }
  }
}

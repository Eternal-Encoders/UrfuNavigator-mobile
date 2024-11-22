import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapModel extends ChangeNotifier {
  bool _cameraPositionChanged = false;
  CameraUpdateReason _cameraPositionChangedReason = CameraUpdateReason.gestures;
  CameraPosition _cameraPosition =
      CameraPosition(target: Point(latitude: 0, longitude: 0));

  bool get cameraPositionChangedValue => _cameraPositionChanged;
  CameraUpdateReason get cameraPositionChangedReasonValue =>
      _cameraPositionChangedReason;
  CameraPosition get cameraPositionValue => _cameraPosition;
  bool get userChangedMap =>
      _cameraPositionChangedReason == CameraUpdateReason.application
          ? true
          : false;

  void onCameraPositionChanged(position, reason, isChanged) {
    _cameraPositionChanged = isChanged;
    _cameraPositionChangedReason = reason;
    _cameraPosition = position;
    log('camera position reason: $userChangedMap');
    notifyListeners();
  }
}

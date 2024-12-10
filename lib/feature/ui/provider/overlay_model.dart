import 'package:flutter/material.dart';

class OverlayModel extends ChangeNotifier {
  bool _isVisible = false;

  bool get isVisibleValue => _isVisible;

  void getVisibleOrNot() {
    _isVisible ? _isVisible = false : _isVisible = true;
    notifyListeners();
  }
}

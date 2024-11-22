import 'package:flutter/material.dart';

class InstituteModel extends ChangeNotifier {
  String _selectedInstitute = '';

  String get selectedInstitute => _selectedInstitute;

  void changeSelectedInstitute(institute) {
    _selectedInstitute = institute;
    notifyListeners();
  }

  String _url = '';

  String get url => _url;

  void changeUrl(url) {
    _url = url;
    notifyListeners();
  }

  int _selectedFloor = 1;

  int get selectedFloor => _selectedFloor;

  void changeSelectedFloor(floor) {
    _selectedFloor = floor;
    notifyListeners();
  }
}

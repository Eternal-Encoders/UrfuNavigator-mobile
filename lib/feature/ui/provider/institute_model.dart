import 'package:flutter/material.dart';

class InstituteModel extends ChangeNotifier {
  String _selectedInstitute = '';

  String get selectedInstitute => _selectedInstitute;
  String _selectedLastInstitute = '';

  String get selectedLastInstitute => _selectedLastInstitute;

  void changeSelectedInstitute(institute) {
    _selectedLastInstitute = _selectedInstitute;
    _selectedInstitute = institute;
    notifyListeners();
  }

  int _selectedFloor = 1;

  int get selectedFloor => _selectedFloor;
  int _selectedLastFloor = 1;

  int get selectedLastFloor => _selectedLastFloor;

  void changeSelectedFloor(floor) {
    _selectedLastFloor = _selectedFloor;
    _selectedFloor = floor;
    notifyListeners();
  }

  String _url = '';

  String get url => _url;

  void changeUrl(url) {
    _url = url;
    notifyListeners();
  }
}

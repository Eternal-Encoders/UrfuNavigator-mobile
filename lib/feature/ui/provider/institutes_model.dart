import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';

class InstitutesModel extends ChangeNotifier {
  InstitutesList _institutes = InstitutesList(institutes: List.empty());

  InstitutesList get institutes => _institutes;

  void saveInstitutes(institutes) {
    _institutes = institutes;
    notifyListeners();
  }
}

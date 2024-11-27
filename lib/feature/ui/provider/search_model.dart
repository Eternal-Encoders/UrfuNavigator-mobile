import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/feature/data/models/search/search.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class SearchModel extends ChangeNotifier {
  String _selectedQuery = '';

  String get selectedQuery => _selectedQuery;

  SearchList _searchList = SearchList(searchs: List.empty());

  SearchList get searchList => _searchList;

  EEvent _selectedEvent = EEvent.none;

  EEvent get calledByEvent => _selectedEvent;

  void changeEvent(EEvent event) {
    print('_selectedEvent: $_selectedEvent');
    _selectedEvent = event;
    notifyListeners();
  }

  void changeSelectedQuery(query) {
    _lastQuery = _selectedQuery;
    _selectedQuery = query;
    notifyListeners();
  }

  void changeSearch(searchList) {
    _searchList = searchList;
    notifyListeners();
  }

  String _lastQuery = '';

  String get lastQuery => _lastQuery;

  bool get isAnotherQuery => lastQuery == selectedQuery;
}

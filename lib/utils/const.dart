// ignore_for_file: constant_identifier_names

const pointTypes = {
  'Corridor': "corridor",
  'Auditorium': "auditorium",
  'Dinning': "dinning",
  'Exit': "exit",
  'Stair': "stair",
  'ToiletM': "toilet-m",
  'ToiletW': "toilet-w",
  'Cafe': "cafe",
  'Vending': "vending",
  'Coworking': "coworking",
  'Atm': "atm",
  'Wardrobe': "wardrobe",
  'Print': "print",
  'Deanery': "deanery",
  'Students': "students",
  'Other': "other"
};

enum EPointTypes {
  corridor,
  auditorium,
  dinning,
  exit,
  stair,
  toiletm,
  toiletw,
  cafe,
  vending,
  coworking,
  atm,
  wardrobe,
  print,
  deanery,
  students,
  other,
}

//ORDER OF BODIES
enum EBody { guk, iritrtf, fti, isa, uralanin, inmitxti, inau }

extension EBodyExtension on EBody {
  static const List<EBody> values = EBody.values;

  int get index => values.indexOf(this);

  String get imgRoute {
    switch (this) {
      case EBody.guk:
        return 'assets/img/urfu-bodies-img/GUK.png';
      case EBody.iritrtf:
        return 'assets/img/urfu-bodies-img/IRIT-RTF.png';
      case EBody.fti:
        return 'assets/img/urfu-bodies-img/FTI.png';
      case EBody.isa:
        return 'assets/img/urfu-bodies-img/ISA.png';
      case EBody.uralanin:
        return 'assets/img/urfu-bodies-img/URALANIN.png';
      case EBody.inmitxti:
        return 'assets/img/urfu-bodies-img/INMIT_XTI.png';
      case EBody.inau:
        return 'assets/img/urfu-bodies-img/INAU.png';
      default:
        return 'no such body';
    }
  }

  String get nameRU {
    switch (this) {
      case EBody.guk:
        return 'ГУК';
      case EBody.iritrtf:
        return 'ИРИТ-РТФ';
      case EBody.fti:
        return 'ФТИ';
      case EBody.isa:
        return 'ИСА';
      case EBody.uralanin:
        return 'УралЭНИН';
      case EBody.inmitxti:
        return 'ИнМИТ/ХТИ';
      case EBody.inau:
        return 'ИнЭУ';
      default:
        return 'no such name';
    }
  }
}

const pointTranslation = {
  "corridor": "Коридор",
  "auditorium": "Аудитория",
  "dinning": "Столовая",
  "exit": "Вход/Выход",
  "stair": "Лестница",
  "toilet-m": "Туалет (М)",
  "toilet-w": "Туалет (Ж)",
  "cafe": "Кафе",
  "vending": "Вендинг",
  "coworking": "Коворкинг",
  "atm": "Банкомат",
  "wardrobe": "Гардероб",
  "print": "Печать",
  "deanery": "Деканат",
  "students": "Союз Студентов",
  "other": "Другое..."
};

const instColors = {
  "ИРИТ-РТФ": "#265D93",
  "ГУК": "#E77011",
  "УРАЛЭНИН": "#46296A",
  "ИНМИТ-ХТИ": "#68A357",
  "ИСА": "#A02B09",
  "УГИ": "#662B73"
};

class Constants {
  static const String API_DOMAIN = 'dev.how-to-navigate.ru';
  static const String API_PATH_INSTITUTES = 'api/institutes';
  static const String API_PATH_INSTITUTE = 'api/institute';
  static const String API_PATH_FLOOR = 'api/floor';
  static const String API_PATH_POINTS = 'api/points';
  static const String API_PATH_POINT = 'api/point';
  static const String API_PATH_PATH = 'api/path';
  static const String API_PATH_SEARCH = 'api/search';
}

class RoutePaths {
  static const String main = '/';
  static const String guk = '/guk';
  static const String iritrtf = '/iritrtf';
  static const String fti = '/fti';
  static const String isa = '/isa';
  static const String uralanin = '/uralanin';
  static const String inmitxti = '/inmitxti';
  static const String inau = '/inau';
  static const String ugi = '/ugi';
}

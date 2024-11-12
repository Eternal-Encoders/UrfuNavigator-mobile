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

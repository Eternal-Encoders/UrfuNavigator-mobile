import 'dart:ui';

TextAlign convertAlign(String alignX) {
  switch (alignX) {
    case 'LEFT':
      return TextAlign.left;
    case 'CENTER':
      return TextAlign.right;
    case 'RIGHT':
      return TextAlign.right;
    case 'JUSTIFIED':
      return TextAlign.justify;
    default:
      return TextAlign.center;
  }
}

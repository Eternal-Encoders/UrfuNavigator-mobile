import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';

class RouteCategoryCard extends StatelessWidget {
  const RouteCategoryCard({
    super.key,
    required this.title,
    required this.textStyle,
    required this.icon,
  });

  final String title;
  final TextStyle textStyle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 22),
      height: 34,
      width: _calculateTextWidth(title, textStyle) + 79,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.secondPaleGrayLight,
            strokeAlign: 1,
            style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: textStyle,
          ),
        ],
      ),
    );
  }

  double _calculateTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(); // Рассчитываем размеры текста
    return textPainter.size.width;
  }
}

import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';

class SliderText extends StatefulWidget {
  const SliderText({
    super.key,
    required this.screenSize,
    required this.title,
    required this.isActive,
  });

  final Size screenSize;
  final String title;
  final bool isActive;

  @override
  State<SliderText> createState() => _SliderTextState();
}

class _SliderTextState extends State<SliderText> {
  //UI
  final double sliderWidthRatio = 0.43;
  final double sliderHeight = 34;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: sliderHeight,
      width: widget.screenSize.width * sliderWidthRatio,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: widget.isActive
            ? AppColors.secondOrangeLight
            : AppColors.mainWhiteLight,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 12,
            color:
                widget.isActive ? AppColors.accentOrange : AppColors.accentGray,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

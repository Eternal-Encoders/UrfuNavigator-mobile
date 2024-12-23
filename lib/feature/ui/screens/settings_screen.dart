import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/arrow_back.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 76,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingsArrowBack(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Настройки',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.accentGrayDark,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

class SettingsArrowBack extends StatelessWidget {
  const SettingsArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(0.0),
        height: 24,
        width: 24,
        child: ArrowBackWidget());
  }
}

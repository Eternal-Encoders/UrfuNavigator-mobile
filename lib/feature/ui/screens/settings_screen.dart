import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/arrow_back.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/section_item.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                SizedBox(
                  height: 24,
                ),
                SectionItemWidget(
                  title: Constants.SETTINGS_LANGUAGE_TITLE,
                  subTitle: Constants.SETTINGS_LANGUAGE_SUBTITLE,
                  icon: Icons.language_outlined,
                  handler: () => Navigator.pushNamed(
                    context,
                    RoutePaths.language,
                  ).then((_) {
                    if (context.mounted) {
                      log('language screen closed');
                    }
                  }),
                  hasDivider: false,
                ),
                SectionItemWidget(
                  title: Constants.SETTINGS_PERSONALIZATION_TITLE,
                  subTitle: Constants.SETTINGS_PERSONALIZATION_SUBTITLE,
                  icon: Icons.auto_awesome_outlined,
                  handler: null,
                  hasDivider: false,
                ),
                SectionItemWidget(
                  title: Constants.SETTINGS_NOTIFICATION_TITLE,
                  subTitle: Constants.SETTINGS_NOTIFICATION_SUBTITLE,
                  icon: Icons.notifications_none_outlined,
                  handler: null,
                  hasDivider: false,
                ),
                SectionItemWidget(
                  title: Constants.SETTINGS_NEWS_TITLE,
                  subTitle: Constants.SETTINGS_NEWS_SUBTITLE,
                  icon: Icons.newspaper_outlined,
                  handler: null,
                  hasDivider: false,
                ),
                SizedBox(
                    width: screenSize.width - 32 - 32,
                    child: Divider(
                      color: AppColors.secondPaleGrayLight,
                    )),
                SizedBox(
                  width: screenSize.width - 32 - 32,
                  height: 64,
                  child: Column(
                    children: [
                      Material(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.exit_to_app_outlined,
                                  color: AppColors.accentGray,
                                  size: 24,
                                ),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultTextStyle(
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppColors.accentGrayDark),
                                        child: SizedBox(
                                          width:
                                              screenSize.width - 32 - 32 - 80,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                child:
                                                    Text('Выход из аккаунта'),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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

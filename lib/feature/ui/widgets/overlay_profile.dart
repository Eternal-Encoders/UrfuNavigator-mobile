import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/overlay_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/icon_exit.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/section_item.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayVisibility extends StatelessWidget {
  OverlayVisibility({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: context.watch<OverlayModel>().isVisibleValue,
        child: OverlayProfile());
  }
}

class OverlayProfile extends StatelessWidget {
  OverlayProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(29, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 999999,
              // blurRadius: 7,
              // offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SizedBox(
          width: screenSize.width - 32,
          height: 340,
          child: Column(
            children: [
              Stack(children: [
                IconExitWidget(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      'assets/img/overlay-favicon/favicon.png',
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 8,
              ),
              Localizations.override(
                context: context,
                locale: const Locale('en'),
                child: SectionItemWidget(
                  title: I18N(context).overlayFeedbackTitle,
                  subTitle: I18N(context).overlayFeedbackSubtitle,
                  icon: Icons.feedback_outlined,
                  handler: () => launchUrl(Uri.parse(
                      'https://forms.yandex.ru/cloud/678fc4bed04688196eb52c7b/')),
                  hasDivider: true,
                ),
              ),
              SectionItemWidget(
                title: I18N(context).reportTitle,
                subTitle: I18N(context).overlayReportSubtitle,
                icon: Icons.bug_report_outlined,
                handler: () => launchUrl(Uri.parse(
                    'https://forms.yandex.ru/cloud/678fc4bed04688196eb52c7b/')),
                hasDivider: true,
              ),
              SectionItemWidget(
                title: I18N(context).settingsTitle,
                subTitle: I18N(context).overlaySettingsSubtitle,
                icon: Icons.settings_outlined,
                hasDivider: true,
                handler: () => Navigator.pushNamed(
                  context,
                  RoutePaths.settings,
                ).then((_) {
                  if (context.mounted) {
                    log('settings screen closed');
                  }
                }),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: screenSize.width - 32 - 16,
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/img/socials/tg.png'),
                      iconSize: 48,
                      onPressed: () =>
                          launchUrl(Uri.parse('https://t.me/navigator_urfu')),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    IconButton(
                      icon: Image.asset('assets/img/socials/vk.png'),
                      iconSize: 48,
                      onPressed: () =>
                          launchUrl(Uri.parse('https://vk.com/urfu_navigator')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

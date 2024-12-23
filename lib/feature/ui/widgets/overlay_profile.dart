import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/overlay_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/icon_exit.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/section_item.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

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
                      'assets/img/favicon/favicon.png',
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 8,
              ),
              SectionItemWidget(
                title: Constants.OVERLAY_FEEDBACK_TITLE,
                subTitle: Constants.OVERLAY_FEEDBACK_SUBTITLE,
                icon: Icons.feedback_outlined,
                handler: null,
                hasDivider: true,
              ),
              SectionItemWidget(
                title: Constants.REPORT_TITLE,
                subTitle: Constants.OVERLAY_REPORT_SUBTITLE,
                icon: Icons.bug_report_outlined,
                handler: null,
                hasDivider: true,
              ),
              SectionItemWidget(
                title: Constants.OVERLAY_SETTINGS_TITLE,
                subTitle: Constants.OVERLAY_SETTINGS_SUBTITLE,
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
                    Image.asset(
                      'assets/img/socials/tg.png',
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Image.asset(
                      'assets/img/socials/vk.png',
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

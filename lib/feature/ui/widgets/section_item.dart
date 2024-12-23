import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';

class SectionItemWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? handler;
  const SectionItemWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.handler,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width - 32 - 32,
      height: 64,
      child: Column(
        children: [
          Material(
            child: InkWell(
              onTap: () {
                if (handler != null) {
                  handler!();
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      color: AppColors.accentGrayDark,
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
                              width: screenSize.width - 32 - 32 - 80,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      title,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 4,
                        ),
                        DefaultTextStyle(
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: AppColors.accentGrayDark),
                            child: SizedBox(
                              width: screenSize.width - 32 - 32 - 40,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      subTitle,
                                    ),
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
          SizedBox(
            width: screenSize.width - 32 - 32,
            child: Divider(
              height: 1,
              color: Color.fromARGB(40, 204, 204, 204),
            ),
          ),
        ],
      ),
    );
  }
}

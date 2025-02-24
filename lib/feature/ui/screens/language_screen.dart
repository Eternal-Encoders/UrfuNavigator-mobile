import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/arrow_back.dart';
import 'package:urfu_navigator_mobile/i18n/strings.g.dart';
import 'package:urfu_navigator_mobile/locator_service.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:url_launcher/url_launcher.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  AppLocale? _language = sl<LocaleSettings>().currentLocale;

  Future<void> setLanguage(AppLocale? value) async {
    developer.log('selected language: $value');
    sl<SharedPreferences>()
        .setString(Constants.CACHED_LANGUAGE, value.toString());
    value == AppLocale.ru
        ? await sl<LocaleSettings>()
            .setLocale(AppLocale.ru, listenToDeviceLocale: true)
        : await sl<LocaleSettings>()
            .setLocale(AppLocale.en, listenToDeviceLocale: true);
    setState(() {
      _language = value;
    });
    developer.log('current language: ${sl<LocaleSettings>().currentLocale}');
  }

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
                LanguageArrowBack(),
                SizedBox(
                  height: 16,
                ),
                Text(
                  I18N(context).settingsLanguageTitle,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: screenSize.width - 32 - 32,
                      height: 64,
                      child: ListTile(
                        // trailing: Icon(Icons.flag_circle),
                        title: const Text(
                          'Русский',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.accentGrayDark),
                        ),
                        subtitle: const Text(
                          'Russian',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: AppColors.accentGrayDark),
                        ),
                        leading: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0.0),
                          height: 24,
                          width: 24,
                          child: Radio<AppLocale>(
                            activeColor: AppColors.accentGrayDark,
                            focusColor: AppColors.accentGrayDark,
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                              return AppColors.accentGrayDark;
                            }),
                            value: AppLocale.ru,
                            groupValue: _language,
                            onChanged: setLanguage,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width - 32 - 32,
                      height: 64,
                      child: ListTile(
                        title: const Text(
                          'Английский',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.accentGrayDark),
                        ),
                        subtitle: const Text(
                          'English',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: AppColors.accentGrayDark),
                        ),
                        leading: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0.0),
                          height: 24,
                          width: 24,
                          child: Radio<AppLocale>(
                            activeColor: AppColors.accentGrayDark,
                            focusColor: AppColors.accentGrayDark,
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                              return AppColors.accentGrayDark;
                            }),
                            value: AppLocale.en,
                            groupValue: _language,
                            onChanged: setLanguage,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                          onTap: () => launchUrl(Uri.parse(
                              'https://forms.yandex.ru/cloud/678fc4bed04688196eb52c7b/')),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.bug_report_outlined,
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
                                                child: Text(
                                                    I18N(context).reportTitle),
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

class LanguageArrowBack extends StatelessWidget {
  const LanguageArrowBack({
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

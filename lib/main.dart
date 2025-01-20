// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/pages/home_page.dart';
import 'package:urfu_navigator_mobile/feature/ui/pages/institute_page.dart';
import 'package:urfu_navigator_mobile/feature/ui/pages/language_page.dart';
import 'package:urfu_navigator_mobile/feature/ui/pages/route_page.dart';
import 'package:urfu_navigator_mobile/feature/ui/pages/search_page.dart';
import 'package:urfu_navigator_mobile/feature/ui/pages/settings_page.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institute_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institutes_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/map_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/overlay_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/map_screen.dart';
import 'package:urfu_navigator_mobile/i18n/strings.g.dart';
import 'package:urfu_navigator_mobile/locator_service.dart' as di;
import 'package:urfu_navigator_mobile/locator_service.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

late String? cachedLanguage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await setUserLanguage();
  AndroidYandexMap.useAndroidViewSurface = false;
  //TODO: for debug uncomment:
  // debugRepaintRainbowEnabled = true;
  // debugRepaintTextRainbowEnabled = true;
  runApp(TranslationProvider(child: const MyApp()));
}

Future<void> setUserLanguage() async {
  cachedLanguage = sl<SharedPreferences>().getString(Constants.CACHED_LANGUAGE);
  if (cachedLanguage != null) {
    cachedLanguage == AppLocale.en.toString()
        ? await LocaleSettings.setLocale(AppLocale.en)
        : await LocaleSettings.setLocale(AppLocale.ru);
  } else {
    // await LocaleSettings.setLocale(AppLocale.ru);
    await sl<LocaleSettings>().useDeviceLocale();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapModel>.value(value: MapModel()),
        ChangeNotifierProvider<OverlayModel>.value(value: OverlayModel()),
        ChangeNotifierProvider<InstituteModel>.value(
          value: InstituteModel(),
        ),
        ChangeNotifierProvider<SearchModel>.value(
          value: SearchModel(),
        ),
        ChangeNotifierProvider<InstitutesModel>.value(
          value: InstitutesModel(),
        ),
      ],
      child: MaterialApp(
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        debugShowCheckedModeBanner: false,
        // showPerformanceOverlay: true,
        title: 'UrfuApp',
        // themeMode: ThemeMode.system,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          textSelectionTheme: TextSelectionThemeData(
              selectionColor: AppColors.secondOrangeLight,
              cursorColor: AppColors.secondOrangeLight,
              selectionHandleColor: AppColors.secondOrangeLight),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: AppColors.mainWhiteLight,
            onPrimary: AppColors.accentOrangeLight,
            secondary: AppColors.secondOrangeLight,
            onSecondary: AppColors.secondRedBrown,
            error: AppColors.accentFireLight,
            onError: AppColors.secondRedBrown,
            surface: AppColors.mainWhiteLight,
            onSurface: AppColors.accentGray,
          ),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 14, color: AppColors.accentGray)),
          primarySwatch: Colors.blue,
        ),
        // darkTheme: ThemeData(),
        home: HomePage(),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case RoutePaths.main:
              return MaterialPageRoute(builder: (context) => HomePage());
            case RoutePaths.search:
              String? text = settings.arguments as String?;
              if (text != null) {
                return MaterialPageRoute(
                    builder: (context) => SearchPage(textFromRoute: text));
              } else {
                return MaterialPageRoute(builder: (context) => SearchPage());
              }

            case RoutePaths.route:
              return MaterialPageRoute(builder: (context) => RoutePage());
            case RoutePaths.institute:
              InstituteArguments data =
                  settings.arguments as InstituteArguments;

              return MaterialPageRoute(
                  builder: (context) => InstitutePage(
                        data: data,
                      ));
            case RoutePaths.settings:
              return MaterialPageRoute(builder: (context) => SettingsPage());
            case RoutePaths.language:
              return MaterialPageRoute(builder: (context) => LanguagePage());
          }
          return null;
        },
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x00000bbb),
      child: const Center(
        child: MapScreen(),
      ),
    );
  }
}

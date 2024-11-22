// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart'
    as InstituteDataModel;
import 'package:urfu_navigator_mobile/feature/ui/pages/home_page.dart';
import 'package:urfu_navigator_mobile/feature/ui/pages/institute_page.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institute_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/map_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/overlay_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/map_screen.dart';
import 'package:urfu_navigator_mobile/locator_service.dart' as di;
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  AndroidYandexMap.useAndroidViewSurface = false;
  //TODO: for debug uncomment:
  // debugRepaintRainbowEnabled = true;
  // debugRepaintTextRainbowEnabled = true;
  runApp(const MyApp());
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // showPerformanceOverlay: true,
        title: 'UrfuApp',
        // themeMode: ThemeMode.system,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFFCFCFC),
            onPrimary: Color(0xFF3A3A3A),
            secondary: Color(0xFFFFFFFF),
            onSecondary: Color(0xFF6D6D6D),
            error: Color(0xFFFCFCFC),
            onError: Color.fromARGB(255, 150, 46, 46),
            surface: Color(0xFFFCFCFC),
            onSurface: Color(0xFF6D6D6D),
          ),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 14, color: Colors.green)),
          primarySwatch: Colors.blue,
        ),
        // darkTheme: ThemeData(),
        home: HomePage(),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case RoutePaths.main:
              return MaterialPageRoute(builder: (context) => HomePage());
            case RoutePaths.institute:
              InstituteDataModel.Institute institute =
                  settings.arguments as InstituteDataModel.Institute;
              return MaterialPageRoute(
                  builder: (context) => InstitutePage(
                        institute: institute,
                      ));
          }
          return null;
        },
      ),
    );
  }
}

class TopSearchBar extends StatefulWidget {
  const TopSearchBar({
    super.key,
  });

  @override
  State<TopSearchBar> createState() => _TopSearchBarState();
}

class _TopSearchBarState extends State<TopSearchBar> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    OverlayModel state = Provider.of<OverlayModel>(context);
    return SearchAnchor(suggestionsBuilder:
        (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(3, (int index) {
        final String item = 'item $index';
        return ListTile(
            title: Text(item),
            onTap: () {
              setState(() => controller.closeView(item));
            });
      });
    }, builder: (BuildContext context, SearchController controller) {
      return SizedBox(
        height: 44,
        child: SearchBar(
          hintText: 'Поиск аудиторий и мест',
          backgroundColor: WidgetStateProperty.all(const Color(0xFFFCFCFC)),
          textStyle: WidgetStateProperty.all(const TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF3A3A3A),
              fontSize: 12,
              fontWeight: FontWeight.w500)),
          hintStyle: WidgetStateProperty.all(const TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF6D6D6D),
              fontSize: 12,
              fontWeight: FontWeight.w500)),
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.only(left: 16, right: 10)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            Tooltip(
              message: 'Profile',
              child: IconButton(
                isSelected: isDark,
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                    state.getVisibleOrNot();
                  });
                },
                icon: const Icon(
                  Icons.account_circle_rounded,
                  fill: 1,
                  color: Color(0xFF5E97F6),
                ),
                // selectedIcon: const Icon(Icons.brightness_2_outlined),
              ),
            )
          ],
        ),
      );
    });
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

class UncontainedLayoutCard extends StatelessWidget {
  const UncontainedLayoutCard({
    super.key,
    required this.index,
    required this.label,
  });

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/map_screen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

enum EBody { guk, iritrtf, fti, isa, uralanin, inmitxti, inau }

extension ImageRouteExtension on EBody {
  String get route {
    switch (this) {
      case EBody.guk:
        return 'assets/img/urfu-bodies-img/GUK.png';
      case EBody.iritrtf:
        return 'assets/img/urfu-bodies-img/IRIT-RTF.png';
      case EBody.fti:
        return 'assets/img/urfu-bodies-img/FTI.png';
      case EBody.isa:
        return 'assets/img/urfu-bodies-img/ISA.png';
      case EBody.uralanin:
        return 'assets/img/urfu-bodies-img/URALANIN.png';
      case EBody.inmitxti:
        return 'assets/img/urfu-bodies-img/INMIT_XTI.png';
      case EBody.inau:
        return 'assets/img/urfu-bodies-img/INAU.png';
      default:
        return 'no such body';
    }
  }

  String get name {
    switch (this) {
      case EBody.guk:
        return 'ГУК';
      case EBody.iritrtf:
        return 'ИРИТ-РТФ';
      case EBody.fti:
        return 'ФТИ';
      case EBody.isa:
        return 'ИСА';
      case EBody.uralanin:
        return 'УралЭНИН';
      case EBody.inmitxti:
        return 'ИнМИТ/ХТИ';
      case EBody.inau:
        return 'ИнЭУ';
      default:
        return 'no such name';
    }
  }
  // void talk() {
  //   print(this);
  // }
}

bool isSwipeUp = false;

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MapModel>.value(value: MapModel()),
        ],
        child: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _key1 = GlobalKey();
  final _key2 = GlobalKey();
  // final _key3 = GlobalKey();
  // final _key4 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          key: _key1,
          color: const Color.fromARGB(255, 241, 238, 238),
          height: screenSize.height,
          width: screenSize.width,
          child: Stack(
            children: [
              MainContent(
                key: _key2,
              ),
              // CustomBottomSheet(key: _key4),
              const Positioned(
                  top: 56, left: 10, right: 10, child: TopSearchBar()),
              const Positioned(
                  bottom: 172,
                  // bottom: 232,
                  right: 16,
                  child: FABWidget(
                    title: 'Маршрут',
                    icon: 'explore_outlined',
                    backgroundColor: 0xffFAE2CF,
                    color: 0xFFE77011,
                  )),
              const Positioned(
                  bottom: 240,
                  // bottom: 300,
                  right: 16,
                  child: FABWidget(
                    title: 'Кампус',
                    icon: 'sync_outlined',
                    backgroundColor: 0xffFCFCFC,
                    color: 0xFF6D6D6D,
                  )),
              const Positioned(
                  // bottom: 88,
                  bottom: 28,
                  left: 16,
                  child: CarouselExample()),
            ],
          ),
        ),
      ),
    );
  }
}

class FABWidget extends StatelessWidget {
  final int backgroundColor;
  final int color;
  final String title;
  final String icon;

  const FABWidget({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    MapModel state = Provider.of<MapModel>(context);
    return FloatingActionButton.extended(
      backgroundColor: Color(backgroundColor),
      // foregroundColor: Colors.black,
      onPressed: () {
        // Respond to button press
      },
      isExtended: state.userChangedMap,
      icon: Text(
        icon,
        style: TextStyle(
            fontFamily: 'MaterialIcons',
            fontSize: 24,
            color: Color(color),
            fontWeight: FontWeight.w600),
      ),
      label: Text(
        title,
        style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 12,
            color: Color(color),
            fontWeight: FontWeight.w600),
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

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 132, maxWidth: screenSize - 16),
        child: CarouselView(
          // backgroundColor: Color(value),
          itemExtent: 100,
          shrinkExtent: 100,
          children: [
            cardBody(EBody.guk.route, EBody.guk.name),
            cardBody(EBody.iritrtf.route, EBody.iritrtf.name),
            cardBody(EBody.fti.route, EBody.fti.name),
            cardBody(EBody.isa.route, EBody.isa.name),
            cardBody(EBody.uralanin.route, EBody.uralanin.name),
            cardBody(EBody.inmitxti.route, EBody.inmitxti.name),
            cardBody(EBody.inau.route, EBody.inau.name)
          ],
        ),
      ),
    );
  }

  Card cardBody(String imageRoute, String title) {
    return Card.outlined(
      // elevation: 2,
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
            color: Color.fromARGB(255, 255, 255, 255),
            strokeAlign: BorderSide.strokeAlignCenter,
            style: BorderStyle.solid,
            width: 0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
      ),
      margin: const EdgeInsets.all(0),
      child: SizedBox(
        height: 124,
        width: 100,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // textDirection: TextDirection.ltr,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // verticalDirection: VerticalDirection.down,
          children: [
            Image(
              image: AssetImage(imageRoute),
              height: 92,
              width: 100,
              fit: BoxFit.fill,
            ),
            SizedBox(
                width: 100,
                height: 32,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, top: 7),
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Color(0xFF6D6D6D),
                        fontWeight: FontWeight.w600),
                  ),
                )),
          ],
        ),
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

class MapModel extends ChangeNotifier {
  bool _cameraPositionChanged = false;
  CameraUpdateReason _cameraPositionChangedReason = CameraUpdateReason.gestures;
  CameraPosition _cameraPosition =
      CameraPosition(target: Point(latitude: 0, longitude: 0));

  bool get cameraPositionChangedValue => _cameraPositionChanged;
  CameraUpdateReason get cameraPositionChangedReasonValue =>
      _cameraPositionChangedReason;
  CameraPosition get cameraPositionValue => _cameraPosition;
  bool get userChangedMap =>
      _cameraPositionChangedReason == CameraUpdateReason.application
          ? true
          : false;

  void onCameraPositionChanged(position, reason, isChanged) {
    _cameraPositionChanged = isChanged;
    _cameraPositionChangedReason = reason;
    _cameraPosition = position;
    notifyListeners();
  }
}

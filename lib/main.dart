// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/api/institutes_api.dart';
import 'package:urfu_navigator_mobile/map_screen.dart';
import 'package:urfu_navigator_mobile/models/path/path.dart' as PathModel;
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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
          ChangeNotifierProvider<OverlayModel>.value(value: OverlayModel()),
        ],
        child: MainPage(),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RoutePaths.main:
            return MaterialPageRoute(builder: (context) => MainPage());
          case RoutePaths.guk:
            return MaterialPageRoute(builder: (context) => BodyPage());
          case RoutePaths.iritrtf:
            return MaterialPageRoute(builder: (context) => IritrtfPage());
          case RoutePaths.fti:
            return MaterialPageRoute(builder: (context) => BodyPage());
          case RoutePaths.isa:
            return MaterialPageRoute(builder: (context) => BodyPage());
          case RoutePaths.uralanin:
            return MaterialPageRoute(builder: (context) => BodyPage());
          case RoutePaths.inmitxti:
            return MaterialPageRoute(builder: (context) => BodyPage());
          case RoutePaths.inau:
            return MaterialPageRoute(builder: (context) => BodyPage());
        }
        return null;
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Home(),
        Positioned(
          top: 56,
          left: 10,
          right: 10,
          child: OverlayVisibility(),
        ),
      ],
    );
  }
}

class OverlayVisibility extends StatelessWidget {
  OverlayVisibility({super.key});

  @override
  Widget build(BuildContext context) {
    OverlayModel state = Provider.of<OverlayModel>(context);
    return Visibility(visible: state.isVisibleValue, child: OverlayProfile());
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
          color: Color(0xFFFFFFFF),
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
              SizedBox(
                width: screenSize.width - 32 - 32,
                height: 64,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.feedback_outlined,
                            color: Color(0xFF3A3A3A),
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
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 80,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Обратная связь",
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
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 40,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Расскажите о своем опыте использования приложения",
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
                    SizedBox(
                      width: screenSize.width - 32 - 32,
                      child: Divider(
                        height: 1,
                        color: Color.fromARGB(40, 204, 204, 204),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width - 32 - 32,
                height: 64,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.bug_report_outlined,
                            color: Color(0xFF3A3A3A),
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
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 80,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Сообщить об ошибке",
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
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 40,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Сообщите об ошибках в работе приложения или неточностях в картах",
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
                    SizedBox(
                      width: screenSize.width - 32 - 32,
                      child: Divider(
                        height: 1,
                        color: Color.fromARGB(40, 204, 204, 204),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width - 32 - 32,
                height: 64,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            color: Color(0xFF3A3A3A),
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
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 80,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Настройки",
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
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 40,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Смена языка, персонализация, уведомления",
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
                    SizedBox(
                      width: screenSize.width - 32 - 32,
                      child: Divider(
                        height: 1,
                        color: Color.fromARGB(40, 204, 204, 204),
                      ),
                    ),
                  ],
                ),
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

class IconExitWidget extends StatelessWidget {
  const IconExitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    OverlayModel state = Provider.of<OverlayModel>(context);
    return IconButton(
      iconSize: 24,
      padding: EdgeInsets.all(0),
      icon: Icon(Icons.close),
      onPressed: () {
        state.getVisibleOrNot();
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color.fromARGB(255, 241, 238, 238),
          height: screenSize.height,
          width: screenSize.width,
          child: Stack(
            children: [
              MainContent(),
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
      heroTag: null,

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
          onTap: (int index) {
            Navigator.pushNamed(
                context, '/${EBodyExtension.values[index].name}');
          },
          // backgroundColor: Color(value),
          itemExtent: 100,
          shrinkExtent: 100,
          children: EBody.values
              .map((EBody body) => cardBody(body.imgRoute, body.nameRU))
              .toList(),
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

class OverlayModel extends ChangeNotifier {
  bool _isVisible = false;

  bool get isVisibleValue => _isVisible;

  void getVisibleOrNot() {
    _isVisible ? _isVisible = false : _isVisible = true;
    notifyListeners();
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
    // print('camera position reason: $userChangedMap');
    notifyListeners();
  }
}

class IritrtfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IRIT-RTF PAGE'),
        centerTitle: true,
      ),
      body: Center(
        child: CustomPaint(
          painter: MasterPainter(),
          size: Size(300, 400),
        ),
      ),
    );
  }
}

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = Colors.black;
    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BodyPage extends StatefulWidget {
  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  late Future<PathModel.Path> path;

  @override
  void initState() {
    super.initState();
    path = InstitutesApi.getPath(from: '225:419', to: '248:547');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('IN DEVELOPING'),
          centerTitle: true,
        ),
        body: FutureBuilder<PathModel.Path>(
            future: path,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.result?['0']?['0']?.length,
                  itemBuilder: (context, index) {
                    print(
                        snapshot.data!.result?['ИРИТ-РТФ']?['1']?[0][0].floor);
                    return Card(
                        child: ListTile(
                      title: Text(snapshot
                              .data!.result?['ИРИТ-РТФ']?['1']?[0][0].floor
                              .toString() ??
                          'not found'),
                      subtitle: Text(snapshot
                              .data!.result?['ИРИТ-РТФ']?['1']?[0][0].floor
                              .toString() ??
                          'not found'),
                    ));
                  },
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.blue[200],
              ));
            }));
  }
}

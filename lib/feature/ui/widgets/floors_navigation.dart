import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloorsNavigation extends StatefulWidget {
  const FloorsNavigation({
    super.key,
  });

  @override
  State<FloorsNavigation> createState() => _FloorsNavigationState();
}

class _FloorsNavigationState extends State<FloorsNavigation> {
  int _selectedIndex = 0;
  double _floorsCount = 5;
  double _floorsHeight = 44;
  double _constraints = 10;

  void changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 160,
        left: 16,
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: 44,
          height: _floorsCount * _floorsHeight + _constraints,
          decoration: BoxDecoration(
            color: Color(0xFFFCFCFC),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                spreadRadius: 0,
                blurRadius: 3,
                // offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: NavigationRail(
            destinations: <NavigationRailDestination>[
              const NavigationRailDestination(
                  icon: FaIcon(
                    FontAwesomeIcons.four,
                    size: 12,
                  ),
                  label: Text('Four'),
                  selectedIcon: FaIcon(
                    size: 12,
                    FontAwesomeIcons.four,
                    color: Color(0xFF074683),
                  )),
              const NavigationRailDestination(
                  icon: FaIcon(
                    FontAwesomeIcons.three,
                    size: 12,
                  ),
                  label: Text('Three'),
                  selectedIcon: FaIcon(
                    size: 12,
                    FontAwesomeIcons.three,
                    color: Color(0xFF074683),
                  )),
              const NavigationRailDestination(
                  icon: FaIcon(
                    FontAwesomeIcons.two,
                    size: 12,
                  ),
                  label: Text('Two'),
                  selectedIcon: FaIcon(
                    size: 12,
                    FontAwesomeIcons.two,
                    color: Color(0xFF074683),
                  )),
              const NavigationRailDestination(
                  icon: FaIcon(
                    FontAwesomeIcons.one,
                    size: 12,
                  ),
                  label: Text('One'),
                  selectedIcon: FaIcon(
                    size: 12,
                    FontAwesomeIcons.one,
                    color: Color(0xFF074683),
                  )),
              const NavigationRailDestination(
                  icon: FaIcon(
                    FontAwesomeIcons.zero,
                    size: 12,
                  ),
                  label: Text('Zero'),
                  selectedIcon: FaIcon(
                    size: 12,
                    FontAwesomeIcons.zero,
                    color: Color(0xFF074683),
                  )),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: changeDestination,
            useIndicator: true,
            indicatorShape: const CircleBorder(),
            indicatorColor: const Color(0xFFCBD8E4),
          ),
        ));
  }
}

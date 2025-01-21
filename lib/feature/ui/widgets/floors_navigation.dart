import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institute_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

class FloorsNavigation extends StatefulWidget {
  final InstituteArguments data;
  const FloorsNavigation({
    super.key,
    required this.data,
  });

  @override
  State<FloorsNavigation> createState() => _FloorsNavigationState();
}

class _FloorsNavigationState extends State<FloorsNavigation> {
  //Logic:
  int _selectedIndex = -1;
  int _lastSelectedIndex = -1;
  int selectedFloor = 1;

  //Visual:
  double _floorsHeight = 44;
  double _constraints = 10;

  void changeDestination(int index) {
    setState(() {
      _lastSelectedIndex = _selectedIndex;
      _selectedIndex = index;
      selectedFloor = widget.data.institute!.maxFloor! - _selectedIndex;
      if (_selectedIndex == _lastSelectedIndex) return;
      context.read<SearchModel>().changeEvent(EEvent.floor);

      context.read<InstituteModel>().changeSelectedFloor(selectedFloor);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasZeroFloor = widget.data.institute!.minFloor == 0;
    final bool hasOneNegativeFloor = widget.data.institute!.minFloor == -1;
    final int withOneNegativeFloor = widget.data.institute!.maxFloor! + 2;
    final int withZeroFloor = widget.data.institute!.maxFloor! + 1;
    final int withoutZeroFloor = widget.data.institute!.maxFloor!;
    if (context.read<SearchModel>().calledByEvent == EEvent.search) {
      _selectedIndex =
          widget.data.institute!.maxFloor! - (widget.data.search!.floor as int);
    } else if (context.read<SearchModel>().calledByEvent == EEvent.route) {
      _selectedIndex = widget.data.institute!.maxFloor! -
          context.read<SearchModel>().fromFloor;
    }
    if (_selectedIndex == -1) {
      if (hasOneNegativeFloor) {
        _selectedIndex = withOneNegativeFloor - 3;
      } else {
        _selectedIndex =
            hasZeroFloor ? withZeroFloor - 2 : withoutZeroFloor - 1;
      }
    }
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 44,
      height: (hasZeroFloor
                  ? withZeroFloor
                  : hasOneNegativeFloor
                      ? withOneNegativeFloor
                      : withoutZeroFloor) *
              _floorsHeight +
          _constraints,
      decoration: BoxDecoration(
        color: AppColors.mainWhiteLight,
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
      child: RepaintBoundary(
          child: NavigationRail(
        destinations: List<int>.generate(
            hasZeroFloor
                ? withZeroFloor
                : hasOneNegativeFloor
                    ? withOneNegativeFloor
                    : withoutZeroFloor,
            (int index) => hasZeroFloor
                ? index
                : hasOneNegativeFloor
                    ? index - 1
                    : index + 1).reversed.toList().map((floor) {
          return NavigationRailDestination(
            icon: RepaintBoundary(
              child: Text('$floor'),
            ),
            label: Text(
              '$floor',
              style: TextStyle(color: AppColors.accentBlueDark),
            ),
            selectedIcon: RepaintBoundary(
              child: Text('$floor',
                  style: TextStyle(color: AppColors.accentBlueDark)),
            ),
          );
        }).toList(),
        selectedIndex: _selectedIndex,
        onDestinationSelected: changeDestination,
        useIndicator: true,
        indicatorShape: const CircleBorder(),
        indicatorColor: const Color(0xFFCBD8E4),
      )),
    );
  }
}

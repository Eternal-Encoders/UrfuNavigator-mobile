import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/map_model.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class FABWidgetExtended extends StatelessWidget {
  final int backgroundColor;
  final int color;
  final String title;
  final IconData icon;

  const FABWidgetExtended({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 3,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: RepaintBoundary(
          child: FloatingActionButton.extended(
            elevation: 0,
            backgroundColor: Color(backgroundColor),
            // foregroundColor: Colors.black,
            onPressed: () {
              title == Constants.FAB_ROUTE_TITLE
                  ? Navigator.pushNamed(context, RoutePaths.route)
                  : null;
            },
            heroTag: null,

            isExtended: context.watch<MapModel>().userChangedMap,
            icon: RepaintBoundary(
                child: Icon(icon,
                    color: Color(color), size: 24.0, semanticLabel: '')),
            label: RepaintBoundary(
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: Color(color),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

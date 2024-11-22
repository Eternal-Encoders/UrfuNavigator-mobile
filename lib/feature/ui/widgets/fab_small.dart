import 'package:flutter/material.dart';

class FABWidgetSmall extends StatelessWidget {
  final int backgroundColor;
  final int color;
  final String title;
  final String semanticLabel;
  final IconData icon;

  const FABWidgetSmall({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    required this.color,
    required this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: check on moving in canvas
    // MapModel state = Provider.of<MapModel>(context);
    return Container(
      decoration: BoxDecoration(
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
      child: Center(
        child: RepaintBoundary(
          child: FloatingActionButton.small(
            elevation: 0,
            backgroundColor: Color(backgroundColor),
            // foregroundColor: Colors.black,
            onPressed: () {
              // Respond to button press
            },
            heroTag: null,
            child: RepaintBoundary(
              child: Icon(icon,
                  color: Color(color),
                  size: 24.0,
                  semanticLabel: semanticLabel),
            ),
          ),
        ),
      ),
    );
  }
}

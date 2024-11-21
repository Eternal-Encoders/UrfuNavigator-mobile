import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/overlay_model.dart';

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

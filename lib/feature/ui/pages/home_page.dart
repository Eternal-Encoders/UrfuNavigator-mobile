import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/overlay_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/home_screen.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/overlay_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
            ignoring: context.watch<OverlayModel>().isVisibleValue,
            child: const HomeScreen()),
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

import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/settings_screen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child:
            Scaffold(resizeToAvoidBottomInset: false, body: SettingsScreen()));
  }
}

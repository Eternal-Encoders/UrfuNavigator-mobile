import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/language_screen.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child:
            Scaffold(resizeToAvoidBottomInset: false, body: LanguageScreen()));
  }
}

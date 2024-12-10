import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/path/path_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/route_screen.dart';
import 'package:urfu_navigator_mobile/locator_service.dart';

class RoutePage extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const RoutePage({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: MultiBlocProvider(
                providers: [
                  BlocProvider<PathBloc>(create: (context) => sl<PathBloc>()),
                ],
                child: RouteScreen(
                    autofocus: false,
                    sharedPreferences: sharedPreferences,
                    key))));
  }
}

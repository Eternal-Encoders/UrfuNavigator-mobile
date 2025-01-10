// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/point/point_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/search/search_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/search_screen.dart';
import 'package:urfu_navigator_mobile/locator_service.dart';

class SearchPage extends StatelessWidget {
  final String? textFromRoute;
  const SearchPage({super.key, this.textFromRoute});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          body: SearchPositionWithProvider(
            autofocus: true,
            textFromRoute: textFromRoute,
          ),
        ));
  }
}

class SearchPositionWithProvider extends StatelessWidget {
  final bool autofocus;
  final String? textFromRoute;
  SearchPositionWithProvider(
      {super.key, required this.autofocus, required this.textFromRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchBloc>(create: (context) => sl<SearchBloc>()),
          BlocProvider<PointBloc>(create: (context) => sl<PointBloc>()),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhiteLight,
          ),
          padding: EdgeInsets.only(top: 56, left: 16, right: 16),
          child: SearchScreen(
              autofocus: autofocus, textFromRoute: textFromRoute, key),
        ));
  }
}

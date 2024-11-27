// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/search/search_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/search_screen.dart';
import 'package:urfu_navigator_mobile/locator_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          body: SearchPositionWithProvider(
            autofocus: true,
          ),
        ));
  }
}

class SearchPositionWithProvider extends StatelessWidget {
  final bool autofocus;
  SearchPositionWithProvider({
    super.key,
    required this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchBloc>(create: (context) => sl<SearchBloc>()),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhiteLight,
          ),
          padding: EdgeInsets.only(top: 56, left: 16, right: 16),
          child: SearchScreen(autofocus: autofocus, key),
        ));
  }
}

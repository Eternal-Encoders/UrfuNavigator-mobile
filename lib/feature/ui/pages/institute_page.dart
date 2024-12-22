import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/floor/floor_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/path/path_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/screens/institute_screen.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/fab_extended.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/fab_small.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/floors_navigation.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/institute_search.dart';
import 'package:urfu_navigator_mobile/locator_service.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class InstitutePage extends StatelessWidget {
  final InstituteArguments data;
  InstitutePage({required this.data});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final newTextTheme = Theme.of(context)
        .colorScheme
        .copyWith(onPrimary: AppColors.accentBlueDark);
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider<FloorBloc>(create: (context) => sl<FloorBloc>()),
              BlocProvider<PathBloc>(create: (context) => sl<PathBloc>()),
            ],
            child: Container(
              color: AppColors.mainWhiteLight,
              height: screenSize.height,
              width: screenSize.width,
              child: Stack(
                children: [
                  InstituteScreen(
                    data: data,
                  ),
                  Positioned(
                      bottom: 96,
                      // bottom: 232,
                      right: 16,
                      child: RepaintBoundary(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.fromSeed(
                                seedColor: AppColors.accentBlue,
                                onPrimary: AppColors.accentBlueDark),
                          ),
                          child: const FABWidgetExtended(
                            title: Constants.FAB_ROUTE_TITLE,
                            icon: Icons.explore_outlined,
                            backgroundColor: 0xffCBD8E4,
                            color: 0xFF074683,
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 96,
                      left: 16,
                      child: RepaintBoundary(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.fromSeed(
                                seedColor: AppColors.accentBlue,
                                onPrimary: AppColors.accentBlueDark),
                          ),
                          child: const FABWidgetSmall(
                            title: 'Инфо',
                            icon: Icons.info_outline_rounded,
                            backgroundColor: 0xffFCFCFC,
                            color: 0xFF6D6D6D,
                            semanticLabel: 'Информация об университете',
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: 160,
                      left: 16,
                      child: FloorsNavigation(
                        data: data,
                      )),
                  Positioned(
                    top: 20,
                    left: 16,
                    right: 16,
                    child: InstituteSearchWithArrowBack(screenSize: screenSize),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

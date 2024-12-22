import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/institutes/institutes_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/search/search_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/carousel.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/fab_extended.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/home_search_bar.dart';
import 'package:urfu_navigator_mobile/locator_service.dart';
import 'package:urfu_navigator_mobile/main.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //TODO: оптимизировать
    log('home init');
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<InstitutesBloc>(
                create: (context) => sl<InstitutesBloc>()),
            BlocProvider<SearchBloc>(create: (context) => sl<SearchBloc>()),
          ],
          child: Container(
            color: const Color.fromARGB(255, 241, 238, 238),
            height: screenSize.height,
            width: screenSize.width,
            child: Stack(
              children: [
                MainContent(),
                // CustomBottomSheet(key: _key4),
                Positioned(
                    top: 56,
                    left: 10,
                    right: 10,
                    child: RepaintBoundary(child: HomeSearchBar())),
                const Positioned(
                    bottom: 172,
                    // bottom: 232,
                    right: 16,
                    child: RepaintBoundary(
                      child: FABWidgetExtended(
                        title: Constants.FAB_ROUTE_TITLE,
                        icon: Icons.explore_outlined,
                        backgroundColor: 0xffFAE2CF,
                        color: 0xFFE77011,
                      ),
                    )),
                const Positioned(
                    bottom: 240,
                    // bottom: 300,
                    right: 16,
                    child: RepaintBoundary(
                      child: FABWidgetExtended(
                        title: Constants.FAB_CAMPUS_TITLE,
                        icon: Icons.sync_outlined,
                        backgroundColor: 0xffFCFCFC,
                        color: 0xFF6D6D6D,
                      ),
                    )),
                const Positioned(
                    // bottom: 88,
                    bottom: 28,
                    // left: 16,
                    child: RepaintBoundary(child: CarouselInstitutes())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

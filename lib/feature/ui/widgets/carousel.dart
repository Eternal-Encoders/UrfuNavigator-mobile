import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/institutes/institutes_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/error_message.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/loading_indicator.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  @override
  void initState() {
    super.initState();

    context.read<InstitutesBloc>().add(InstitutesEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    final state = context.watch<InstitutesBloc>().state;
    return state.when(
        error: () => DefaultErrorMessage(),
        loading: () => DefaultLoadingIndicator(),
        loaded: (InstitutesList institutesLoaded) {
          return Center(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: 132, maxWidth: screenSize - 16),
              child: CarouselView(
                onTap: (int index) {
                  Institute institute = Institute(
                      name: institutesLoaded.institutes?[index].name,
                      displayableName:
                          institutesLoaded.institutes?[index].displayableName,
                      url: institutesLoaded.institutes?[index].url,
                      minFloor: institutesLoaded.institutes?[index].minFloor,
                      maxFloor: institutesLoaded.institutes?[index].maxFloor);
                  Navigator.pushNamed(context, RoutePaths.institute,
                      arguments: institute);
                },
                // backgroundColor: Color(value),
                itemExtent: 100,
                shrinkExtent: 100,
                children: institutesLoaded.institutes!
                    .asMap()
                    .values
                    .map((Institute inst) {
                  switch (inst.name) {
                    case 'ГУК':
                      return cardBody('assets/img/urfu-bodies-img/GUK.png',
                          inst.name ?? 'unknown');
                    case 'УРАЛЭНИН':
                      return cardBody('assets/img/urfu-bodies-img/URALANIN.png',
                          inst.name ?? 'unknown');
                    case 'ИРИТ-РТФ':
                      return cardBody('assets/img/urfu-bodies-img/IRIT-RTF.png',
                          inst.name ?? 'unknown');
                    case 'ИСА':
                      return cardBody('assets/img/urfu-bodies-img/ISA.png',
                          inst.name ?? 'unknown');
                    case 'ИНМИТ-ХТИ':
                      return cardBody('assets/img/urfu-bodies-img/URALANIN.png',
                          inst.name ?? 'unknown');
                    case 'УГИ':
                      return cardBody('assets/img/urfu-bodies-img/UGI.png',
                          inst.name ?? 'unknown');
                    default:
                      return Text('future card...');
                  }
                }).toList(),
              ),
            ),
          );
        });
  }

  Card cardBody(String imageRoute, String title) {
    return Card.outlined(
      // elevation: 2,
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
            color: AppColors.white,
            strokeAlign: BorderSide.strokeAlignCenter,
            style: BorderStyle.solid,
            width: 0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
      ),
      margin: const EdgeInsets.all(0),
      child: RepaintBoundary(
        child: SizedBox(
          height: 124,
          width: 100,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // textDirection: TextDirection.ltr,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // verticalDirection: VerticalDirection.down,
            children: [
              Image(
                image: AssetImage(imageRoute),
                height: 92,
                width: 100,
                fit: BoxFit.fill,
              ),
              SizedBox(
                  width: 100,
                  height: 32,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, top: 7),
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: AppColors.accentGray,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

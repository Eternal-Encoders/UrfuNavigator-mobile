import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institute/institute.dart';
import 'package:urfu_navigator_mobile/feature/data/models/institutes/institutes.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/institutes/institutes_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/institutes_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/search_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/error_message.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/state/loading_indicator.dart';
import 'package:urfu_navigator_mobile/types/institute_agruments.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';
import 'package:urfu_navigator_mobile/utils/enums.dart';

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
    var screenSize = MediaQuery.of(context);
    final state = context.watch<InstitutesBloc>().state;
    return state.when(
        error: () => DefaultErrorMessage(),
        loading: () => DefaultLoadingIndicator(),
        loaded: (InstitutesList institutesLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
            context.read<InstitutesModel>().saveInstitutes(institutesLoaded);
          });
          return Container(
            margin: EdgeInsets.all(0),
            height: 135,
            width: screenSize.size.width,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, item) {
                return Container(
                  decoration: BoxDecoration(
                    // border: ,
                    color: AppColors.mainWhiteLight,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 3,
                        // offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      context.read<SearchModel>().changeEvent(EEvent.card);
                      Institute institute = Institute(
                          name: institutesLoaded.institutes?[item].name,
                          displayableName: institutesLoaded
                              .institutes?[item].displayableName,
                          url: institutesLoaded.institutes?[item].url,
                          minFloor: institutesLoaded.institutes?[item].minFloor,
                          maxFloor:
                              institutesLoaded.institutes?[item].maxFloor);
                      Navigator.pushNamed(context, RoutePaths.institute,
                          arguments: InstituteArguments(
                              institute: institute, coordinates: null));
                    },
                    child: SizedBox(
                      height: 132,
                      width: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)),
                                ),
                                child: Image(
                                  image: switch (
                                      institutesLoaded.institutes![item].name) {
                                    'ИРИТ-РТФ' => AssetImage(
                                        'assets/img/urfu-bodies-img/IRIT-RTF.png'),
                                    'ГУК' => AssetImage(
                                        'assets/img/urfu-bodies-img/GUK.png'),
                                    'УРАЛЭНИН' => AssetImage(
                                        'assets/img/urfu-bodies-img/URALANIN.png'),
                                    'ИСА' => AssetImage(
                                        'assets/img/urfu-bodies-img/ISA.png'),
                                    'ИНМИТ-ХТИ' => AssetImage(
                                        'assets/img/urfu-bodies-img/INMIT_XTI.png'),
                                    'УГИ' => AssetImage(
                                        'assets/img/urfu-bodies-img/UGI.png'),
                                    _ => AssetImage(
                                        'assets/img/urfu-bodies-img/IRIT-RTF.png'),
                                  },
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 9, bottom: 9),
                                child: Text(
                                  maxLines: 1,
                                  institutesLoaded.institutes![item].name!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.accentGray),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemCount: 6,
            ),
          );
        });
  }

  Container listUniversity(String imageRoute, String title) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(0),
      height: 140,
      child: ListView.separated(
        itemBuilder: (context, item) {
          return Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
        itemCount: 6,
      ),
    );
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
          height: 132,
          width: 100,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // textDirection: TextDirection.ltr,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // verticalDirection: VerticalDirection.down,
            children: [
              Image(
                image: AssetImage(imageRoute),
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
              SizedBox(
                  width: 100,
                  height: 32,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, top: 7),
                    child: Text(
                      maxLines: 1,
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

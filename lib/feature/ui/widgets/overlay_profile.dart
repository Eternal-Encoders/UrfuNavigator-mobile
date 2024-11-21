import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/overlay_model.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/icon_exit.dart';

class OverlayVisibility extends StatelessWidget {
  OverlayVisibility({super.key});

  @override
  Widget build(BuildContext context) {
    OverlayModel state = Provider.of<OverlayModel>(context);
    return Visibility(visible: state.isVisibleValue, child: OverlayProfile());
  }
}

class OverlayProfile extends StatelessWidget {
  OverlayProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(29, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 999999,
              // blurRadius: 7,
              // offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SizedBox(
          width: screenSize.width - 32,
          height: 340,
          child: Column(
            children: [
              Stack(children: [
                IconExitWidget(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      'assets/img/favicon/favicon.png',
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: screenSize.width - 32 - 32,
                height: 64,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.feedback_outlined,
                            color: Color(0xFF3A3A3A),
                            size: 24,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultTextStyle(
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 80,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Обратная связь",
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              DefaultTextStyle(
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 40,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Расскажите о своем опыте использования приложения",
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width - 32 - 32,
                      child: Divider(
                        height: 1,
                        color: Color.fromARGB(40, 204, 204, 204),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width - 32 - 32,
                height: 64,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.bug_report_outlined,
                            color: Color(0xFF3A3A3A),
                            size: 24,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultTextStyle(
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 80,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Сообщить об ошибке",
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              DefaultTextStyle(
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 40,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Сообщите об ошибках в работе приложения или неточностях в картах",
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width - 32 - 32,
                      child: Divider(
                        height: 1,
                        color: Color.fromARGB(40, 204, 204, 204),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width - 32 - 32,
                height: 64,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            color: Color(0xFF3A3A3A),
                            size: 24,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultTextStyle(
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 80,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Настройки",
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 4,
                              ),
                              DefaultTextStyle(
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Color(0xFF3A3A3A)),
                                  child: SizedBox(
                                    width: screenSize.width - 32 - 32 - 40,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Смена языка, персонализация, уведомления",
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width - 32 - 32,
                      child: Divider(
                        height: 1,
                        color: Color.fromARGB(40, 204, 204, 204),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: screenSize.width - 32 - 16,
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/socials/tg.png',
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Image.asset(
                      'assets/img/socials/vk.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

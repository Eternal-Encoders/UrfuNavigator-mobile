import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/helpers/body_helper.dart';

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 132, maxWidth: screenSize - 16),
        child: CarouselView(
          onTap: (int index) {
            Navigator.pushNamed(
                context, '/${EBodyExtension.values[index].name}');
          },
          // backgroundColor: Color(value),
          itemExtent: 100,
          shrinkExtent: 100,
          children: EBody.values
              .map((EBody body) => cardBody(body.imgRoute, body.nameRU))
              .toList(),
        ),
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
            color: Color.fromARGB(255, 255, 255, 255),
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
                          color: Color(0xFF6D6D6D),
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

// class CustomBottomSheet extends StatefulWidget {
//   const CustomBottomSheet({super.key});

//   @override
//   State<CustomBottomSheet> createState() => _CustomBottomSheetState();
// }

// class _CustomBottomSheetState extends State<CustomBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return AnimatedPositioned(
//         curve: Curves.decelerate,
//         duration: const Duration(milliseconds: 400),
//         bottom: 0,
//         height: !isSwipeUp ? 135 : 335,
//         child: GestureDetector(
//             onPanEnd: (details) {
//               if (details.velocity.pixelsPerSecond.dy <= -100) {
//                 setState(() {
//                   isSwipeUp = true;
//                 });
//               } else if (details.velocity.pixelsPerSecond.dy > 200) {
//                 setState(() {
//                   isSwipeUp = false;
//                 });
//               }
//             },
//             child: Container(
//               padding: const EdgeInsets.only(
//                   bottom: 10, left: 10, right: 10, top: 10),
//               height: screenSize.height,
//               width: screenSize.width,
//               // color: const Color(0xFFFCFCFC),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFCFCFC),
//                 // borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFF000000).withOpacity(0.1),
//                     spreadRadius: 2,
//                     blurRadius: 3,
//                     // offset: const Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: const Column(
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 30,
//                     child: IconEntity(
//                       Icons.maximize_rounded,
//                       size: 70,
//                       color: Color(0xFFCCCCCC),
//                     ),
//                   ),
//                 ],
//               ),
//             )));
//   }
// }
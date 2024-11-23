// import 'package:flutter/material.dart';
// import 'package:reorderables/reorderables.dart';

// class ReorderableWrapList extends StatefulWidget {
//   const ReorderableWrapList({super.key});

//   @override
//   ReorderableWrapListState createState() => ReorderableWrapListState();
// }

// class ReorderableWrapListState extends State<ReorderableWrapList> {
//   late List<Widget> _tiles;

//   @override
//   void initState() {
//     super.initState();
//     _tiles = <Widget>[
//       const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image(image: AssetImage('assets/img/IRIT-RTF.png')),
//             Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: Text(
//                 'ИРИТ-РТФ (Р)',
//                 style: TextStyle(
//                     fontFamily: 'Ruda',
//                     fontSize: 11,
//                     color: AppColors.accentGray,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//       const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image(image: AssetImage('assets/img/GUK.png')),
//             Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: Text(
//                 'ГУК',
//                 style: TextStyle(
//                     fontFamily: 'Ruda',
//                     fontSize: 11,
//                     color: AppColors.accentGray,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//       const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image(image: AssetImage('assets/img/URALANIN.png')),
//             Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: Text(
//                 'УралЭНИН (Т)',
//                 style: TextStyle(
//                     fontFamily: 'Ruda',
//                     fontSize: 11,
//                     color: AppColors.accentGray,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//       const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image(image: AssetImage('assets/img/INAU.png')),
//             Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: Text(
//                 'ИНЭУ (И)',
//                 style: TextStyle(
//                     fontFamily: 'Ruda',
//                     fontSize: 11,
//                     color: AppColors.accentGray,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//       const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image(image: AssetImage('assets/img/FTI.png')),
//             Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: Text(
//                 'ФТИ (Ф)',
//                 style: TextStyle(
//                     fontFamily: 'Ruda',
//                     fontSize: 11,
//                     color: AppColors.accentGray,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//       const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image(image: AssetImage('assets/img/INMT.png')),
//             Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: Text(
//                 'ИНМТ (МТ)',
//                 style: TextStyle(
//                     fontFamily: 'Ruda',
//                     fontSize: 11,
//                     color: AppColors.accentGray,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//       const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image(image: AssetImage('assets/img/ISA.png')),
//             Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: Text(
//                 'ИСА (С)',
//                 style: TextStyle(
//                     fontFamily: 'Ruda',
//                     fontSize: 11,
//                     color: AppColors.accentGray,
//                     fontWeight: FontWeight.w500),
//               ),
//             )
//           ],
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     int iconSize = 76;
//     int iconsInRow = 4;
//     int sumOfPaddingBottomSheet = 20;
//     int sumOfPaddingCard = 16;
//     Size screenSize = MediaQuery.of(context).size;
//     double spacing = (screenSize.width -
//             sumOfPaddingBottomSheet -
//             (iconSize * iconsInRow) -
//             (sumOfPaddingCard * iconsInRow)) /
//         (iconsInRow - 1);

//     void onReorder(int oldIndex, int newIndex) {
//       setState(() {
//         Widget row = _tiles.removeAt(oldIndex);
//         _tiles.insert(newIndex, row);
//       });
//     }

//     var wrap = ReorderableWrap(
//         spacing: spacing,
//         runSpacing: 20,
//         // padding: const EdgeInsets.all(8),
//         onReorder: onReorder,
//         // onNoReorder: (int index) {
//         //   //this callback is optional
//         //   debugPrint(
//         //       '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
//         // },
//         // onReorderStarted: (int index) {
//         //   //this callback is optional
//         //   debugPrint(
//         //       '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
//         // },
//         children: _tiles);

//     var column = Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         wrap,
//       ],
//     );

//     return SingleChildScrollView(
//       child: column,
//     );
//   }
// }

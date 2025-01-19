import 'package:flutter/material.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/feature/ui/widgets/arrow_back.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class InstituteSearchWithArrowBack extends StatelessWidget {
  const InstituteSearchWithArrowBack({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ArrowBack(),
        SizedBox(
          width: 8,
        ),
        SearchField(screenSize: screenSize),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: screenSize.width * 0.76,
      decoration: BoxDecoration(
        color: AppColors.mainWhiteLight,
        borderRadius: BorderRadius.all(Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 3,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        onTap: () {
          Navigator.pushReplacementNamed(context, RoutePaths.search);
        },
        readOnly: true,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColors.accentGray,
        cursorErrorColor: AppColors.accentGray,
        cursorWidth: 2,
        cursorHeight: 20,
        decoration: InputDecoration(
          isDense: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: I18N.searchHint,
          hintStyle: TextStyle(fontSize: 12, color: AppColors.accentGray),
          prefixIcon: Tooltip(
            message: 'Search',
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutePaths.search);
              },
              icon: const Icon(
                size: 24,
                Icons.search,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.mainWhiteLight,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 3,
              // offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(child: ArrowBackWidget()),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urfu_navigator_mobile/common/app_colors.dart';
import 'package:urfu_navigator_mobile/common/text_styles.dart';
import 'package:urfu_navigator_mobile/feature/ui/provider/overlay_model.dart';
import 'package:urfu_navigator_mobile/utils/const.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  bool isProfileTapped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 44,
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
            onTap: () => Navigator.pushNamed(context, RoutePaths.search),
            readOnly: true,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.accentGray,
            cursorErrorColor: AppColors.accentGray,
            cursorWidth: 2,
            cursorHeight: 20,
            style: TextStyles.h4MedAccGrayDark,
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: I18N(context).searchHint,
              hintStyle: TextStyle(fontSize: 12, color: AppColors.accentGray),
              suffixIcon: Tooltip(
                message: 'Profile',
                child: IconButton(
                  isSelected: isProfileTapped,
                  onPressed: () {
                    setState(() {
                      isProfileTapped = !isProfileTapped;
                      context.read<OverlayModel>().getVisibleOrNot();
                    });
                  },
                  icon: const Icon(
                    size: 24,
                    Icons.account_circle_rounded,
                    fill: 1,
                    color: Color(0xFF5E97F6),
                  ),
                ),
              ),
              prefixIcon: Tooltip(
                message: 'Search',
                child: IconButton(
                  isSelected: isProfileTapped,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePaths.search);
                  },
                  icon: const Icon(
                    size: 24,
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

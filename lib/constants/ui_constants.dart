import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_w/constants/assets_constants.dart';
import 'package:twitter_w/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        colorFilter: const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn),
        // color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    // TweetList(),
    // ExploreView(),
    // NotificationView(),
  ];
}

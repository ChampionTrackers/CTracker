import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/view/view_feed.dart';
import 'package:ctracker/view/view_home.dart';
import 'package:ctracker/view/view_profile.dart';
import 'package:ctracker/view/view_shop.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: AppColor.accentColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home_filled,
              color: AppColor.textColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ViewHome()));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person,
              color: AppColor.textColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ViewProfile()));
            },
          ),
          const Opacity(
            opacity: 0,
            child: IconButton(
              icon: Icon(Icons.no_cell),
              onPressed: null,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.newspaper,
              color: AppColor.textColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ViewFeed()));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColor.textColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ViewShop()));
            },
          ),
        ],
      ),
    );
  }
}

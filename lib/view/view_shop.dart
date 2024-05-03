import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/bottom_navigation.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';

class ViewShop extends StatelessWidget {
  const ViewShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TrackerAppBar(),
      endDrawer: const TrackerDrawer(),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColor.secondAccentColor,
          child: const Icon(Icons.search)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const Text("Shop"),
    );
  }
}

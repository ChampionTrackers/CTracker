import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class TrackerAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TrackerAppBar({super.key});

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColor.accentColor),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
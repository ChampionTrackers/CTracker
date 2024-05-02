import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class TrackerDrawer extends StatelessWidget {
  const TrackerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.tertiaryColor,
      child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text("user@mail.com"),
          accountName: Text("Seu zé"),
          currentAccountPicture: CircleAvatar(
            child: Text("SZ"),
          ),
        ),
        ListTile(
          leading: Icon(Icons.info_outline, color: AppColor.textColor),
          title: Text("Sobre nós", style: TextStyle(color: AppColor.textColor))
        ),
        ListTile(
          leading: Icon(Icons.logout, color: AppColor.textColor),
          title: Text("Log out", style: TextStyle(color: AppColor.textColor))
        ),
      ]),
    );
  }
}

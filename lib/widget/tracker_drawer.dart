import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/view/view_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TrackerDrawer extends StatelessWidget {
  const TrackerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.tertiaryColor,
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        const UserAccountsDrawerHeader(
          accountEmail: Text("user@mail.com"),
          accountName: Text("Seu zé"),
          currentAccountPicture: CircleAvatar(
            child: Text("SZ"),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.info_outline, color: AppColor.textColor),
          title: Text("Sobre nós", style: TextStyle(color: AppColor.textColor))
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: AppColor.textColor),
          title: const Text("Log out", style: TextStyle(color: AppColor.textColor)),
          onTap: () async {
            FlutterSecureStorage storage = const FlutterSecureStorage();
            await storage.deleteAll();

            if (!context.mounted) return;
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ViewLogin()));
          }
        ),
      ]),
    );
  }
}

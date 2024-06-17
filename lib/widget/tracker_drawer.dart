import 'dart:convert';

import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/constants/config.dart';
import 'package:ctracker/model/user_model.dart';
import 'package:ctracker/utils/verify_jwt.dart';
import 'package:ctracker/view/view_login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class TrackerDrawer extends StatefulWidget {
  const TrackerDrawer({super.key});

  @override
  State<TrackerDrawer> createState() => _TrackerDrawerState();
}

class _TrackerDrawerState extends State<TrackerDrawer> {
  final storage = const FlutterSecureStorage();

  Future<User> _fetchProfile() async {
    var jwt = await verifyJwt();

    // Fetch profile data from API
    var res = await http.get(
        Uri.parse("${Config.apiBaseUrl}/v1/profile"),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          "Authorization": "Bearer $jwt"
        });

    if (res.statusCode == 200) {
      if (kDebugMode) print("Response: ${res.body}");
      return User.fromJson(json.decode(res.body) as Map<String, dynamic>);
    } else {
      throw Exception("Request failed with status: ${res.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Drawer(
              backgroundColor: AppColor.tertiaryColor,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Drawer(
              backgroundColor: AppColor.tertiaryColor,
              child: Center(
                child: Text("Erro ao carregar perfil"),
              ),
            );
          } else {
            return Drawer(
              backgroundColor: AppColor.tertiaryColor,
              child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail:
                      Text(snapshot.data?.email ?? "seu.ze@gmail.com"),
                  accountName: Text(snapshot.data?.name ?? "Seu zé"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data?.picture ??
                        "https://api.dicebear.com/8.x/lorelei/png?seed=seu.ze"),
                  ),
                ),
                const ListTile(
                    leading:
                        Icon(Icons.info_outline, color: AppColor.textColor),
                    title: Text("Sobre nós",
                        style: TextStyle(color: AppColor.textColor))),
                ListTile(
                    leading:
                        const Icon(Icons.logout, color: AppColor.textColor),
                    title: const Text("Log out",
                        style: TextStyle(color: AppColor.textColor)),
                    onTap: () async {
                      FlutterSecureStorage storage =
                          const FlutterSecureStorage();
                      await storage.deleteAll();

                      if (!context.mounted) return;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewLogin()));
                    }),
              ]),
            );
          }
        });
  }
}

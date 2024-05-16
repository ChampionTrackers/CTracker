import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/bottom_navigation.dart';
import 'package:ctracker/widget/form_text_field.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';

class ViewEditProfile extends StatefulWidget {
  const ViewEditProfile({super.key});

  @override
  State<ViewEditProfile> createState() => _ViewEditProfileState();
}

class _ViewEditProfileState extends State<ViewEditProfile> {
  final nameInputController = TextEditingController();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 125,
                backgroundImage:
                    NetworkImage("https://picsum.photos/seed/evolution/400"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FormTextField(
              labelText: "Nome",
              controller: nameInputController,
            ),
          ],
        ),
      ),
    );
  }
}

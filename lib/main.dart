import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/utils/verify_jwt.dart';
import 'package:ctracker/view/view_feed.dart';
import 'package:ctracker/view/view_home.dart';
import 'package:ctracker/view/view_login.dart';
import 'package:ctracker/view/view_profile.dart';
import 'package:ctracker/view/view_shop.dart';
import 'package:ctracker/view/view_welcome.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: const Root(),
    theme: ThemeData(
      scaffoldBackgroundColor: AppColor.backgroundColor,
      hintColor: AppColor.primaryColor,
    ),
  ));
}

class Root extends StatelessWidget {
  const Root({super.key});

  Future<bool> _isWelcomeScreenSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('welcome_screen_seen') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isWelcomeScreenSeen(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        }

        if (snapshot.data == true) {
          return const Main();
        } else {
          return const ViewWelcome();
        }
      },
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  Future<bool> _isLoggedIn() async {
    final token = await verifyJwt();
    if (token.isEmpty) return false;
    final jwt = token.split(".");
    return jwt.length == 3;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        }

        if (snapshot.data == true) {
          return const MainView();
        } else {
          return const ViewLogin();
        }
      },
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ViewHome(),
    ViewProfile(),
    ViewFeed(),
    ViewShop(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TrackerAppBar(),
      endDrawer: const TrackerDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        // showSelectedLabels: false,
        selectedItemColor: AppColor.textColor,
        unselectedItemColor: AppColor.textColor.withOpacity(0.5),
        backgroundColor: AppColor.primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Shop',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

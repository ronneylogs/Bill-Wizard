// The root file of the app.

// Package for general Flutter.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package for decoration clippers.
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

// Package for other screens.
import 'package:billwizard/onboarding_screen.dart';
import 'package:billwizard/pages/home.dart';
import 'package:billwizard/pages/settings.dart';
import 'package:billwizard/pages/split.dart';
import 'package:billwizard/pages/register.dart';
import 'package:billwizard/pages/login.dart';
import 'package:billwizard/utilities/global.dart';

// Package for shared preferences.
import 'package:billwizard/utilities/userSharedPreferences.dart';

// Package for google bottom nav bar.
import 'package:google_nav_bar/google_nav_bar.dart';

// Package for async.
import 'dart:async';

// Class to store global data.
Global globalInfo = new Global();

// Flag for whether user is logged in or not.
bool loggedIn = false;

// Flag for whether user is first time launching the app or not.
bool firstLaunch = false;

// Flag for whether user wants login information recorded.
bool rememberUser = false;

late String username_shared;

late String password_shared;

void main() async {
  // Ensures widgets are intialized at the start of the app
  WidgetsFlutterBinding.ensureInitialized();

  // Keeps screen in portrait mode.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // For getting user shared preferences.
  await UserSimplePreferences.init();
  loggedIn = UserSimplePreferences.getLogged() ?? false;
  firstLaunch = UserSimplePreferences.getFirstLaunched() ?? false;
  rememberUser = UserSimplePreferences.getRememberUser() ?? false;
  username_shared = UserSimplePreferences.getRememberUsername() ?? "";
  password_shared = UserSimplePreferences.getRememberPassword() ?? "";

  // Runs the app.
  runApp(const MyApp());
}

// Class for the root of the app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(rememberUser),
      // loggedIn ? NavBar(title: "hi") : OnBoardingScreen(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.title});

  final String title;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // Availabel screens in navbar
  final List pages = [
    const Home(),
    // const Split(),
    const Settings(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              activeColor: Colors.black,
              color: Colors.black,
              backgroundColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade200,
              gap: 8,
              onTabChange: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              padding: EdgeInsets.all(5),
              tabs: [
                GButton(icon: Icons.money, text: 'Dash'),
                // GButton(icon: Icons.money, text: 'Split'),
                GButton(icon: Icons.settings, text: 'Settings'),
              ]),
        ),
      ),
    );
  }
}

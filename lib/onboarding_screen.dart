// This file is for managing the onboard intro screens.

// Package for general Flutter.
import 'package:flutter/material.dart';

// Package for other screens.
import 'package:billwizard/intro_screens/intropage1.dart';
import 'package:billwizard/intro_screens/intropage2.dart';
import 'package:billwizard/intro_screens/intropage3.dart';
import 'package:billwizard/main.dart';
import 'package:billwizard/utilities/userSharedPreferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  PageController _controller = PageController();

  // keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,

          // check if we are on last page
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [IntroPage1(), IntroPage2(), IntroPage3()],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text("Skip")),

                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                // next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () async {
                          // Save an boolean value to 'repeat' key.
                          await UserSimplePreferences.setLogged(true);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NavBar(title: "hi");
                          }));
                        },
                        child: Text("Start"))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text("Next")),
              ],
            ))
      ]),
    );
  }
}

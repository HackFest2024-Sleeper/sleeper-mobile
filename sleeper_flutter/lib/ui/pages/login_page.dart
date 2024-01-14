import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:sleeper_flutter/ui/pages/activity/activity_page.dart';
import 'package:sleeper_flutter/ui/pages/iot/iot_pages.dart';
import 'package:sleeper_flutter/ui/pages/profile/profile_page.dart';
import 'package:sleeper_flutter/ui/pages/activity/recommentadion_page.dart';
import 'package:sleeper_flutter/ui/pages/sleep/sleep_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class MenuSetting {
  bool bottomBar;
  Widget page;
  MenuSetting(this.bottomBar, this.page);
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
    );
  }

  int menuIndex = 0; //0 to 4

  BottomBar _bottomBar() {
    List<MenuSetting> menus = [];
    if (_user != null) {
      menus.add(MenuSetting(true, ActivityPage(user: _user!)));
      menus.add(MenuSetting(true, SleepPage(user: _user!)));
      menus.add(MenuSetting(true, IotPage(user: _user!)));
      menus.add(MenuSetting(true, RecommendationPage(user: _user!)));
      menus.add(MenuSetting(true, ProfilePage(user: _user!)));
    }
    void changePage(index) {
      setState(() {
        menuIndex = index;
        print(menuIndex);
      });
    }

    return BottomBar(
        barColor: const Color(0xFF403041),
        borderRadius: BorderRadius.circular(60),
        child: menus.isNotEmpty && menus[menuIndex].bottomBar
            ? SizedBox(
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        changePage(0);
                      },
                      child: Icon(
                        Icons.home_outlined,
                        color: Color(0xFFF5F5F5),
                        size: menuIndex == 0 ? 60 : 42,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        changePage(1);
                      },
                      child: Icon(
                        Icons.nightlight_outlined,
                        color: Color(0xFFF5F5F5),
                        size: menuIndex == 1 ? 60 : 42,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        changePage(2);
                      },
                      child: Icon(
                        Icons.cloud_download_outlined,
                        color: Color(0xFFF5F5F5),
                        size: menuIndex == 2 ? 60 : 42,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        changePage(3);
                      },
                      child: Icon(
                        Icons.run_circle_outlined,
                        color: Color(0xFFF5F5F5),
                        size: menuIndex == 3 ? 60 : 42,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        changePage(4);
                      },
                      child: Icon(
                        Icons.history,
                        color: Color(0xFFF5F5F5),
                        size: menuIndex == 4 ? 60 : 42,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(height: 0.1, width: 0.1),
        body: (context, controller) {
          log('asdsads ${menus[menuIndex].page}');
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover),
            ),
            child:
                // _user != null ? HomePage(user: _user!) : _googleSignInButton(),
                _user != null ? menus[menuIndex].page : _googleSignInButton(),
          );
        });
  }

  Widget _googleSignInButton() {
    return Center(
      child: SizedBox(
        height: 50,
        child: SignInButton(Buttons.google, onPressed: _handleGoogleSignIn),
      ),
    );
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }
}

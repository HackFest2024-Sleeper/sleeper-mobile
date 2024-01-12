import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:sleeper_flutter/ui/pages/home_page.dart';
import 'package:sleeper_flutter/ui/pages/iot_pages.dart';
import 'package:sleeper_flutter/ui/pages/profile_page.dart';
import 'package:sleeper_flutter/ui/pages/recommentadion_page.dart';
import 'package:sleeper_flutter/ui/pages/sleep_page.dart';

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

  BottomBar _bottomBar() {
    List<MenuSetting> menus = [];
    if (_user != null) {
      menus.add(MenuSetting(true, HomePage(user: _user!)));
      menus.add(MenuSetting(true, IotPage(user: _user!)));
      menus.add(MenuSetting(false, ProfilePage(user: _user!)));
      menus.add(MenuSetting(true, RecommendationPage(user: _user!)));
      menus.add(MenuSetting(true, SleepPage(user: _user!)));
    }
    int menuIndex = 0; //0 to 4
    return BottomBar(
        barColor: const Color(0xFF403041),
        borderRadius: BorderRadius.circular(60),
        child: menus.isNotEmpty && menus[menuIndex].bottomBar
            ? const SizedBox(
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: Color(0xFFF5F5F5),
                      size: 42,
                    ),
                    Icon(
                      Icons.nightlight_outlined,
                      color: Color(0xFFF5F5F5),
                      size: 42,
                    ),
                    Icon(
                      Icons.cloud_download_outlined,
                      color: Color(0xFFF5F5F5),
                      size: 42,
                    ),
                    Icon(
                      Icons.run_circle_outlined,
                      color: Color(0xFFF5F5F5),
                      size: 42,
                    ),
                    Icon(
                      Icons.alarm_outlined,
                      color: Color(0xFFF5F5F5),
                      size: 42,
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: 0.1,
                width: 0.1,
              ),
        body: (context, controller) {
          return Container(
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

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:sleeper_flutter/ui/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
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
    return BottomBar(
      barColor: Color(0xFF403041),
      borderRadius: BorderRadius.circular(60),
      child: Container(
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
      ),
      body: (context, controller) => _user != null
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: HomePage(user: _user!))
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: _googleSignInButton(),
            ),
    );
  }

  Widget _googleSignInButton() {
    return Center(
      child: SizedBox(
        height: 50,
        child: SignInButton(Buttons.google, onPressed: _handleGoogleSignIn),
      ),
    );
  }

  Widget _userInfo() {
    return SizedBox();
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }
}

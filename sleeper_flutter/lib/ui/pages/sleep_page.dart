import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key, required this.user});
  final User user;

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class IotPage extends StatefulWidget {
  const IotPage({super.key, required this.user});
  final User user;

  @override
  State<IotPage> createState() => _IotPageState();
}

class _IotPageState extends State<IotPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

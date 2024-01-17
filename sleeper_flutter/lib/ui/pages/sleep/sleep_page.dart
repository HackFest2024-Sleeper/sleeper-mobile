import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sleeper_flutter/ui/pages/sleep/alarn_page.dart';
import 'package:sleeper_flutter/ui/pages/sleep/bulb_page.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key, required this.user});
  final User user;

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sleep Setting",
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          const Text(
            "Customize your sleep experience",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFECE6F0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              children: [
                Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF403041),
                  ),
                  'Your devices',
                ),
                Divider(thickness: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF403041),
                      ),
                      'Smart Lamp',
                    ),
                    Text(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF403041),
                      ),
                      'Connected',
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF403041),
                      ),
                      'Smartwatch',
                    ),
                    Text(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF403041),
                      ),
                      'Not Connected',
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => const AlarmPage(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 100,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.alarm_outlined,
                        color: Color(0xFF231F20),
                        size: 70,
                      ),
                      Text(
                        'Alarm',
                        style: TextStyle(
                          color: Color(0xFF231F20),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contex) => const BulbPage(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 100,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Color(0xFF231F20),
                        size: 70,
                      ),
                      Text(
                        'Light Intensity',
                        style: TextStyle(
                          color: Color(0xFF231F20),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {},
              child: const SizedBox(
                width: 100,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.headset_outlined,
                      color: Color(0xFF231F20),
                      size: 70,
                    ),
                    Text(
                      'Sound',
                      style: TextStyle(
                        color: Color(0xFF231F20),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

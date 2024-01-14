import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});
  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(22),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 85),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                      image: NetworkImage(widget.user.photoURL!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  widget.user.email!,
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                const Text(
                  'Free User',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Container(
                  height: 100,
                  width: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF403041),
                  ),
                  margin: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'Upgrade to premium',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFF7F5FF),
                          ),
                        ),
                        const Text(
                          'Make the most of your app experience.',
                          style: TextStyle(
                            color: Color(0xFFF7F5FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF6750A4),
                            ),
                          ),
                          child: const Text(
                            'Upgrade',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1),
                  ),
                ),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 56,
                child: const Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1D1B20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1),
                  ),
                ),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 56,
                child: const Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1D1B20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1),
                  ),
                ),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 56,
                child: const Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1D1B20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1),
                  ),
                ),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 56,
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1D1B20),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

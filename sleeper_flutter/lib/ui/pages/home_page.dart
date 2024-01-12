import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});
  final User user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Text(
                  'Good Morning,\n${widget.user.email}',
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                Expanded(
                  child: Container(),
                ),
                const Icon(
                  Icons.person_2_outlined,
                  size: 37,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 66,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(7, (index) {
                return Container(
                  width: 42,
                  height: 66,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFFEF7FF),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "07",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1D1B20),
                          ),
                        ),
                        Text(
                          "Mon",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1D1B20),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            width: double.infinity,
            height: 350,
            margin: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                color: Color(0xB2FFFFFF)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Your Activity Today",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF403041)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  child: Divider(color: Colors.white),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            title: Text(
                              "20:00, Its Your fucking time to sleep",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1D1B20),
                              ),
                            ),
                            onChanged: (bool? value) {});
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

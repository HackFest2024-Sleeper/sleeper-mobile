import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IotPage extends StatefulWidget {
  const IotPage({super.key, required this.user});
  final User user;

  @override
  State<IotPage> createState() => _IotPageState();
}

class _IotPageState extends State<IotPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your devices',
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFECE6F0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Turn on Wi-Fi'),
                    Switch(value: true, onChanged: (e) {})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Turn on Bluetooth'),
                    Switch(value: true, onChanged: (e) {})
                  ],
                ),
                Divider(thickness: 2),
                Text('Please enable your Wi-Fi and Bluetooth')
              ],
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFECE6F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: SizedBox(
                  width: 100,
                  height: 170,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Icon(
                        Icons.add,
                        size: 45,
                      ),
                      Text(
                        'Connect to Light Bulb',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF403041),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFECE6F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: SizedBox(
                  width: 100,
                  height: 170,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Icon(
                        Icons.add,
                        size: 45,
                      ),
                      Text(
                        'Connect to Smart Watch',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF403041),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
        ],
      ),
    );
  }
}

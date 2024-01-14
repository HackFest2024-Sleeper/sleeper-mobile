import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key, required this.user});
  final User user;

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Recommendations',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Text(
            'Wellness',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xCC6750A4),
                ),
                onPressed: () {},
                child: SizedBox(
                  width: 125,
                  child: Center(
                      child: Text(
                    'Exercise',
                    style: TextStyle(
                      color: Color(0xCCF7F5FF),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  )),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                  width: 125,
                  child: Center(
                    child: Text(
                      'Food',
                      style: TextStyle(
                        color: Color(0xFF1D1B20),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 400,
            width: double.infinity,
            padding: EdgeInsets.all(22),
            margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Color(0xCCFEF7FF),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Center(
              child: Column(children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                SizedBox(height: 13),
                Text(
                  'Running',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF403041),
                  ),
                ),
                Text(
                  '30 Minutes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6750A4),
                  ),
                ),
                Text(
                  '10 Min Warmup',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF403041),
                  ),
                ),
                Text(
                  '15 Min Run',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF403041),
                  ),
                ),
                Text(
                  '5 Min cool down',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF403041),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:sleeper_flutter/controllers/device_controller.dart';

class BulbPage extends StatefulWidget {
  const BulbPage({super.key});

  @override
  State<BulbPage> createState() => _BulbPageState();
}

class _BulbPageState extends State<BulbPage> {
  DeviceController deviceController = Get.put(DeviceController());
  bool isAutomaticMode = false; // Added variable for automatic mode

  Future<void> updateStatusDevice(String status) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      print("UID $uid");
      print("STATUS: $status");
      await deviceController.updateSmartLampStatus(
        status,
        uid,
      );
    } catch (e) {
      print("FAILED: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 35, right: 35, bottom: 35, top: 100),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set light intensity',
              style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Text(
              'Connected to smartlight',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SleekCircularSlider(
              initialValue: 50,
              min: 0,
              max: 100,
              appearance: CircularSliderAppearance(
                customColors: CustomSliderColors(
                  trackColor: Colors.white,
                  progressBarColor: Color(0xFFBF99B7),
                  dotColor: Color(0xFFBF99B7),
                ),
                angleRange: 240,
                startAngle: 150,
                customWidths: CustomSliderWidths(
                  trackWidth: 4,
                  handlerSize: 6,
                  progressBarWidth: 4,
                ),
                size: 400,
                counterClockwise: true,
              ),
              onChange: (value) {},
              innerWidget: (percentage) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${percentage.toInt()}%",
                      style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 33,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Text(
                      "Brightness",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 33,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      width: 140,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFF6750A4),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isAutomaticMode ? 'On' : 'Off',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Switch(
                            value: isAutomaticMode,
                            onChanged: (value) {
                              setState(() {
                                isAutomaticMode = value;
                                // Call the function to update the status
                                updateStatusDevice(
                                    isAutomaticMode ? 'On' : 'Off');
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

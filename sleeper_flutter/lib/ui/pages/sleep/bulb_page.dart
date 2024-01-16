import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class BulbPage extends StatefulWidget {
  const BulbPage({super.key});

  @override
  State<BulbPage> createState() => _BulbPageState();
}

class _BulbPageState extends State<BulbPage> {
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
              initialValue: 30,
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
                            'Automatic',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {},
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

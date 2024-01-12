import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Activity {
  String time;
  String desc;
  bool done;
  bool isAI;
  bool alarm;
  Activity(this.time, this.desc,
      {this.done = false, this.isAI = false, this.alarm = false});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});
  final User user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan tanggal dan waktu saat ini
    List<List<Object>> weekDate = [
      [0, 'Mon'],
      [0, 'Tue'],
      [0, 'Wed'],
      [0, 'Thu'],
      [0, 'Fri'],
      [0, 'Sat'],
      [0, 'Sun']
    ];
    List<Activity> activityList = [];
    activityList.add(Activity('07:00', 'Makan'));
    activityList.add(
        Activity('21:00', 'Berjemur', done: true, isAI: true, alarm: true));
    activityList.add(Activity('22:00', 'Belajar Dart'));
    activityList.add(Activity('23:00', 'Istirahat'));
    activityList.add(Activity('08:00', 'Olahraga Pagi', isAI: true));
    activityList.add(Activity('09:00', 'Bekerja'));
    activityList.sort((a, b) => a.time.compareTo(b.time));

    DateTime now = DateTime.now();
    DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);
    final date = DateTime.parse(now.toString());
    final weekStart = getDate(date.subtract(Duration(days: date.weekday - 1)));
    for (var i = 0; i < 7; i++) {
      weekDate[i][0] = weekStart.add(Duration(days: i)).day;
    }
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          profileInfo(widget.user),
          weekDayList(weekDate, now),
          activityBox(activityList),
        ],
      ),
    );
  }

  Widget activityBox(List<Activity> activityList) {
    return Container(
      width: double.infinity,
      height: 390,
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xB2FFFFFF),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
            child: Column(
              children: [
                const Text(
                  "Your Activity Today",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF403041)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                width: double.infinity,
                                height: 250,
                                padding: const EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      const TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Activity name',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: 'duration in minutes',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: 'Priority (1 to 10)',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('Add Activity'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF403041),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                      ),
                      child: const Text(
                        'Add New',
                        style: TextStyle(color: Color(0xFFF5F5F5)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF403041),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                      ),
                      child: const Text(
                        'Get AI Recommendation',
                        style: TextStyle(color: Color(0xFFF5F5F5)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            child: Divider(color: Colors.white),
          ),
          SizedBox(
            height: 260,
            width: double.infinity,
            child: ListView.builder(
              itemCount: activityList.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: activityList[index].done,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${activityList[index].time}, ${activityList[index].desc}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: activityList[index].isAI
                              ? Colors.green
                              : const Color(0xFF1D1B20),
                        ),
                      ),
                      activityList[index].alarm
                          ? const Icon(Icons.alarm_on_outlined,
                              color: Color(0xFF6750A4))
                          : const Icon(Icons.alarm_off_outlined)
                    ],
                  ),
                  onChanged: (bool? value) {
                    setState(
                      () {
                        activityList[index].done = value!;
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget weekDayList(List<List<Object>> weekDate, DateTime now) {
    return SizedBox(
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
              borderRadius: BorderRadius.circular(15),
              color: weekDate[index][0] == now.day
                  ? const Color(0xFF6750A4)
                  : const Color(0xFFFEF7FF),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "${weekDate[index][0]}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1D1B20),
                    ),
                  ),
                  Text(
                    "${weekDate[index][1]}",
                    style: const TextStyle(
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
    );
  }

  Widget profileInfo(User user) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            'Good Morning,\n${widget.user.email}',
            style: const TextStyle(
                fontSize: 33, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          Expanded(
            child: Container(),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (builder) {
                  return Dialog(
                    child: Container(
                      height: 150,
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email"),
                                  Text("Username"),
                                  Text("Join date"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(" : alfar@alfarlab.net"),
                                  Text(" : alfar"),
                                  Text(" : Dec, 24, 2024"),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF403041),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 0,
                              ),
                            ),
                            child: const Text(
                              'Sign Out',
                              style: TextStyle(color: Color(0xFFF5F5F5)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Icon(
              Icons.person_2_outlined,
              size: 37,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sleeper_flutter/controllers/activity_controller.dart';
import 'package:sleeper_flutter/controllers/recommendation_controller.dart';
import 'package:sleeper_flutter/models/user_activities_model.dart';

class SetupActivityPage extends StatefulWidget {
  const SetupActivityPage({super.key, required this.user});
  final User user;
  @override
  State<SetupActivityPage> createState() => _SetupActivityPageState();
}

class _SetupActivityPageState extends State<SetupActivityPage> {
  ActivityController activityController = Get.put(ActivityController());
  RecommendationController recommendationController =
      Get.put(RecommendationController());
  static String dateOnly(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  final String date = dateOnly(DateTime.now());

  bool isButtonDisabled = false;
  bool fixedTime = true;
  List<dynamic> activityList = [];
  Activity tempActivity = Activity(
      name: "name",
      priority: 0,
      duration: 0,
      date: DateTime.now(),
      time: "time");
  final TextEditingController activityNameController = TextEditingController();
  final TextEditingController activityDurationController =
      TextEditingController();
  final TextEditingController activityPriorityController =
      TextEditingController();

  Future<void> addActivity() async {
    try {
      DateTime date = DateTime.now();
      String uid = FirebaseAuth.instance.currentUser!.uid;
      print("UID1: $uid");
      await activityController.inputDailyActivity(
        activityNameController.text,
        activityDurationController.text,
        activityPriorityController.text,
        date,
        uid,
      );

      activityNameController.clear();
      activityDurationController.clear();
      activityPriorityController.clear();

      print("CALLING");
      // Call fetchActivities after adding the activity
      await fetchActivities(uid, date);

      // Use Navigator to pop the current screen
      Navigator.pop(context);
    } catch (e) {
      print("FAILED: $e");
    }
  }

  Future<void> fetchActivities(String uid, DateTime date) async {
    try {
      print("UID2: $uid");
      List<dynamic> activities = await activityController.getAllDailyActivities(
        date,
        uid,
      );

      setState(() {
        // Update the local activityList with data from the API response
        activityList = activities;
        print("DONE: $activityList");
      });
    } catch (e) {
      print("Error fetching activities: $e");
    }
  }

  // void addActivitys(Activity act) {
  //   setState(() {
  //     activityList.add(act);
  //     print(activityList);
  //     tempActivity = Activity("Test", 0, 0, "18:00");
  //     activityNameController.clear();
  //     activityDurationController.clear();
  //     activityPriorityController.clear();
  //   });
  // }

  void updateButton() {
    isButtonDisabled = activityNameController.text.isEmpty ||
            activityDurationController.text.isEmpty ||
            activityPriorityController.text.isEmpty
        ? true
        : false;
  }

  @override
  void initState() {
    super.initState();
    fetchActivities(widget.user.uid, DateTime.now());
    activityNameController.addListener(
      () {
        final String activityNameText = activityNameController.text;
        tempActivity.name = activityNameText;
      },
    );
    activityDurationController.addListener(
      () {
        final String activityDurationText = activityDurationController.text;
        isNumeric(activityDurationText)
            ? tempActivity.duration = int.parse(activityDurationText)
            : 0;
      },
    );
    activityPriorityController.addListener(
      () {
        final String activityPriorityText = activityPriorityController.text;
        isNumeric(activityPriorityText)
            ? tempActivity.priority = int.parse(activityPriorityText)
            : 0;
      },
    );
  }

  @override
  void dispose() {
    activityNameController.dispose();
    activityDurationController.dispose();
    activityPriorityController.dispose();
    super.dispose();
  }

  Future<void> createRecommendationBasedActivities() async {
    // if (activityList.isNotEmpty) {
    //   FirebaseFirestore db = FirebaseFirestore.instance;
    //   var data = UserActivitiesModel(
    //     widget.user.uid,
    //     date,
    //     activityList,
    //   ).toJson();
    //   db
    //       .collection('UserActivities')
    //       .add(data)
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

    try {
      DateTime date = DateTime.now();
      String uid = FirebaseAuth.instance.currentUser!.uid;
      print('save');
      await recommendationController.createActivitiesRecommendation(
        uid,
        date,
      );
      print('done');
      Navigator.pop(context);
    } catch (e) {
      print("Error creating recommendation: $e");
    }
  }

  bool isNumeric(String s) {
    return int.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    // activityList.length > 1
    //     ? activityList.sort((a, b) => a.time!.compareTo(b.time))
    //     : null;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Setup today's activity",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 37, right: 37, bottom: 37, top: 80),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xB2FFFFFF),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Add your activities',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF403041),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addActivityDialog(context);
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                  const Divider(thickness: 2, color: Colors.white),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: activityList.length,
                      itemBuilder: (context, index) {
                        final dynamic activityData = activityList[index];
                        return Row(
                          children: [
                            Expanded(
                              child: Text(
                                activityData['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1D1B20),
                                ),
                              ),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '${activityData['duration']} min',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1D1B20),
                              ),
                            ),
                            Text(
                              ', Priority: ${activityData['priority']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1D1B20),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    createRecommendationBasedActivities();
                  },
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> addActivityDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (builder) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                width: double.infinity,
                height: 350,
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: activityNameController,
                        onSubmitted: (value) => setState(() {
                          updateButton();
                        }),
                        decoration: InputDecoration(
                          hintText: 'Activity name',
                          errorText: activityNameController.text.isEmpty
                              ? "This is required"
                              : null,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: activityDurationController,
                              onSubmitted: (value) => setState(() {
                                updateButton();
                              }),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                errorText: activityNameController.text.isEmpty
                                    ? "This is required"
                                    : null,
                                hintText: 'duration in minutes',
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: activityPriorityController,
                              onSubmitted: (value) => setState(() {
                                updateButton();
                              }),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                errorText: activityNameController.text.isEmpty
                                    ? "This is required"
                                    : null,
                                hintText: 'Priority (1 to 10)',
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Row(
                      //   children: [
                      //     const Text('Fixed Time'),
                      //     Switch(
                      //       value: fixedTime,
                      //       onChanged: (bool value) {
                      //         setState(() {
                      //           fixedTime = value;
                      //         });
                      //       },
                      //     ),
                      //   ],
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addActivity();
                          });
                        },
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
    );
  }
}

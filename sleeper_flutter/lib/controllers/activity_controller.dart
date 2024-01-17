// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sleeper_flutter/utils/api_endpoints.dart';

class ActivityController extends GetxController {
  Future getAllDailyActivities(DateTime date, String uid) async {
    try {
      int year = date.year;
      int month = date.month;
      int day = date.day;
      String formattedDate = "$year-$month-$day";

      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse(
          '${APIEndpoints.baseUrl}activities/$uid/daily?date=$formattedDate');
      print("URL: $url");
      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        print("2000000");
        List<dynamic> responseBody = jsonDecode(response.body)['data'];
        print("RESPONSE BODY: $responseBody");

        return responseBody;
      } else {
        print("ELSENT");
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        throw jsonDecode(responseBody['msg']) ?? "Unknown error occured";
      }
    } catch (e) {
      print("ERROR: $e");
      // Get.back();
      // FlutterMaterial.showDialog(
      //     context: Get.context!,
      //     builder: (context) {
      //       return FlutterMaterial.SimpleDialog(
      //         title: const FlutterMaterial.Text("error"),
      //         contentPadding: const FlutterMaterial.EdgeInsets.all(20),
      //         children: [FlutterMaterial.Text(e.toString())],
      //       );
      //     });
    }
  }

  Future inputDailyActivity(String name, String duration, String priority,
      DateTime date, String uid) async {
    try {
      int year = date.year;
      int month = date.month;
      int day = date.day;
      String formattedDate = "$year-$month-$day";

      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse('${APIEndpoints.baseUrl}activities/daily');

      Map body = {
        'name': name,
        'duration': duration,
        'priority': priority,
        'date': formattedDate,
        'uid': uid,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
      } else {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        throw jsonDecode(responseBody['msg']) ?? "Unknown error occured";
      }
    } catch (e) {
      print("ERROR: $e");
    }
  }
}

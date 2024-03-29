// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sleeper_flutter/utils/api_endpoints.dart';

class RecommendationController extends GetxController {
  Future getActivitiesRecommendation(DateTime date, String uid) async {
    try {
      int year = date.year;
      int month = date.month;
      int day = date.day;
      String formattedDate = "$year-$month-$day";

      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse(
          '${APIEndpoints.baseUrl}$uid/recommendations/activities?date=$formattedDate');

      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> activitiesData = jsonDecode(response.body)['data'];

        // int id = activitiesData['id'];
        List<String> activities =
            List<String>.from(activitiesData['activities']);
        // String date = activitiesData['date'];

        return activities;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("ERROR: $e");
    }
  }

  Future createActivitiesRecommendation(String uid, DateTime date) async {
    try {
      int year = date.year;
      int month = date.month;
      int day = date.day;
      String formattedDate = "$year-$month-$day";

      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse('${APIEndpoints.baseUrl}recommendations/activities');

      Map body = {'uid': uid, 'date': formattedDate};

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

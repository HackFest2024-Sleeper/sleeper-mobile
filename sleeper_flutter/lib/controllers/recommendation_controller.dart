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
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sleeper_flutter/utils/api_endpoints.dart';

class DeviceController extends GetxController {
  Future updateSmartLampStatus(String status, String uid) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      var url = Uri.parse('${APIEndpoints.baseUrl}smart-lamp');

      Map body = {
        'status': status,
        'uid': uid,
      };

      http.Response response =
          await http.put(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
      } else {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        throw jsonDecode(responseBody['msg']) ?? "Unknown error occured";
      }
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
import 'dart:convert';
import 'package:flutter/material.dart' as FlutterMaterial;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sleeper_flutter/models/users.dart';
import 'package:sleeper_flutter/utils/api_endpoints.dart';

class AuthController extends GetxController {
  Future register(String uid, String name, String email, String token) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var url =
          Uri.parse(APIEndpoints.baseUrl + APIEndpoints.apiEndpoints.register);

      Map body = {
        'uid': uid,
        'fullName': name,
        'email': email,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Check if 'data' key is present in the response
        if (responseBody.containsKey('data')) {
          Map<String, dynamic> userData = responseBody['data'];

          // Assuming 'User' is a class that represents the user data
          User user = User(
            uid: userData['uid'],
            email: userData['email'],
            name: userData['name'],
          );

          return user;
        } else {
          throw "Data not found in the response";
        }
      } else {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        throw jsonDecode(responseBody['msg']) ?? "Unknown error occured";
      }
    } catch (e) {
      Get.back();
      FlutterMaterial.showDialog(
          context: Get.context!,
          builder: (context) {
            return FlutterMaterial.SimpleDialog(
              title: const FlutterMaterial.Text("error"),
              contentPadding: const FlutterMaterial.EdgeInsets.all(20),
              children: [FlutterMaterial.Text(e.toString())],
            );
          });
    }
  }
}

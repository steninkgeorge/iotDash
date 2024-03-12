import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:iotdashnew/constant/ip.dart';

class HttpService {
  static Future getRequest(String endpoint) async {
    final response = await http.get(Uri.parse("$ipAddress$endpoint"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('faile to load data');
    }
  }

  static Future<String> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse("$ipAddress$endpoint"),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('failed to post data');
    }
  }

  static getSample() {}
}

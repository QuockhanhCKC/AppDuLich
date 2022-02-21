import 'dart:convert';
import 'dart:math';

import 'package:appdulich/API/User_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  static List<Users> parseUsers(String r) {
    final parse = jsonDecode(r).cast<Map<String, dynamic>>();
    return parse.map<Users>((e) => Users.fromJson(e)).toList();
  }

  static Future<List<Users>> fecthusers() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/User/'));
    return parseUsers(response.body);
  }

  static Future<Users> fecthusersById(int? id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/User/$id'));
    return Users.fromJson(jsonDecode(response.body));
  }

  static Future<Users?> fetchuser_register(String name,
      String email, String password) async {
    final response =
        await http.post(Uri.parse('http://10.0.2.2:8000/api/User/register'),
            //headers: {"Content-Type": "application/json"},
            body: ({'email': email, 'password': password}));
    if (response.statusCode == 200) {
      return Users.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed');
  }

  static Future<Users> fetchuser_login(String email, String password) async {
    final response =
        await http.post(Uri.parse('http://10.0.2.2:8000/api/User/login/?data'),
            //headers: {"Content-Type": "application/json"},
            body: ({'email': email, 'password': password}));
    if (response.statusCode == 200) {
      return Users.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed');
  }
}


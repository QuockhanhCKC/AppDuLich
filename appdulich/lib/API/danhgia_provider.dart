import 'dart:convert';

import 'package:appdulich/API/Danhgia_object.dart';

import 'package:http/http.dart' as http;

class Danhgiaprovider {
  static List<danhgia> parseSites(String r) {
    final parse = jsonDecode(r).cast<Map<String, dynamic>>();
    return parse.map<danhgia>((e) => danhgia.fromJson(e)).toList();
  }

  static Future<List<danhgia>> fecthSitesDanhgia(int? id) async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/Diadanh/$id/Danhgia'));
    return parseSites(response.body);
  }
}

import 'dart:convert';

import 'package:appdulich/API/Sites_object.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class SitesProvider {
  static List<Sites> parseSites(String r) {
    final parse = jsonDecode(r).cast<Map<String, dynamic>>();
    return parse.map<Sites>((e) => Sites.fromJson(e)).toList();
  }

  static Future<List<Sites>> fecthSites() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/Diadanh/'));
    return parseSites(response.body);
  }

  static Future<Sites> fecthSitesById(int? id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/Diadanh/$id'));
    return Sites.fromJson(jsonDecode(response.body));
  }

  static Future<List<Sites>> fecthSiteLoai(String read) async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/Diadanh/loai/$read'));
    return parseSites(response.body);
  }
}

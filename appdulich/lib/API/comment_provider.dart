import 'dart:convert';

import 'package:appdulich/API/comment_object.dart';

import 'package:http/http.dart' as http;

class commentprovider {
  static List<comment> parsecommet(String r) {
    final parse = jsonDecode(r).cast<Map<String, dynamic>>();
    return parse.map<comment>((e) => comment.fromJson(e)).toList();
  }

  static Future<List<comment>> fecthSitescomment(int? id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/Post/$id/Comment'));
    return parsecommet(response.body);
  }
}

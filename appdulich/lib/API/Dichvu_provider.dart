import 'dart:convert';

import 'package:appdulich/API/Dichvu_object.dart';
import 'package:http/http.dart' as http;

class DichvuProvider {
  static List<Dichvu> parseDichvu(String r) {
    final parse = jsonDecode(r).cast<Map<String, dynamic>>();
    return parse.map<Dichvu>((e) => Dichvu.fromJson(e)).toList();
  }

  static Future<List<Dichvu>> fecthDichvu() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/Dichvu/'));
    return parseDichvu(response.body);
  }

  static Future<Dichvu> fecthDichvuById(int? id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/Dichvu/$id'));
    return Dichvu.fromJson(jsonDecode(response.body));
  }

  static Future<List<Dichvu>> fecthDichvuLoai(String read) async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/api/Dichvu/loai/$read'));
    return parseDichvu(response.body);
  }
}

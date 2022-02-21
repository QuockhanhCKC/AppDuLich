import 'dart:convert';

import 'package:appdulich/API/Post_object.dart';

import 'package:http/http.dart' as http;

class PostProvider {
  static List<Post> parsePost(String r) {
    final parse = jsonDecode(r).cast<Map<String, dynamic>>();
    return parse.map<Post>((e) => Post.fromJson(e)).toList();
  }

  static Future<List<Post>> fecthPost() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/Post/'));
    return parsePost(response.body);
  }

  static Future<Post> fecthPostById(int? id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/Post/$id'));
    return Post.fromJson(jsonDecode(response.body));
  }

  static Future<List<Post>> fecthPostDanhgia(int? id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/Post/$id/Comment'));
    return parsePost(response.body);
  }

  static Future<List<Post>> fecthPost_user(int? id) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/User/$id/Post'));
    return parsePost(response.body);
  }
    static Future<Post?> fetchuser_create(String noidung,
      int? id, int? idDiadanh) async {
    final response =
        await http.post(Uri.parse('http://10.0.2.2:8000/api/User/register'),
            //headers: {"Content-Type": "application/json"},
            body: ({}));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed');
  }
}

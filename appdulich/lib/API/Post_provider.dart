import 'dart:convert';
import 'dart:io';

import 'package:appdulich/API/Post_object.dart';

import 'package:http_parser/http_parser.dart';
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

  static Future<Post?> fetchPost_create(
      String noidung, String img, int? id, int? idDiadanh) async {
    // lay ten image

    var request = new http.MultipartRequest(
        "POST", Uri.parse('http://10.0.2.2:8000/api/Post'))
      ..fields['noidung'] = noidung
      ..fields['iduser'] = id.toString()
      ..fields['idDiadanh'] = idDiadanh.toString()
      ..files.add(await http.MultipartFile.fromPath('image', img,
          contentType: MediaType('image', 'jpg')));
    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
      else return print("Fail!");
    });
   
    
  }
}

import 'dart:io';

import 'package:appdulich/API/Post_provider.dart';
import 'package:appdulich/API/Sites_object.dart';
import 'package:appdulich/API/Sites_provider.dart';
import 'package:appdulich/API/User_object.dart';
import 'package:appdulich/API/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  final int? id;
  const CreatePost({Key? key, required this.id}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState(id: this.id);
}

class _CreatePostState extends State<CreatePost> {
  final int? id;

  _CreatePostState({required this.id});
  late int idDiadanh;
  File? _image;
  final _picker = ImagePicker();
  TextEditingController noidung = TextEditingController();
  Future getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    _image = File(image.path);
    setState(() {});
  }

  void uploadImage(File img) async {
    // PostProvider.fetchuser_create(noidung.text, img, id,idDiadanh)
  }
  // Option 2

  late String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Tạo Bài Viết',
          style: TextStyle(color: Colors.black),
        ),
        actions: [MaterialButton(onPressed: () {}, child: Text('Đăng Bài'))],
      ),
      body: FutureBuilder<Users>(
        future: UserProvider.fecthusersById(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            Users users = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: users.avatar != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10000.0),
                              child: CachedNetworkImage(
                                imageUrl: '${users.avatar}',
                                height: 50,
                              ))
                          : CircleAvatar(
                              child: Text(
                                users.name!.substring(0, 1).toUpperCase(),
                                style: TextStyle(fontSize: 50),
                              ),
                            ),
                      title: Text(users.name.toString()),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Chọn Địa Danh'),
                          MaterialButton(
                            onPressed: () {},
                            child: Text(
                              'Đây Là Đâu',
                              style: TextStyle(color: Colors.amber[800]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Bạn Đang Nghỉ Gì?',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                        height: MediaQuery.of(context).size.width * 0.8,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: _image == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Chọn Ảnh',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: getImage,
                                    icon: Icon(Icons.camera_alt),
                                  )
                                ],
                              )
                            : Center(
                                child: Image.file(_image!),
                              )),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

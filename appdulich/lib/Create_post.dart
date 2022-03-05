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
  late String Diadanhname = "Chọn Địa Danh";
  Future getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    _image = File(image.path);
    setState(() {});
  }

  void uploadImage(File img) async {
    PostProvider.fetchPost_create(noidung.text, img.path, id, idDiadanh)
        .then((value) {
      return Navigator.pop(context);
    });
  }
  // Option 2

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: FutureBuilder<List<Sites>>(
        future: SitesProvider.fecthSites(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            List<Sites> sites = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: sites.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(sites[index].name.toString()),
                  onTap: () {
                    setState(() {
                      idDiadanh = sites[index].id!;
                      Diadanhname = sites[index].name!;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

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
        actions: [
          MaterialButton(
              onPressed: () {
                if (idDiadanh != null && _image != null) uploadImage(_image!);
                //Navigator.pop(context);
              },
              child: Text('Đăng Bài'))
        ],
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
                          Text(Diadanhname.toString()),
                          Align(
                            child: MaterialButton(
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Địa Danh'),
                                    content: setupAlertDialoadContainer(),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Đây Là Đâu',
                                style: TextStyle(color: Colors.amber[800]),
                              ),
                            ),
                            alignment: Alignment.topRight,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: noidung,
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

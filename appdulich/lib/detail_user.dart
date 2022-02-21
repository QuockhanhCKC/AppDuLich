import 'dart:io';

import 'package:appdulich/API/User_object.dart';
import 'package:appdulich/API/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class detailuser extends StatefulWidget {
  final int? id;
  const detailuser({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailuserstate(id: this.id);
  }
}

class detailuserstate extends State<detailuser> {
  final int? id;
  detailuserstate({required this.id});
  File? image;
  final _picker = ImagePicker();
  FuturecheckImage() async {
    final pickerfile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickerfile != null) {
       image = File(pickerfile.path);
      setState(() {
       
      });
    }
  }
  


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Thông tin cá Nhân'),
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
            return ListView(
              children: [
                Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 130,
                    width: 130,
                    child: users.avatar != null
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
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.camera_alt),
                      ))
                ]),
                Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: size.height * 0.7,
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            users.email.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Tên'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'sdt'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Tuổi'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                ),
                                child: Text(
                                  'cập nhật',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: OutlinedButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, 'wellcome'),
                                child: Text(
                                  'Đăng xuất >',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ))
              ],
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

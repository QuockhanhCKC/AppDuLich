import 'dart:io';

import 'package:appdulich/API/User_object.dart';
import 'package:appdulich/API/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class detailuser extends StatefulWidget {
  final Users user;
  const detailuser({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailuserstate(users: this.user);
  }
}

class detailuserstate extends State<detailuser> {
  final Users users;
  detailuserstate({required this.users});
  TextEditingController name = TextEditingController();
  TextEditingController old = TextEditingController();
  TextEditingController phone = TextEditingController();

  void _BindingContact() {
    setState(() {});
    name.text = users.name!;
    old.text = users.old!;
    phone.text = users.phone!;
  }

  @override
  void initState() {
    super.initState();
    _BindingContact();
  }

  File? _image = null;
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
    UserProvider.fetchUser_update(users.id,img.path, name.text, old.text, phone.text)
        .then((value) => Navigator.pop(context));
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
        future: UserProvider.fecthusersById(users.id),
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
                      child: _image == null
                          ? users.avatar != null
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
                                )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10000.0),
                              child: Image.file(
                                _image!,
                                height: 50,
                              ))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        onPressed: getImage,
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
                          controller: name,
                          decoration: InputDecoration(labelText: 'Tên'),
                        ),
                        TextField(
                          controller: phone,
                          decoration: InputDecoration(labelText: 'sdt'),
                        ),
                        TextField(
                          controller: old,
                          decoration: InputDecoration(labelText: 'Tuổi'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: OutlinedButton(
                                onPressed: () =>{
                                  if(_image!=null)
                                  uploadImage(_image!)
                                },
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

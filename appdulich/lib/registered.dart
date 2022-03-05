import 'dart:convert';

import 'package:appdulich/API/User_object.dart';
import 'package:appdulich/API/user_provider.dart';

import 'package:appdulich/login.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => registeredState();
}

class registeredState extends State<RegisteredPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController check = TextEditingController();
  final Users us = Users();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.2),
              child: Image(
                image: AssetImage('images/nui_ba_den.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Đăng Ký',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(15)),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            controller: name,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Tên Người Dùng'),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(15)),

                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                                border: InputBorder.none, labelText: 'Mail'),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(15)),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Mật Khẩu'),
                            obscureText: true,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(15)),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            controller: check,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Nhập Lại Mật Khẩu'),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            color: Colors.black,
                            onPressed: () async {
                              if (password.text == check.text) {
                                if (email.text == null ||
                                    password.text == null) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      content: const Text(
                                          'email hoặc mật khẩu trống'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  await UserProvider.fetchuser_register(
                                          name.text, email.text, password.text)
                                      .then((value) {
                                    setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginPage(),
                                          ));
                                    });
                                  });
                                }
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Đăng Ký',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(' Đăng Nhập Ngay >'))),
                  ],
                )),
          ],
        ),
      ]),
    );
  }
}

import 'package:appdulich/API/User_object.dart';
import 'package:appdulich/API/user_provider.dart';
import 'package:appdulich/home.dart';
import 'package:appdulich/registered.dart';
import 'package:appdulich/restaurant_hotel.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
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
                        'Đăng Nhập',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Tên Tài Khoản Hoặc Mail'),
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
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            color: Colors.black,
                            onPressed: () async {
                              if (email.text == null || password.text == null) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    content:
                                        const Text('email hoặc mật khẩu trống'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                await UserProvider.fetchuser_login(
                                        email.text, password.text)
                                    .then((value) {
                                  if (value != null)
                                    setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyHomePage(
                                                    id: value.id,
                                                  ),
                                              settings: RouteSettings(
                                                  name: '/home')));
                                    });
                                });
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Đăng nhập',
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
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisteredPage(),
                                )),
                            child: Text('Đăng Ký Ngay >'))),
                  ],
                )),
          ],
        ),
      ]),
    );
  }
}

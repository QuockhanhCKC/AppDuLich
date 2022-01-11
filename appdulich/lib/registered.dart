import 'package:appdulich/detailregistered.dart';
import 'package:flutter/material.dart';

class RegisteredPage extends StatefulWidget {
  const RegisteredPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => registeredState();
}

class registeredState extends State<RegisteredPage> {
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
                  bottom: MediaQuery.of(context).size.width * 0.1),
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
                        'Đăng kÝ',
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
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Mật Khẩu'),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(15)),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Nhập Lại Mật Khẩu'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            color: Colors.black,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailRegisteredPage(),
                                )),
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
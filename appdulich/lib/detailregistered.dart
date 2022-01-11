import 'package:flutter/material.dart';

class DetailRegisteredPage extends StatefulWidget {
  const DetailRegisteredPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => detailregisteredState();
}

class detailregisteredState extends State<DetailRegisteredPage> {
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
                        'Điền Thông Tin Tài Khoản',
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
                                border: InputBorder.none,
                                labelText: 'Tên Tài Khoản'),
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
                                labelText: 'giới tính'),
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
                                labelText: 'Số Điện thoại'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            color: Colors.black,
                            onPressed: () =>
                                Navigator.pushNamed(context, 'home'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Tiếp',
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
                            onPressed: () =>
                                Navigator.pushNamed(context, 'home'),
                            child: Text(' bỏ qua >'))),
                  ],
                )),
          ],
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: camel_case_types
class detailuser extends StatefulWidget {
  const detailuser({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailuserstate();
  }
}

class detailuserstate extends State<detailuser> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Thông tin cá Nhân'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            Container(
                padding: EdgeInsets.all(5),
                height: 130,
                width: 130,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avatar.jpg'),
                )),
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
                  TextField(
                    decoration: InputDecoration(labelText: 'Tên'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'sdt'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'giới tính'),
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
                              side: BorderSide(width: size.width * 0.3)),
                          child: Text(
                            'cập nhật',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(width: size.width * 0.3)),
                          child: Text(
                            'Đăng xuất',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ))
        ],
      )),
    );
  }
}

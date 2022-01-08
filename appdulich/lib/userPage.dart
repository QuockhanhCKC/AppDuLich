import 'package:appdulich/detailuser.dart';
import 'package:flutter/material.dart';

class Userpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserState();
  }
}

class UserState extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 250,
                padding: EdgeInsets.only(bottom: size.height * 0.8),
                decoration: BoxDecoration(
                    color: Colors.amber[800],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(5),
                              height: 130,
                              width: 130,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/avatar.jpg'),
                              )),
                          Container(
                            child: Text(
                              'xiếc trung Tâm',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detailuser(),
                                  ));
                            },
                            child: Text(
                              'thông tin người dùng >',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child: MaterialButton(
                              color: Colors.black54,
                              onPressed: () {},
                              child: Text(
                                'thông tin người dùng',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              minWidth: size.width,
                            ),
                          ),
                          Card(
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/avatar.jpg'),
                                ),
                                title: Text('Xiếc trung Tâm'),
                                subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('đẹp vãi luôn'),
                                      Container(
                                          height: size.height * 0.35,
                                          padding: EdgeInsets.all(10),
                                          child: Image(
                                            image:
                                                AssetImage('images/avatar.jpg'),
                                            fit: BoxFit.cover,
                                          ))
                                    ])),
                          ),
                          Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/avatar.jpg'),
                              ),
                              title: Text('Xiếc trung Tâm'),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('đẹp vãi luôn'),
                                    Container(
                                        height: size.height * 0.35,
                                        padding: EdgeInsets.all(10),
                                        child: Image(
                                          image:
                                              AssetImage('images/avatar.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.thumb_up,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text('0'),
                                        TextButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.thumb_down,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text('0'),
                                      ],
                                    )
                                  ]),
                              onTap: () {},
                            ),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

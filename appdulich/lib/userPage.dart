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
        shrinkWrap: true,
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 250,
                padding: EdgeInsets.only(bottom: size.height * 0.8),
                decoration: BoxDecoration(
                    color: Colors.amber[800],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
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
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
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
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                GestureDetector(
                                  child: Image(
                                    height: 200,
                                    image: AssetImage('images/avatar.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: Image(
                                    height: 200,
                                    image: AssetImage('images/avatar.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: Image(
                                    height: 200,
                                    image: AssetImage('images/avatar.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: Image(
                                    height: 200,
                                    image: AssetImage('images/avatar.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: Image(
                                    height: 200,
                                    image: AssetImage('images/avatar.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  onTap: () {},
                                ),
                              ],
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

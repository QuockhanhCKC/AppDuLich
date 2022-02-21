import 'package:appdulich/screenwiget/Allpost.dart';

import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = AllPost();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber[800],
        centerTitle: true,
        title: Text('App Du Lịch',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            child: AllPost(),
          ),
        ],
      ),
    );
  }
}

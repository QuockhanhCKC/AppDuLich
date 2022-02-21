import 'package:appdulich/Create_post.dart';
import 'package:appdulich/Sites.dart';
import 'package:appdulich/post.dart';

import 'package:appdulich/share.dart';
import 'package:appdulich/userPage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final int? id;
  const MyHomePage({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomeState(id: id);
  }
}

class MyHomeState extends State<MyHomePage> {
  final int? id;
  MyHomeState({required this.id});
  late List<Widget> screens;
  int _selectedIndex = 0;
  void initState() {
    super.initState();
    screens = <Widget>[
      SitesPage(),
      PostPage(),
      SharePage(),
      Userpage(
        id: id,
      )
    ];
  }

  final List<IconData> icons = [
    Icons.home,
    Icons.import_contacts,
    Icons.favorite,
    Icons.person
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = SitesPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: Container(
          height: 80.0,
          width: 80.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatePost(id:id),
                  ));
            },
            backgroundColor: Colors.amber[800],
            child: Icon(Icons.camera_alt_outlined),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 20,
          child: Container(
              height: 60,
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                  //children inside bottom appbar
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[0];

                          _selectedIndex = 0;
                        });
                      },
                      icon: Icon(icons[0],
                          size: _selectedIndex == 0 ? 45 : 40,
                          color: _selectedIndex == 0
                              ? Colors.orange
                              : Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[1];

                          _selectedIndex = 1;
                        });
                      },
                      icon: Icon(icons[1],
                          size: _selectedIndex == 1 ? 45 : 40,
                          color: _selectedIndex == 1
                              ? Colors.orange
                              : Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[2];

                          _selectedIndex = 2;
                        });
                      },
                      icon: Icon(icons[2],
                          size: _selectedIndex == 2 ? 45 : 40,
                          color: _selectedIndex == 2
                              ? Colors.orange
                              : Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[3];

                          _selectedIndex = 3;
                        });
                      },
                      icon: Icon(icons[3],
                          size: _selectedIndex == 3 ? 45 : 40,
                          color: _selectedIndex == 3
                              ? Colors.orange
                              : Colors.grey),
                    )
                  ])),
        ));
  }
}

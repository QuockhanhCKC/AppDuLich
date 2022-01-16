import 'package:appdulich/Sites.dart';
import 'package:appdulich/post.dart';
import 'package:appdulich/restaurant_hotel.dart';
import 'package:appdulich/share.dart';
import 'package:appdulich/userPage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    PostPage(),
    SitesPage(),
    SharePage(),
    Userpage()
  ];
  final List<IconData> icons = [
    Icons.home,
    Icons.room,
    Icons.favorite,
    Icons.person
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = PostPage();
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
            onPressed: () {},
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

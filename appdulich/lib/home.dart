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
  PageController page = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    page.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: PageView(
          controller: page,
          children: [
            Text(
              'bài viết',
            ),
            Text(
              'Địa danh',
            ),
            Userpage(),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Bài Viết',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.room),
              label: 'Địa Danh',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tài Khoản',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          tooltip: 'Đăng Bài',
          child: const Icon(Icons.add),
        ));
  }
}

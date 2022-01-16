import 'package:appdulich/screenwiget/Allpost.dart';
import 'package:appdulich/screenwiget/hotpost.dart';
import 'package:appdulich/screenwiget/newpost.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  List<String> categories = ["Tất Cả", " bài mới", "bài viết nổi bật"];
  final List<Widget> screens = [
    AllPost(),
    newpost(),
    hotpost(),
  ];
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
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Row(
                      children: [buildCategoriitem(index)],
                    )),
          ),
          PageStorage(bucket: bucket, child: currentScreen)
        ],
      ),
    );
  }

  Widget buildCategoriitem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          currentScreen = screens[index];
        });
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            categories[index],
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.orange : Colors.grey),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:fluttericon/typicons_icons.dart';

class SitesPage extends StatefulWidget {
  const SitesPage({Key? key}) : super(key: key);

  @override
  _SitesPageState createState() => _SitesPageState();
}

class _SitesPageState extends State<SitesPage> {
  final List<String> cate = ['Nổi Bật', 'Địa Điểm mới', 'Tuour & phượt'];
  final List<IconData> iconcate = [
    Icons.dashboard,
    Icons.explore,
    FontAwesome.font_awesome,
  ];
  final List<Color> colors = [
    Colors.cyan,
    Colors.orange,
    Colors.purple,
  ];
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                padding: EdgeInsets.all(15),
                height: 100,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cate.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(
                              iconcate[index],
                              color: colors[index],
                            ),
                            Text(cate[index])
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Địa Điểm Mới',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextButton(onPressed: () {}, child: Text('xem thêm >'))
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                              width: 200,
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'núi bà Den',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image(
                                            image: AssetImage(
                                                'images/nui_ba_den.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                            children: [
                                              Icon(Icons.near_me,
                                                  color: Colors.amber[800]),
                                              Text(
                                                'Tây Ninh',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.amber[800]),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dịa Điểm Nổi Bật',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextButton(onPressed: () {}, child: Text('xem thêm >'))
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                    width: 200,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'núi bà Den',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: Image(
                                              image: AssetImage(
                                                  'images/nui_ba_den.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              children: [
                                                Icon(Icons.near_me,
                                                    color: Colors.amber[800]),
                                                Text(
                                                  'Tây Ninh',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.amber[800]),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              )),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Tất Cả Địa Danh',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 40,
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Container(
                                    width: 200,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'núi bà Den',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: Image(
                                              image: AssetImage(
                                                  'images/nui_ba_den.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              children: [
                                                Icon(Icons.near_me,
                                                    color: Colors.amber[800]),
                                                Text(
                                                  'Tây Ninh',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.amber[800]),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

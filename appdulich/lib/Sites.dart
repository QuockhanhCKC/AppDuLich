import 'package:appdulich/API/Sites_object.dart';
import 'package:appdulich/API/Sites_provider.dart';
import 'package:appdulich/Detail_Sites.dart';
import 'package:appdulich/screenwiget/Luutru.dart';
import 'package:appdulich/screenwiget/NewSite.dart';
import 'package:appdulich/screenwiget/NoiBat_site.dart';
import 'package:appdulich/screenwiget/QuanAn.dart';
import 'package:appdulich/screenwiget/Tuor.dart';
import 'package:appdulich/search.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class SitesPage extends StatefulWidget {
  const SitesPage({Key? key}) : super(key: key);

  @override
  _SitesPageState createState() => _SitesPageState();
}

class _SitesPageState extends State<SitesPage> {
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
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Sites>>(
        future: SitesProvider.fecthSites(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            return SitesList(sites: snapshot.data!);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class SitesList extends StatelessWidget {
  final List<Sites> sites;

  final List<String> cate = [
    'Nổi Bật',
    'Địa Điểm mới',
    'Tour & phượt',
    'Quán Ăn',
    'Lưu Trú'
  ];
  final List<Widget> screens = [
    NoiBatPage(),
    NewSitePage(),
    TuorPage(),
    QuanAn(),
    LuuTru(),
  ];
  final List<IconData> iconcate = [
    Icons.dashboard,
    Icons.explore,
    FontAwesome.font_awesome,
    FontAwesome.spoon,
    FontAwesome.home,
  ];
  final List<Color> colors = [
    Colors.cyan,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.orange,
  ];

  SitesList({Key? key, required this.sites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.all(10),
            height: 200,
            child: Expanded(
              flex: 2,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: cate.length,
                itemBuilder: (context, index) => MaterialButton(
                  height: 80,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screens[index],
                        ));
                  },
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
          SizedBox(
            height: 10,
          ),
          FutureBuilder<List<Sites>>(
            future: SitesProvider.fecthSiteLoai('new'),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              } else if (snapshot.hasData) {
                List<Sites> s = snapshot.data!;
                return Container(
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Địa Điểm Mới',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {}, child: Text('xem thêm >'))
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: s.length,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Container(
                                width: 200,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DeatialSitesPage(
                                              id: s[index].id,
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              s[index].name.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '${s[index].imageDiadanh}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(children: [
                                              Icon(Icons.visibility,
                                                  color: Colors.amber[800]),
                                              Text(
                                                '${s[index].luotXem}',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.amber[800]),
                                              )
                                            ]),
                                          )
                                        ],
                                      ),
                                    )),
                              )),
                        ),
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          FutureBuilder<List<Sites>>(
            future: SitesProvider.fecthSiteLoai('Tuor'),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              } else if (snapshot.hasData) {
                List<Sites> s = snapshot.data!;
                return Container(
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tuor Phượt',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {}, child: Text('xem thêm >'))
                        ],
                      ),
                      Expanded(
                          child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: s.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            width: 200,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DeatialSitesPage(
                                        id: s[index].id,
                                      ),
                                    ));
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        s[index].name.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: CachedNetworkImage(
                                        imageUrl: '${s[index].imageDiadanh}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          Icon(Icons.visibility,
                                              color: Colors.amber[800]),
                                          Text(
                                            '${s[index].luotXem}',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.amber[800]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder<List<Sites>>(
            future: SitesProvider.fecthSiteLoai('hot'),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              } else if (snapshot.hasData) {
                List<Sites> s = snapshot.data!;
                return Container(
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dịa Điểm Nổi Bật',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {}, child: Text('xem thêm >'))
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: s.length,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Container(
                                width: 200,
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DeatialSitesPage(
                                                    id: s[index].id),
                                          ));
                                    },
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              s[index].name.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '${s[index].imageDiadanh}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              children: [
                                                Icon(Icons.visibility,
                                                    color: Colors.amber[800]),
                                                Text(
                                                  '${s[index].luotXem}',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.amber[800]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              )),
                        ),
                      )
                    ],
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    indent: 0.5,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tất Cả Địa Danh',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
                      itemCount: sites.length,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                                width: 200,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DeatialSitesPage(
                                            id: sites[index].id,
                                          ),
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '${sites[index].imageDiadanh}',
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
                                              '${sites[index].name}',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.amber[800]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
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
    );
  }
}

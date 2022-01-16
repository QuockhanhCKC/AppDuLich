import 'package:flutter/material.dart';

class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber[800],
          centerTitle: true,
          title: Text('App Du Lịch',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black38,
              tabs: [
                Center(
                  child: Text(
                    'Bài Viết Yêu Thích',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Center(
                  child: Text(
                    'Địa Danh Yêu Thích',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ]),
        ),
        body: TabBarView(children: [
          post_detail(),
          Text(
            'Chưa có Địa Danh yêu thích',
            style: TextStyle(fontSize: 16),
          )
        ]),
      ),
    );
  }
}

class post_detail extends StatefulWidget {
  const post_detail({Key? key}) : super(key: key);

  @override
  _post_detailState createState() => _post_detailState();
}

class _post_detailState extends State<post_detail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/avatar.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Xiếc trung Tâm'),
                ],
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('đẹp vãi luôn'),
                    Container(
                        height: 400,
                        padding: EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage('images/avatar.jpg'),
                          fit: BoxFit.cover,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
          ),
          Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/avatar.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Xiếc trung Tâm'),
                ],
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('đẹp vãi luôn'),
                    Container(
                        height: 400,
                        padding: EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage('images/avatar.jpg'),
                          fit: BoxFit.cover,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
      ),
    );
  }
}

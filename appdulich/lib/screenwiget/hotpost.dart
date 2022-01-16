import 'package:flutter/material.dart';

class hotpost extends StatefulWidget {
  const hotpost({Key? key}) : super(key: key);

  @override
  _newpostState createState() => _newpostState();
}

class _newpostState extends State<hotpost> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
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

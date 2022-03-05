import 'package:appdulich/API/Post_object.dart';
import 'package:appdulich/API/Post_provider.dart';
import 'package:appdulich/API/User_object.dart';
import 'package:appdulich/API/user_provider.dart';
import 'package:appdulich/detail_post.dart';
import 'package:appdulich/detail_user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Userpage extends StatefulWidget {
  final int? id;
  const Userpage({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserState(id: id);
  }
}

class UserState extends State<Userpage> {
  final int? id;
  UserState({required this.id});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      body: FutureBuilder<Users>(
        future: UserProvider.fecthusersById(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            Users users = snapshot.data!;
            return ListView(
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 40),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    height: 130,
                                    width: 130,
                                    child: users.avatar != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10000.0),
                                            child: CachedNetworkImage(
                                              imageUrl: '${users.avatar}',
                                              height: 50,
                                            ))
                                        : CircleAvatar(
                                            child: Text(
                                              users.name!
                                                  .substring(0, 1)
                                                  .toUpperCase(),
                                              style: TextStyle(fontSize: 50),
                                            ),
                                          )),
                                Container(
                                  child: Text(
                                    users.name.toString(),
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
                                          builder: (context) => detailuser(
                                            user: users,
                                          ),
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
                                  child: FutureBuilder<List<Post>>(
                                    future: PostProvider.fecthPost_user(id),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return Center(
                                          child: Text('Error'),
                                        );
                                      } else if (snapshot.hasData) {
                                        List<Post> post = snapshot.data!;
                                        return GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                            ),
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: post.length,
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (context, index) => Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: GestureDetector(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              '${post[index].image}',
                                                          fit: BoxFit.cover,
                                                        ),
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    DetailpostPage(
                                                                        id: post[index].id
                                                                            ),
                                                              ));
                                                        },
                                                      ),
                                                    ));
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

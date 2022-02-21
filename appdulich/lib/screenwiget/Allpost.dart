import 'package:appdulich/API/Post_object.dart';
import 'package:appdulich/API/Post_provider.dart';
import 'package:appdulich/API/User_object.dart';
import 'package:appdulich/API/user_provider.dart';
import 'package:appdulich/detail_post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AllPost extends StatefulWidget {
  const AllPost({Key? key}) : super(key: key);

  @override
  _AllPostState createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: PostProvider.fecthPost(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
          List<Post> post = snapshot.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: FutureBuilder<Users>(
                    future: UserProvider.fecthusersById(post[index].iduser),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error'),
                        );
                      } else if (snapshot.hasData) {
                        Users users = snapshot.data!;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10000.0),
                                child: CachedNetworkImage(
                                  imageUrl: '${users.avatar}',
                                  height: 50,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(users.name.toString()),
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${post[index].noidung}'),
                        Container(
                            height: 400,
                            padding: EdgeInsets.all(10),
                            child: CachedNetworkImage(
                              imageUrl: '${post[index].image}',
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
                            Text(post[index].luotLike.toString()),
                            TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.thumb_down,
                                color: Colors.orange,
                              ),
                            ),
                            Text(post[index].disLike.toString()),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(children: [
                                Icon(Icons.visibility,
                                    color: Colors.amber[800]),
                                Text(post[index].luotXem.toString()),
                              ]),
                            )
                          ],
                        )
                      ]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailpostPage(
                            id: post[index].id,
                          ),
                        ));
                  },
                ),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

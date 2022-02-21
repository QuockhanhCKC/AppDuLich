import 'package:appdulich/API/Post_object.dart';
import 'package:appdulich/API/Post_provider.dart';
import 'package:appdulich/API/Sites_object.dart';
import 'package:appdulich/API/Sites_provider.dart';
import 'package:appdulich/API/User_object.dart';
import 'package:appdulich/API/comment_object.dart';
import 'package:appdulich/API/comment_provider.dart';
import 'package:appdulich/API/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailpostPage extends StatefulWidget {
  final int? id;
  const DetailpostPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailpostPageState createState() => _DetailpostPageState(id: id);
}

class _DetailpostPageState extends State<DetailpostPage> {
  final int? id;
  _DetailpostPageState({required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: FutureBuilder<Post>(
        future: PostProvider.fecthPostById(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            Post post = snapshot.data!;
            return Column(
              children: <Widget>[
                FutureBuilder<Users>(
                  future: UserProvider.fecthusersById(post.iduser),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error'),
                      );
                    } else if (snapshot.hasData) {
                      Users users = snapshot.data!;
                      return ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10000.0),
                            child: CachedNetworkImage(
                              imageUrl: '${users.avatar}',
                              height: 50,
                            )),
                        title: Text(
                          '${users.name}',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    post.noidung.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0)
                    ]),
                    child: CachedNetworkImage(
                      imageUrl: '${post.image}',
                    )),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Tieu de
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                FutureBuilder<Sites>(
                                  future: SitesProvider.fecthSitesById(
                                      post.idDiadanh),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Error'),
                                      );
                                    } else if (snapshot.hasData) {
                                      Sites sites = snapshot.data!;
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            sites.diachi.toString(),
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.near_me))
                                        ],
                                      );
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.thumb_up_outlined)),
                                    Text(post.luotLike.toString()),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.thumb_down_outlined)),
                                    Text(post.disLike.toString()),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.visibility)),
                                    Text(post.luotXem.toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Mô Tả

                    //dich vu
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<List<comment>>(
                      future: commentprovider.fecthSitescomment(id),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error'),
                          );
                        } else if (snapshot.hasData) {
                          List<comment> cm = snapshot.data!;
                          return Container(
                            height: 400,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Bình luận',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          MaterialButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(Icons.chat_bubble_outline),
                                                Text('Viết Bình luận')
                                              ],
                                            ),
                                          ),
                                          Row(children: [
                                            Icon(Icons.chat),
                                            Text(cm.length.toString())
                                          ])
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                    child: ListView.builder(
                                        itemCount: cm.length,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: FutureBuilder<Users>(
                  future: UserProvider.fecthusersById(post.iduser),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error'),
                      );
                    } else if (snapshot.hasData) {
                      Users users = snapshot.data!;
                      return ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10000.0),
                            child: CachedNetworkImage(
                              imageUrl: '${users.avatar}',
                              height: 30,
                            )),
                        title: Text(
                          '${users.name}',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                          subtitle: Text(cm[index].noidung.toString()),
                                                  
                                                
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                                                    
                                                  ),
                                                )),
                              ],
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}

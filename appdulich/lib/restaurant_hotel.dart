import 'package:appdulich/API/Dichvu_object.dart';
import 'package:appdulich/API/Dichvu_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class retaurantPage extends StatefulWidget {
  final int? id;
  const retaurantPage({Key? key, required this.id}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return retaurantState(id: id);
  }
}

class retaurantState extends State<retaurantPage> {
  final int? id;
  retaurantState({required this.id});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: FutureBuilder<Dichvu>(
        future: DichvuProvider.fecthDichvuById(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            Dichvu dv = snapshot.data!;
            return Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0)
                      ]),
                      child: ImageSlideshow(height: 270, children: [
                        ClipRRect(
                            child: CachedNetworkImage(
                          imageUrl: '${dv.imagedichvu}',
                          fit: BoxFit.cover,
                        )),
                      ]),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          //color: Colors.red,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Tieu de
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        dv.name.toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              dv.diachi.toString(),
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.near_me))
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon:
                                                Icon(Icons.thumb_up_outlined)),
                                        Text(dv.luotLike.toString()),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.thumb_down_outlined)),
                                        Text(dv.disLike.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Mô Tả
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                                height: 500,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(15),
                                color: Colors.white,
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mô Tả',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: Text(dv.mota.toString()),
                                      )
                                    ],
                                  ),
                                ))),
                        //dich vu
                      ],
                    )
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

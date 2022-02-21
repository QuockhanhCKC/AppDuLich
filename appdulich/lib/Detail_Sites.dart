import 'package:appdulich/API/Danhgia_object.dart';
import 'package:appdulich/API/Dichvu_object.dart';
import 'package:appdulich/API/Dichvu_provider.dart';
import 'package:appdulich/API/Sites_object.dart';
import 'package:appdulich/API/Sites_provider.dart';
import 'package:appdulich/API/User_object.dart';

import 'package:appdulich/API/danhgia_provider.dart';
import 'package:appdulich/API/user_provider.dart';
import 'package:appdulich/restaurant_hotel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class DeatialSitesPage extends StatefulWidget {
  final int? id;

  const DeatialSitesPage({Key? key, required this.id}) : super(key: key);

  @override
  _DeatialSitesPageState createState() => _DeatialSitesPageState(id: id);
}

class _DeatialSitesPageState extends State<DeatialSitesPage> {
  final int? id;
  _DeatialSitesPageState({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Expanded(
      child: FutureBuilder<Sites>(
        future: SitesProvider.fecthSitesById(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            Sites sites = snapshot.data!;
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
                            imageUrl: '${sites.imageDiadanh}',
                            fit: BoxFit.cover,
                          ),
                        ),
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
                                        sites.name.toString(),
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
                                              sites.diachi.toString(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.thumb_up,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text(sites.luotLike.toString()),
                                        TextButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.thumb_down,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text(sites.disLike.toString()),
                                      ],
                                    )
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
                                      Text(sites.mota.toString()),
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 200,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dịch Vụ Nghỉ Ngơi',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              FutureBuilder<List<Dichvu>>(
                                future: DichvuProvider.fecthDichvuLoai('1'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text('Error'),
                                    );
                                  } else if (snapshot.hasData) {
                                    List<Dichvu> dichvu = snapshot.data!;
                                    return Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: dichvu.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Container(
                                                    width: 200,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  retaurantPage(
                                                                id: dichvu[
                                                                        index]
                                                                    .id,
                                                              ),
                                                            ));
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              dichvu[index]
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  '${dichvu[index].imagedichvu.toString()}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              )),
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dịch vụ ăn uống',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              FutureBuilder<List<Dichvu>>(
                                future: DichvuProvider.fecthDichvuLoai('2'),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text('Error'),
                                    );
                                  } else if (snapshot.hasData) {
                                    List<Dichvu> dichvu = snapshot.data!;
                                    return Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: dichvu.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Container(
                                                    width: 200,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  retaurantPage(
                                                                id: dichvu[
                                                                        index]
                                                                    .id,
                                                              ),
                                                            ));
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              dichvu[index]
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  '${dichvu[index].imagedichvu.toString()}',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              )),
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        //dich vu
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 400,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Review, Đánh Giá',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              FutureBuilder<List<danhgia>>(
                                  future: Danhgiaprovider.fecthSitesDanhgia(id),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Error'),
                                      );
                                    } else if (snapshot.hasData) {
                                      return DanhGia(
                                        dg: snapshot.data!,
                                      );
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }),
                            ],
                          ),
                        ),
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
    )));
  }
}

class DanhGia extends StatelessWidget {
  final List<danhgia> dg;
  const DanhGia({Key? key, required this.dg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: ListView.builder(
            itemCount: dg.length,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: FutureBuilder<Users>(
                    future: UserProvider.fecthusersById(dg[index].iduser),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error'),
                        );
                      } else if (snapshot.hasData) {
                        Users u = snapshot.data!;
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(10000.0),
                                    child: CachedNetworkImage(
                                      imageUrl: '${u.avatar}',
                                      height: 30,
                                    )),
                                Padding(padding: EdgeInsets.only(left: 20)),
                                Expanded(
                                    child: Text(
                                  '${u.name}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ]),
                              Padding(
                                  padding: EdgeInsets.only(left: 30, right: 5),
                                  child: Text('${dg[index].noidung}'))
                            ]);
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                )));
  }
}

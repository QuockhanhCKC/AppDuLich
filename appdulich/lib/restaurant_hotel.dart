import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class retaurantPage extends StatefulWidget {
  const retaurantPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return retaurantState();
  }
}

class retaurantState extends State<retaurantPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
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
                      child: Image(
                    image: AssetImage('images/capdead.jpg'),
                    fit: BoxFit.cover,
                  )),
                  ClipRRect(
                      child: Image(
                    image: AssetImage('images/avatar.jpg'),
                    fit: BoxFit.cover,
                  )),
                ]),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
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
                                  'Nhà Hàng Hải Sản 1',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'dia chỉ',
                                      style: TextStyle(color: Colors.grey),
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
                                      icon: Icon(Icons.thumb_up_outlined)),
                                  Text('0'),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.thumb_down_outlined)),
                                  Text('0'),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border)),
                                  Text('0'),
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
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(15),
                          color: Colors.white,
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mô Tả',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds'),
                                Text('anashdahdadksdhasdjkadagjdajdsadsds')
                              ],
                            ),
                          ))),
                  //dich vu
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(15),
                          color: Colors.white,
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dịch Vụ',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(text: 'Phòng đơn - '),
                                      TextSpan(text: '1tr/đêm')
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(text: 'Phòng đơn - '),
                                      TextSpan(text: '1tr/đêm')
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(text: 'Phòng đơn - '),
                                      TextSpan(text: '1tr/đêm')
                                    ]))
                                  ],
                                ),
                              ],
                            ),
                          )))
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}

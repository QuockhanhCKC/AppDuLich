import 'package:appdulich/API/Dichvu_object.dart';
import 'package:appdulich/API/Dichvu_provider.dart';
import 'package:appdulich/API/Sites_object.dart';
import 'package:appdulich/API/Sites_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Detail_Sites.dart';

class LuuTru extends StatefulWidget {
  const LuuTru({Key? key}) : super(key: key);

  @override
  _LuuTruState createState() => _LuuTruState();
}

class _LuuTruState extends State<LuuTru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Luu Trú',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<Dichvu>>(
        future: DichvuProvider.fecthDichvuLoai('2'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            List<Dichvu> sites = snapshot.data!;
            return SingleChildScrollView(
                child: Column(children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: sites.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeatialSitesPage(
                                id: sites[index].id,
                              ),
                            ));
                      },
                      title: Align(
                        alignment: Alignment.center,
                        child: Text(
                          sites[index].name.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            child: CachedNetworkImage(
                              imageUrl: '${sites[index].imagedichvu}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.thumb_up,
                                    color: Colors.orange,
                                  ),
                                ),
                                Text(sites[index].luotLike.toString()),
                                TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.thumb_down,
                                    color: Colors.orange,
                                  ),
                                ),
                                Text(sites[index].disLike.toString()),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    children: [
                                      Icon(Icons.visibility,
                                          color: Colors.amber[800]),
                                      Text(
                                        '${sites[index].luotXem}',
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
                          )
                        ],
                      )),
                ),
              )
            ]));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

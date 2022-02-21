import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final items = ['Tất cả', 'Theo Khu vực', 'Tên địa điểm'];
  String value = 'Tất cả';
  DropdownMenuItem<String> buildmenuitem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        centerTitle: true,
        actions: <Widget>[
          DropdownButton<String>(
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? Value) {
              setState(() {
                value = Value!;
              });
            },
            value: this.value,
            items: items.map(buildmenuitem).toList(),
          )
        ],
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Tìm kiếm địa điểm, khu vực...',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(),
    );
  }
}

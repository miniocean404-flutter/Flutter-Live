import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
          decoration: BoxDecoration(
            color: Color(0xFFf5f6f7),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: TextField(
            cursorColor: Colors.black, //设置光标
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "请搜索",
              // hintStyle: new TextStyle(fontSize: 14, color: Colors.white),
              //输入框decoration属性
              //contentPadding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
              // contentPadding: new EdgeInsets.only(left: 0.0),
              // fillColor: Colors.white,
              // border: InputBorder.none,
            ),
            // style: new TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('搜索'),
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Text('搜索栏'),
        ),
      ),
    );
  }
}

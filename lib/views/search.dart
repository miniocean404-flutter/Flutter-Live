import 'package:flutter/material.dart';
import 'package:my_app/theme/color.dart';

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
        leading: null,
        title: SearchInput(),
      ),
      body: Center(
        child: Container(
          child: Text('搜索栏'),
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: TextField(
        cursorColor: AppColor.info, //设置光标
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          fillColor: Color(0x30cccccc),
          filled: true,

          hintText: "请搜索",
          // hintStyle: new TextStyle(fontSize: 14, color: Colors.white),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00FF0000)),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000)),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),

          //输入框光标内容位置
          contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
          border: InputBorder.none,
        ),
        onChanged: (value) {},
        // style: new TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}

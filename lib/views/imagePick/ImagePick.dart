import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatelessWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片选择'),
      ),
      body: Container(
        child: Photo(),
      ),
    );
  }
}

class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  List _imageList = []; //图片列表
  int _photoIndex = 0; //选择拍照还是相册的索引

  //action sheet
  List _actionSheet = [
    {"name": "拍照", "icon": Icon(Icons.camera_alt)},
    {"name": "相册", "icon": Icon(Icons.photo)}
  ];

  //点击了拍照还是相册按钮
  Future _getImage() async {
    Navigator.of(context).pop();
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: _photoIndex == 0 ? ImageSource.camera : ImageSource.gallery,
    );

    //没有选择图片或者没有拍照
    if (image != null) {
      setState(() {
        _imageList.add(image);
      });
    }
  }

  //获取sheet选择
  Future _getActionSheet() async {
    await showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _actionSheet.length,
              itemExtent: 50.0,
              itemBuilder: (innerCtx, i) {
                return ListTile(
                  title: Text(_actionSheet[i]["name"]),
                  leading: _actionSheet[i]["icon"],
                  onTap: () {
                    setState(() {
                      _photoIndex = i;
                    });
                    _getImage();
                  },
                );
              },
            ),
          );
        });
  }

  //图片列表的刻画
  List<Widget> _getImageList() {
    return _imageList.map((img) {
      print('111111111111111111111111');
      print(img.toString());
      print('111111111111111111111111');
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: <Widget>[
            Image.file(
              img.path,
              fit: BoxFit.cover,
              width: 100.0,
              height: 70.0,
            ),
            Positioned(
              right: 5.0,
              top: 5.0,
              child: GestureDetector(
                child: ClipOval(
                  child: Container(
                    width: 15.0,
                    height: 15.0,
                    color: Colors.lightBlue,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _imageList.remove(img);
                  });
                },
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          child: Text("拍照"),
          onPressed: () => _getActionSheet(),
        ),
        Text("照片列表"),
        _imageList.isNotEmpty
            ? Wrap(
                spacing: 10.0,
                children: _getImageList(),
              )
            : Text("暂无内容")
      ],
    );
  }
}

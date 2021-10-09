import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

// 临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 系统可随时清除的临时目录（缓存）。在 iOS 上，这对应于NSTemporaryDirectory() (opens new window)返回的值。在 Android上，这是getCacheDir() (opens new window)返回的值。
// 文档目录: 可以使用 getApplicationDocumentsDirectory()来获取应用程序的文档目录，该目录用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录。在 iOS 上，这对应于NSDocumentDirectory。在 Android 上，这是AppData目录。
// 外部存储目录：可以使用 getExternalStorageDirectory()来获取外部存储目录，如 SD 卡；由于 iOS不支持外部目录，所以在 iOS 下调用该方法会抛出UnsupportedError异常，而在 Android 下结果是Android SDK 中getExternalStorageDirectory的返回值。

class FileOperate extends StatefulWidget {
  FileOperate({Key? key}) : super(key: key);

  @override
  _FileOperateState createState() => _FileOperateState();
}

class _FileOperateState extends State<FileOperate> {
  int _counter = 0;

  @override
  void initState() {
    //从文件读取点击次数
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
    super.initState();
  }

  // 文件读取
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  // 文件写入
  _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  // 获取目录
  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path; // 获取应用目录
    String dir2 = (await getExternalStorageDirectory())!.path; // SD卡目录
    String dir3 = (await getTemporaryDirectory()).path; // 临时目录

    // 读取所有文件
    Stream<FileSystemEntity> dirList =
        (await getApplicationDocumentsDirectory())
            .list(recursive: true, followLinks: false);

    await for (FileSystemEntity entity in dirList) {
      //文件、目录和链接都继承自FileSystemEntity
      //FileSystemEntity.type静态函数返回值为FileSystemEntityType
      //FileSystemEntityType有三个常量：
      //Directory、FILE、LINK、NOT_FOUND
      //FileSystemEntity.isFile .isLink .isDerectory可用于判断类型

      FileSystemEntity.isDirectory(entity.path).then((isDir) {
        if (isDir) {
          print('目录：${entity.path}');
        } else {
          print('文件:${entity.path}');
        }
      });
    }

    // Fluttertoast.showToast(
    //   msg: "$dir2",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.red,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );

    Fluttertoast.showToast(
      msg: "$dir",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    return File('$dir/counter.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文件操作及toast')),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}

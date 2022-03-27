import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:my_app/utils/util.dart';

// 图片保存插件
saveAssetsGallery({String assets = '', String target = ''}) async {
  ByteData bytes = await rootBundle.load(assets);

  await ImageGallerySaver.saveImage(bytes.buffer.asUint8List());
  toast('保存成功');
}

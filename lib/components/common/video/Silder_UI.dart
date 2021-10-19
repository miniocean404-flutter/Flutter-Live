import 'package:flutter/material.dart';

class SilderUI extends StatelessWidget {
  final double schedule;
  final double thumbRadius;
  final double overlayRadius;
  final ValueChanged<double> onChanged;
  final ValueChanged<double> onChangeStart;
  final ValueChanged<double> onChangeEnd;

  const SilderUI({
    Key? key,
    required this.schedule,
    required this.thumbRadius,
    required this.overlayRadius,
    required this.onChanged,
    required this.onChangeStart,
    required this.onChangeEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: null, //轨道的形状
        trackHeight: 3, //trackHeight：滑轨的高度

        activeTrackColor: Colors.white, //已滑过轨道的颜色
        // inactiveTrackColor: Colors.greenAccent, //未滑过轨道的颜色

        thumbColor: Colors.blue, //滑块中心的颜色（小圆头的颜色）
        overlayColor: Color.fromRGBO(192, 192, 192, .5), //滑块边缘的颜色

        // 滑块
        thumbShape: RoundSliderThumbShape(
          //可继承SliderComponentShape自定义形状
          disabledThumbRadius: 15, //禁用时滑块大小
          enabledThumbRadius: thumbRadius, //滑块大小
        ),

        // 滑块外阴影
        overlayShape: RoundSliderOverlayShape(
          //可继承SliderComponentShape自定义形状
          overlayRadius: overlayRadius, //滑块外圈大小
        ),
      ),
      child: Slider(
        value: schedule,
        min: 0,
        max: 100,
        //滑动过程中执行的方法
        onChanged: onChanged,
        //开始滑动时执行的方法,即按下时执行
        onChangeStart: onChangeStart,
        //滑动结束后执行的方法,松开后执行
        onChangeEnd: onChangeEnd,
      ), //Slider组件
    );
  }
}

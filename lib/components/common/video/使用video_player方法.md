```
_controller.seekTo(position); //设置视频播放位置跳转至指定时间（duration类型）
_controller.pause();//暂停
_controller.play(); //播放
_controller.setVolume(volume);  //设置视频的音量（double类型）
_controller.setLooping(looping);//设置是否循环播放（bool类型）
_controller.addListener(() { });//监听，可以应用于进度条的监听刷新等等场景
_controller.dispose(); //关闭Gui页面，一般有固定写法


 VideoPlayerValue(
     duration: 0:03:42.468000, //视频总长度
     size: Size(960.0, 540.0), //视频尺寸,(即宽和高)
     position: 0:00:59.003000,  //当前已播放位置
     caption: Instance of 'Caption',
     buffered: [DurationRange(start: 0:00:00.000000, end: 0:01:45.674000)], //已缓冲的范围
     isPlaying: true, //是否正在播放
     isLooping: false, //是否为循环播放
     isBuffering: falsevolume: 1.0,
     errorDescription: null  //错误描述.如果不存在则返回为null
)
```

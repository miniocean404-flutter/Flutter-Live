import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

String parseHtml = Uri.dataFromString(
  htmlStr,
  mimeType: 'text/html',
  encoding: Encoding.getByName('utf-8'),
).toString();
String htmlStr = """
        <p>
            <span>ListView中的webview_flutter要放在SizedBox中，指定并指定sizedbox的高度，否则会出错。</span>
            <span style="color:#e74c3c">实际高度可以调用js来获得返回的高度</span>
        </p>
        <p><img alt="" src="http://img.doutula.com/production/uploads/image/2021/11/13/20211113782403_YhURGf.jpg"/></p>
      """;

class BuiltInBrowser extends StatefulWidget {
  const BuiltInBrowser({Key? key}) : super(key: key);

  @override
  _BuiltInBrowserState createState() => _BuiltInBrowserState();
}

class _BuiltInBrowserState extends State<BuiltInBrowser> {
  late WebViewController _controller;
  late double progress = 0;
  late double height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('内置浏览器'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.baidu.com/',
            javascriptMode: JavascriptMode.unrestricted, // JS执行模式 是否允许JS执行
            onProgress: (pro) {
              progress = (pro / 100).toDouble();
            },
            onWebViewCreated: (controller) {
              _controller = controller;
              controller.loadUrl(parseHtml);
            },
            // 在页面加载完成时候
            onPageFinished: (url) {
              //调用JS得到实际高度
              _controller
                  .evaluateJavascript("document.documentElement.clientHeight;")
                  .then((result) {
                setState(
                  () {
                    height = double.parse(result);
                  },
                );
              });
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith("myapp://")) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            javascriptChannels: <JavascriptChannel>[
              JavascriptChannel(
                name: "share",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数： ${message.message}");
                },
              ),
            ].toSet(),
          ),
          Positioned(
            top: 0,
            left: 0,
            height: 2,
            width: 1.sw,
            child: Visibility(
              visible: progress < 1,
              child: LinearProgressIndicator(
                minHeight: 2,
                backgroundColor: Color(0xFFF9F9F9),
                color: Color(0xFF24CF5F),
                value: progress,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

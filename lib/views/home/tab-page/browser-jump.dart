import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BrowserJump extends StatelessWidget {
  const BrowserJump({Key? key}) : super(key: key);
  final _url = 'https://www.baidu.com';
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: _launchURL,
        child: Text(
          '网页链接跳转',
        ),
      ),
    );
  }
}

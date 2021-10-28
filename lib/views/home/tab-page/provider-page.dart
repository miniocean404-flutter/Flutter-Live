import 'package:flutter/material.dart';
import 'package:my_app/provider/theme.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('${Provider.of<ThemeInfo>(context).getColor}'),
          MaterialButton(
            onPressed: () {
              Provider.of<ThemeInfo>(context, listen: false).setColor = '黑色';
            },
            child: Text('改变颜色'),
          )
        ],
      ),
    );
  }
}

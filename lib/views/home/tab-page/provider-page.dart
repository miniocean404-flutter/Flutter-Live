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
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        Color currentColor = Colors.primaries[i % Colors.primaries.length];

        return GestureDetector(
          onTap: () {
            Provider.of<ThemeInfo>(context, listen: false).setColor =
                Colors.primaries[i % Colors.primaries.length];
          },
          child: Container(
            height: 60,
            color: currentColor,
          ),
        );
      },
      itemExtent: 50,
      itemCount: 6,
    );
  }
}

import 'package:flutter/material.dart';

class SiparislerScreen extends StatefulWidget {
  const SiparislerScreen({Key key}) : super(key: key);

  @override
  _SiparislerScreenState createState() => _SiparislerScreenState();
}

class _SiparislerScreenState extends State<SiparislerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BackButton(
            color: Colors.black,
            onPressed: () {
              debugPrint("Value");
            },
          ),
        ],
      ),
    );
  }
}

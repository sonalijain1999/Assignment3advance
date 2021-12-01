import 'package:flutter/material.dart';

import 'MyMaps.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MyMaps();
  }
}

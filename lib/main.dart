import 'package:flutter/material.dart';

void main() {
  runApp(MeStoreApp());
}

class MeStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Center(child: Text('meStore')),
    );
  }
}

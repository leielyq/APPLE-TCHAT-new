import 'package:flutter/material.dart';
import 'package:flutter_module_tchat/ui/login_page.dart';
import './ui/share_life/ShareLifePage.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'TheGorgeousLogin',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShareLifePage(),
    );
  }
}
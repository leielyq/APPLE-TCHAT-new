import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_more/http/HttpUtil.dart';
import 'package:flutter_more/ui/index/MainPage.dart';
import 'package:flutter_more/ui/login_page_tchat.dart';
import './ui/share_life/ShareLifePage.dart';
import 'dart:ui';

void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  final String method;
//
//  const MyApp({Key key, this.method}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return  MaterialApp(
//      title: 'TheGorgeousLogin',
//      theme:  ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: rootPage(method),
//    );
//  }
//
//  Widget rootPage(String method){
//    if(method=='login'){
//      return LoginPage();
//    }else {
//      return LoginPage();
//    }
//  }
//}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    ///register page widget builders,the key is pageName
    FlutterBoost.singleton.registerPageBuilders({
      'login': (pageName, params, _) {

        return LoginPage();
      },
      'share': (pageName, params, _) {
        HttpUtil.set(params['device'], params['token']);
       return ShareLifePage();
      },
    });

    FlutterBoost.singleton.registerDefaultPageBuilder((pageName, params, _) {
      return LoginPage();
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Boost example',
      builder: FlutterBoost.init(), ///init container manager
      home: Container());
}

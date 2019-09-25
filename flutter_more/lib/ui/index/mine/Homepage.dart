import 'package:flutter/material.dart';
import 'package:flutter_more/ui/index/mine/SetPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: SingleChildScrollView(
              child: new ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 120.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0)),
                  width: deviceSize.width * 9.5 / 10,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '我的订单',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    '查看全部订单',
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 16),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.chevron_right),
                                )
                              ],
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 4.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            color: Colors.black12,
                            width: deviceSize.width * 0.9 / 1,
                            height: 1.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.featured_play_list),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待付款'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.business_center),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待发货'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.airport_shuttle),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待收货'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.keyboard_hide),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('评价'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.monetization_on),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('退款售后'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0)),
                  width: deviceSize.width * 9.5 / 10,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '必备工具',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    '查看全部工具',
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 16),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.chevron_right),
                                )
                              ],
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 4.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            color: Colors.black12,
                            width: deviceSize.width * 0.9 / 1,
                            height: 1.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff3333),
                                          Color(0xFFff3333)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.featured_play_list),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('每日返现'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFfed46f),
                                          Color(0xFFffba00)
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      '券',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('领券中心'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFfb6f63),
                                          Color(0xFFff1400)
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.attach_money,
                                      color: Colors.yellow,
                                    ),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('闲置换钱'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFfff000),
                                          Color(0xFFfff000)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.phone_paused),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('客服小蜜'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.featured_play_list),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待付款'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.business_center),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待发货'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.airport_shuttle),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待收货'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.keyboard_hide),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('评价'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0)),
                  width: deviceSize.width * 9.5 / 10,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '必备工具',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    '查看全部工具',
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 16),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.chevron_right),
                                )
                              ],
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 4.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            color: Colors.black12,
                            width: deviceSize.width * 0.9 / 1,
                            height: 1.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff3333),
                                          Color(0xFFff3333)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.featured_play_list),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('每日返现'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFfed46f),
                                          Color(0xFFffba00)
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      '券',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('领券中心'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFfb6f63),
                                          Color(0xFFff1400)
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.attach_money,
                                      color: Colors.yellow,
                                    ),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('闲置换钱'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFfff000),
                                          Color(0xFFfff000)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.phone_paused),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('客服小蜜'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.featured_play_list),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待付款'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.business_center),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待发货'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.airport_shuttle),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('待收货'),
                                ),
                              ],
                            ),
                            new Column(
                              children: <Widget>[
                                new RaisedButton(
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff7808),
                                          Color(0xFFff5500)
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.keyboard_hide),
                                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                    alignment: Alignment.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0)),
                                  //圆角大小,与BoxDecoration保持一致，更美观
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                                new Container(
                                  child: new Text('评价'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        backgroundColor: Color(0xFFff7808),

        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 32,
              ),
              tooltip: 'Add Alarm',
              onPressed: () {}),
          new IconButton(
              icon: new Icon(
                Icons.settings,
                color: Colors.white,
                size: 28,
              ),
              tooltip: 'Add Alarm',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePageset()));
              }),
        ],
        //标题居中
        centerTitle: true,
        //展开高度200
        expandedHeight: 200.0,
        //不随着滑动隐藏标题
        floating: false,
        //固定在顶部
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Container(
              child: Stack(
                children: <Widget>[
                  //                Image.network(
                  //                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
                  //                  fit: BoxFit.cover,
                  //                ),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Column(
                      children: <Widget>[
                        new Container(
                          width: 60.0,
                          height: 60.0,
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            image: new DecorationImage(
                                image: new NetworkImage(
                                    'http://b-ssl.duitang.com/uploads/item/201710/02/20171002230327_jceVt.jpeg'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                      padding: new EdgeInsets.fromLTRB(100, 100, 0, 0),
                      child: new Text(
                        '克莱伦斯',
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      )),
                  Padding(
                    padding: new EdgeInsets.fromLTRB(0, 160, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton(
                          child: Column(
                            children: <Widget>[
                              Text(
                                '1',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '收藏夹',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Column(
                            children: <Widget>[
                              Text(
                                '3',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '关注店铺',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Column(
                            children: <Widget>[
                              Text(
                                '5',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '足迹',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Column(
                            children: <Widget>[
                              Text(
                                '0',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '红包卡券',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFff7808), Color(0xFFff5500)],
                ),
              )),
        ),
      ),
//      SliverPersistentHeader(
//          delegate: _SliverAppBarDelegate(
//              TabBar(
//                  labelColor: Colors.red,
//                  unselectedLabelColor: Colors.grey,
//                  tabs: [
//                    Tab(icon: Icon(Icons.cake), text: '左侧'),
//                    Tab(icon: Icon(Icons.golf_course), text: '右侧'),
//                  ],
//                  controller: TabController(length: 2, vsync: this),
//          )
//          )
//      )
    ];
  }
}

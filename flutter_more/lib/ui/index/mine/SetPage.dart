import 'package:flutter/material.dart';
import 'package:flutter_more/ui/index/mine/Homepage.dart';
import 'package:flutter_more/ui/index/shopping/NewAddress.dart';
import 'package:flutter_more/ui/index/shopping/GoodsPage.dart';
import 'package:flutter_more/ui/index/shopping/EditAddress.dart';
import 'package:flutter_more/ui/index/MainPage.dart';
class MyHomePageset extends StatefulWidget {
  MyHomePageset({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageStateSet createState() => _MyHomePageStateSet();
}

class _MyHomePageStateSet extends State<MyHomePageset> {

  @override
  Widget build(BuildContext context) {final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black38,),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
        title: Text('                     设置',style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
      ),
      body:
      SingleChildScrollView(
          child: new ConstrainedBox(
              constraints: new BoxConstraints(
                  minHeight: 120.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 60.0,
                                height: 60.0,
                                margin: const EdgeInsets.all(20.0),
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  image: new DecorationImage(
                                      image: new NetworkImage(
                                          'http://b-ssl.duitang.com/uploads/item/201710/02/20171002230327_jceVt.jpeg'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text('克莱伦斯',style: TextStyle(fontSize: 18),),

                                  ),
                                  Container(
                                    child: Text('会员名t_1505383711918_0733',style: TextStyle(fontSize: 14,color: Colors.black26),),

                                  )
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: OutlineButton(
                                    borderSide:new BorderSide(color: Colors.deepOrangeAccent),
                                    child: new Text('编辑',style: new TextStyle(color: Colors.deepOrangeAccent,fontSize: 16),),
                                    onPressed: (){},
                                  )


                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 12.0, top: 0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                color: Colors.black12,
                                width: deviceSize.width*99/100,
                                height: 1.0,
                              ),
                            ),
                          ),
                        Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(

                                  child: Text('我的收货地址',style: TextStyle(fontSize: 16),),
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                ),
                                Container(
                                  child: IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
                                )
                              ],
                            
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(

                          child: Text('账户与安全',style: TextStyle(fontSize: 16),),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        ),
                        Container(
                          child: IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
                        )
                      ],

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(

                                child: Text('地区设置',style: TextStyle(fontSize: 16),),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              ),
                              Container(
                                child: IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
                              )
                            ],

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, top: 0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              color: Colors.black12,
                              width: deviceSize.width*99/100,
                              height: 1.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(

                                child: Text('音效与通知',style: TextStyle(fontSize: 16),),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              ),
                              Container(
                                child: IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
                              )
                            ],

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, top: 0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              color: Colors.black12,
                              width: deviceSize.width*99/100,
                              height: 1.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(

                                child: Text('隐私',style: TextStyle(fontSize: 16),),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              ),
                              Container(
                                child: IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
                              )
                            ],

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, top: 0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              color: Colors.black12,
                              width: deviceSize.width*99/100,
                              height: 1.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(

                                child: Text('通用',style: TextStyle(fontSize: 16),),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              ),
                              Container(
                                child: IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
                              )
                            ],

                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('问题反馈',style: TextStyle(fontSize: 16),),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              ),
                              Container(
                                child: IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
                              )
                            ],

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, top: 0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              color: Colors.black12,
                              width: deviceSize.width*99/100,
                              height: 1.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(

                                child: Text('关于手机淘宝',style: TextStyle(fontSize: 16),),
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              ),
                              Container(
                                child: IconButton(icon: Icon(Icons.chevron_right), onPressed: null),
                              )
                            ],

                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: deviceSize.width*1/1,
                    child: FlatButton(
                      child: Text('切换账户',style: TextStyle(fontSize: 16,color: Colors.black),),
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: deviceSize.width*1/1,
                    child: FlatButton(
                      child: Text('退出登录',style: TextStyle(fontSize: 16,color: Colors.black),),
                    ),
                    color: Colors.white,
                  ),
                ],
              )
          )
      ),
    );
  }
}


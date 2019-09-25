import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_more/view/MySliverAppBar.dart';
import 'package:flutter_more/ui/index/shopping/ShoppingItem.dart';
import 'package:banner_view/banner_view.dart';
class MyHomePages extends StatefulWidget {
  MyHomePages({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageStates createState() => _MyHomePageStates();
}
class _MyHomePageStates extends State<MyHomePages> {
  bool _isFavorited = true;
  void _log(){
    print('1');
}
  void _toggleFavorite() {  //分析2
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          MySliverAppBar(
            title: Text("商家"),
            expandedHeight: deviceSize.width*1/2.9,
            background: Container(
              child: AspectRatio(
                  aspectRatio:2/1,
                child:Image.asset('assets/img/1.png'),
              ),
              color: Colors.white,
            ),
          ),
          SliverSafeArea(
            sliver:SliverList(delegate:  SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[

                    Container(
                      padding: new EdgeInsets.fromLTRB(20, 10, 0, 0),
                      height: 40,
                      child: Text('序言大型特卖会场',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87,//字体颜色
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.fromLTRB(20, 0, 10, 0),
                      height: 80,
                      child: Text('要的是清汤菜籽油锅底，因为朋友怕辣，锅底味道鲜香，麻辣适度。但配菜分量真心少，两个女孩，点了土豆，生菜，娃娃菜，宽粉，鸭血，美国肥牛',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,//字体颜色
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.fromLTRB(20, 8, 0, 0),
                      color: Color(0x99e2e2e6),
                      height: 40,
                      width: double.infinity,
                      child: Text('优惠单',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(

                          padding: new EdgeInsets.fromLTRB(3, 30, 0, 0),
                          height: 80,
                          child:GestureDetector(
                            child:IconButton(
                                icon:(_isFavorited
                                    ? new Icon(Icons.radio_button_unchecked)
                                    : new Icon(Icons.radio_button_unchecked,color: Colors.orange,)),
                                onPressed:_toggleFavorite
                            ),

                          ),


                        ),
                        Container(
                          height: 120,
                          padding: new EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Image.asset('assets/img/2.png'),
                        ),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children:<Widget>[
                            Container(
                              padding: new EdgeInsets.fromLTRB(20, 15, 0, 0),
                              height: 40,
                              child: Text('小龙虾小龙虾',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black87,//字体颜色
                                ),
                              ),
                            ),
                            Container(
                              padding: new EdgeInsets.fromLTRB(20, 0, 10, 0),
                              height: 80,
                              width: 200,
                              child: Text('海龙盛宴经营范围分别为种龙虾经营范围等等......',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black54,//字体颜色
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: new EdgeInsets.fromLTRB(50, 5, 10, 0),
                      height: 40,
                      child: Text('活动时间：每周一、二、三、四可以使用，18:00-21:30',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,//字体颜色
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.fromLTRB(50, 0, 10, 0),
                      height:30,
                      child: Text('有效时间：2016年8月5日至2017年8月20日',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,//字体颜色
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(

                          padding: new EdgeInsets.fromLTRB(3, 30, 0, 0),
                          height: 80,
                          child:GestureDetector(
                            child:IconButton(
                                icon:(_isFavorited
                                    ? new Icon(Icons.radio_button_unchecked)
                                    : new Icon(Icons.radio_button_unchecked,color: Colors.orange,)),
                                onPressed:_toggleFavorite
                            ),

                          ),


                        ),
                        Container(
                          height: 120,
                          padding: new EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Image.asset('assets/img/2.png'),
                        ),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children:<Widget>[
                            Container(
                              padding: new EdgeInsets.fromLTRB(20, 15, 0, 0),
                              height: 40,
                              child: Text('小龙虾小龙虾',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black87,//字体颜色
                                ),
                              ),
                            ),
                            Container(
                              padding: new EdgeInsets.fromLTRB(20, 0, 10, 0),
                              height: 80,
                              width: 200,
                              child: Text('海龙盛宴经营范围分别为种龙虾经营范围等等......',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black54,//字体颜色
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: new EdgeInsets.fromLTRB(50, 5, 10, 0),
                      height: 40,
                      child: Text('活动时间：每周一、二、三、四可以使用，18:00-21:30',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,//字体颜色
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.fromLTRB(50, 0, 10, 0),
                      height:30,
                      child: Text('有效时间：2016年8月5日至2017年8月20日',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,//字体颜色
                        ),
                      ),
                    ),
//          MaterialButton(
//            padding: new EdgeInsets.fromLTRB(1, 1, 1, 1),
//            minWidth: double.infinity,
//            height:50,
//            disabledColor:Colors.black38,
//              disabledTextColor:Colors.white,
//            color: (Colors.orange),
//            textColor: Colors.white,
//            child: new Text('加入购物车'),
//            onPressed: (_isFavorited
//                ? null
//                : _log
//            ),
//          )
                  ],
                );
              },
              childCount: 1,
            ),),
          ),
        ],
      ),
    );
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Color(0xFF6996b6),
//        leading: Icon(Icons.arrow_back_ios
//        ),
//        title: Text('            最新活动公告',
//          textAlign: TextAlign.center,
//        ),
//      ),
//      body: Column(
//        crossAxisAlignment:CrossAxisAlignment.start,
//        children: <Widget>[
//          Image.asset('assets/img/1.png'),
//          Container(
//            padding: new EdgeInsets.fromLTRB(20, 10, 0, 0),
//            height: 40,
//            child: Text('序言大型特卖会场',
//              style: TextStyle(
//                fontSize: 18.0,
//                color: Colors.black87,//字体颜色
//              ),
//            ),
//          ),
//          Container(
//            padding: new EdgeInsets.fromLTRB(20, 0, 10, 0),
//            height: 80,
//            child: Text('要的是清汤菜籽油锅底，因为朋友怕辣，锅底味道鲜香，麻辣适度。但配菜分量真心少，两个女孩，点了土豆，生菜，娃娃菜，宽粉，鸭血，美国肥牛',
//              style: TextStyle(
//                fontSize: 16.0,
//                color: Colors.black54,//字体颜色
//              ),
//            ),
//          ),
//          Container(
//            padding: new EdgeInsets.fromLTRB(20, 8, 0, 0),
//            color: Color(0x99e2e2e6),
//            height: 40,
//            width: double.infinity,
//            child: Text('优惠单',
//              style: TextStyle(
//                fontSize: 16.0,
//                color: Colors.black87,
//              ),
//            ),
//          ),
//          Row(
//            children: <Widget>[
//              Container(
//
//                padding: new EdgeInsets.fromLTRB(3, 30, 0, 0),
//                height: 80,
//                child:GestureDetector(
//                  child:IconButton(
//                      icon:(_isFavorited
//                          ? new Icon(Icons.radio_button_unchecked)
//                          : new Icon(Icons.radio_button_unchecked,color: Colors.orange,)),
//                      onPressed:_toggleFavorite
//                  ),
//
//                ),
//
//
//               ),
//              Container(
//                height: 120,
//                padding: new EdgeInsets.fromLTRB(0, 20, 0, 0),
//                child: Image.asset('assets/img/2.png'),
//              ),
//              Column(
//                crossAxisAlignment:CrossAxisAlignment.start,
//                children:<Widget>[
//                  Container(
//                    padding: new EdgeInsets.fromLTRB(20, 15, 0, 0),
//                    height: 40,
//                    child: Text('小龙虾小龙虾',
//                      style: TextStyle(
//                        fontSize: 18.0,
//                        color: Colors.black87,//字体颜色
//                      ),
//                    ),
//                  ),
//                  Container(
//                    padding: new EdgeInsets.fromLTRB(20, 0, 10, 0),
//                    height: 80,
//                    width: 200,
//                    child: Text('海龙盛宴经营范围分别为种龙虾经营范围等等......',
//                      style: TextStyle(
//                        fontSize: 16.0,
//                        color: Colors.black54,//字体颜色
//                      ),
//                    ),
//                  ),
//               ],
//              ),
//            ],
//          ),
//          Container(
//            padding: new EdgeInsets.fromLTRB(50, 5, 10, 0),
//            height: 40,
//            child: Text('活动时间：每周一、二、三、四可以使用，18:00-21:30',
//              style: TextStyle(
//                fontSize: 14.0,
//                color: Colors.black54,//字体颜色
//              ),
//            ),
//          ),
//          Container(
//            padding: new EdgeInsets.fromLTRB(50, 0, 10, 0),
//            height:30,
//            child: Text('有效时间：2016年8月5日至2017年8月20日',
//              style: TextStyle(
//                fontSize: 14.0,
//                color: Colors.black54,//字体颜色
//              ),
//            ),
//          ),
////          MaterialButton(
////            padding: new EdgeInsets.fromLTRB(1, 1, 1, 1),
////            minWidth: double.infinity,
////            height:50,
////            disabledColor:Colors.black38,
////              disabledTextColor:Colors.white,
////            color: (Colors.orange),
////            textColor: Colors.white,
////            child: new Text('加入购物车'),
////            onPressed: (_isFavorited
////                ? null
////                : _log
////            ),
////          )
//        ],
//      ),
//    );
  }
}
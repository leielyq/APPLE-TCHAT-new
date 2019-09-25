import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'package:flutter_more/ui/index/shopping/xuanze.dart';
import 'package:flutter_more/ui/index/shopping/GoodsPage.dart';
import 'package:flutter_more/ui/index/shopping/ShoppingPage.dart';

class MyHomePageorder extends StatefulWidget {
  MyHomePageorder({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageStateOrder createState() => _MyHomePageStateOrder();
}
class _MyHomePageStateOrder extends State<MyHomePageorder> {
  int num = 0;
  int max = 99;
  // num set state
  numSetState([bool flag = true]) {
    return () => setState(() {
      if(!flag&&num > 0){
        num--;
      }
      if(flag&&num<max){
        num++;
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            leading: new IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black38,),
              onPressed: () {Navigator.pop(context);},
            ),
            flexibleSpace: new FlexibleSpaceBar(
              background: Image.network("https://gd2.alicdn.com/imgextra/i1/59911405/O1CN01IUxm7b1MFX0qwDvtI_!!59911405.jpg", fit: BoxFit.fill),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.cloud_queue,color: Colors.black38),
                  tooltip: 'Add Alarm',
                  onPressed: () {}
              ),
              new IconButton(
                  icon: new Icon(Icons.more_horiz,color: Colors.black38,),
                  tooltip: 'Add Alarm',
                  onPressed: () {}
              ),
            ],
            expandedHeight:deviceSize.height*50/100,
            floating: false,
            pinned: true,
            snap: false,
          ),
          SliverSafeArea(
            sliver:SliverList(delegate:  SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                height: 20,
                                alignment: Alignment.center,
                                child: Text('自营',style: TextStyle(color: Colors.pinkAccent,fontSize: 15),),
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),

                                  //设置四周边框
                                  border: new Border.all(width: 1, color: Colors.pinkAccent),
                                ),
                              ),
                              Container(

                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(5,5,0,0),
                                          child: Center(child: Text('直身前短后长侧开叉百搭T恤',style: TextStyle(fontSize: 16),)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Container(margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('限时! 此款特供5折, 在购物车勾选活动可见优惠',style: TextStyle(color: Colors.pinkAccent,fontSize: 12),),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text('￥199.00',style: TextStyle(color: Colors.pinkAccent,fontSize: 17),),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text('￥299.00',
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,//中划线
                                    decorationColor:Colors.black38,//划线颜色
                                  ),
                                ),
                              ),
                              Container(
                                child: Icon(Icons.help_outline,size: 15,color: Colors.black38,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Center(
                                child: Container(margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text('已售36598笔',style: TextStyle(color: Colors.black38,fontSize: 15),),
                                ),
                              ),
                              Container(margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Text('上海',style: TextStyle(color: Colors.black38,fontSize: 15),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child: Icon(Icons.check_circle_outline,color: Colors.pinkAccent,size: 14,),
                              ),
                              Container(
                                child: Text('正品保证',style: TextStyle(fontSize: 14,color: Colors.black38),),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Icon(Icons.check_circle_outline,color: Colors.pinkAccent,size: 14,),
                              ),
                              Container(
                                child: Text('极速退货',style: TextStyle(fontSize: 14,color: Colors.black38),),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Icon(Icons.check_circle_outline,color: Colors.pinkAccent,size: 14,),
                              ),
                              Container(
                                child: Text('14天无理由退货',style: TextStyle(fontSize: 14,color: Colors.black38),),
                              ),
                            ],
                          ),
                          Container(margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(Icons.more_horiz,color: Colors.black38,),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin:EdgeInsets.fromLTRB(10, 0, 5, 0),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                      //设置四周边框
                                      border: new Border.all(width: 1, color: Colors.pinkAccent), color: Colors.pinkAccent,
                                    ),
                                    child: Text('直降',style: TextStyle(color: Colors.white,fontSize: 10),),
                                  ),
                                  Container(
                                    child: Text('满99直降9元'),
                                  ),
                                ],
                              ),
                              Container(margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Icon(Icons.more_horiz,color: Colors.black38,),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0, top: 4.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                color: Colors.black12,
                                width: deviceSize.width*99/100,
                                height: 1.0,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(margin:EdgeInsets.fromLTRB(10, 0, 5, 0),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                      //设置四周边框
                                      border: new Border.all(width: 1, color: Colors.pinkAccent), color: Colors.pinkAccent,
                                    ),
                                    child: Text('满减',style: TextStyle(color: Colors.white,fontSize: 10),),
                                  ),
                                  Container(

                                    child: Text('满999减99元'),
                                  ),
                                ],
                              ),

                              Container(margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Icon(Icons.more_horiz,color: Colors.black38,),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: Colors.white,
                      height: 250,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin:EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('颜色',style: TextStyle(fontSize: 16),),
                          ),
                          RadioDemo(),
                          Container(
                            margin:EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('尺寸',style: TextStyle(fontSize: 16),),
                          ),
                          RadioDemoS(),
                          Container(
                            margin:EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('数量',style: TextStyle(fontSize: 16),),
                          ),
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  FlatButton(
                                    padding:EdgeInsets.fromLTRB(11, 6, 11, 6),
                                    child: Text('-',style: TextStyle(fontSize: 20),),
                                    onPressed: numSetState(false),
                                    color: Color.fromARGB(255,240,240,240),

                                  ),
                                  Container(
                                    color:Color.fromARGB(255,240,240,240),

                                    child: Text(num.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
                                  ),
                                  FlatButton(
                                    padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Text('+'),
                                    onPressed: numSetState(true),
                                    color: Color.fromARGB(255,240,240,240),
                                  ),
                                ],

                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: deviceSize.width*1/1,

                      color:Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(

                            child: Row(

                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(child: Text('商品评价',style: TextStyle(fontSize: 18),),margin: EdgeInsets.fromLTRB(0, 0, 5, 0),),
                                    Container(child: Text('(99999)',style: TextStyle(fontSize: 16),),),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(child: Text('好评度98%',style: TextStyle(fontSize: 16,color:Colors.black26),),),
                                    Container(child: Icon(Icons.chevron_right,color:Colors.black26,),),
                                  ],
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),

                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0.0, top: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                color: Colors.black26,
                                width: deviceSize.width*100/100,
                                height: 1.0,
                              ),
                            ),
                          ),
                          Container(
                            margin:EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(

                                      child: Row(
                                        children: <Widget>[
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                        ],
                                      ),
                                    ),
                                    Container(child: Text('欧阳**89',style: TextStyle(color: Colors.black26),),)
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                ),
                                Container(
                                  margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Text('衣服和图片很一致，质量还不错，对得起这个价格，很喜欢。',style: TextStyle(fontSize: 16),),),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text('尺码：',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      margin:EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Text('均码',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      child: Text('颜色：',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      child: Text('黑色',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text('2017-03-06',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      margin:EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Text('15:27:58',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0.0, top: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                color: Colors.black26,
                                width: deviceSize.width*100/100,
                                height: 1.0,
                              ),
                            ),
                          ),
                          Container(
                            margin:EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(

                                      child: Row(
                                        children: <Widget>[
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                        ],
                                      ),
                                    ),
                                    Container(child: Text('欧阳**89',style: TextStyle(color: Colors.black26),),)
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                ),
                                Container(
                                  margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Text('衣服和图片很一致，质量还不错，对得起这个价格，很喜欢。',style: TextStyle(fontSize: 16),),),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text('尺码：',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      margin:EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Text('均码',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      child: Text('颜色：',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      child: Text('黑色',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text('2017-03-06',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      margin:EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Text('15:27:58',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 0.0, top: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                color: Colors.black26,
                                width: deviceSize.width*100/100,
                                height: 1.0,
                              ),
                            ),
                          ),
                          Container(
                            margin:EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(

                                      child: Row(
                                        children: <Widget>[
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                          Container(child: Icon(Icons.star,color: Colors.pinkAccent,size: 18,),),
                                        ],
                                      ),
                                    ),
                                    Container(child: Text('欧阳**89',style: TextStyle(color: Colors.black26),),)
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                ),
                                Container(
                                  margin:EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Text('衣服和图片很一致，质量还不错，对得起这个价格，很喜欢。',style: TextStyle(fontSize: 16),),),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text('尺码：',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      margin:EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Text('均码',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      child: Text('颜色：',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      child: Text('黑色',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text('2017-03-06',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),
                                    Container(
                                      margin:EdgeInsets.fromLTRB(10, 0, 20, 0),
                                      child: Text('15:27:58',style: TextStyle(color: Colors.black26,fontSize: 14),),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(

                            child: OutlineButton(
                              color: Colors.white,
                              highlightColor: Colors.pinkAccent,
                              splashColor: Colors.pink,
                              child: Text("查看全部评价",style: TextStyle(color: Colors.black),),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {},
                            ),
                            width: 200,
                            height: 40,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount: 1,
             ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Color(0xfff9f9f9),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: (){},
              child: Container(width: deviceSize.width*1/8,
                alignment: Alignment.center,
                child: Icon(
                  Icons.headset_mic,
                  size: 35,
                  color: Colors.black38,
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(width: deviceSize.width*1/8,
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite_border,
                  size: 35,
                  color: Colors.black38,
                ),
              ),
            ),InkWell(
              onTap: (){},
              child: Container(width: deviceSize.width*1/8,
                alignment: Alignment.center,
                child: Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.black38,
                ),
              ),
            ),InkWell(
              onTap: (){},
              child: Container(width: deviceSize.width*1/8,
                alignment: Alignment.center,
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.black38,
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(width: deviceSize.width*1/4,
                alignment: Alignment.center,
                color: Colors.pinkAccent,
                child: Text(
                  '加入购物车',
                  style: TextStyle(color: Colors.white,),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => MyHomePagegoods()),
                );
                },
              child: Container(width: deviceSize.width*1/4,
                alignment: Alignment.center,
                color: Colors.red,
                child: Text(
                  '立刻下单',
                  style: TextStyle(color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
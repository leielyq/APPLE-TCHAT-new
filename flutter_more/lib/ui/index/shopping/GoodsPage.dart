import 'package:flutter/material.dart';
import 'package:flutter_more/ui/index/shopping/AddressPage.dart';
import 'package:flutter_more/ui/index/shopping/OrderPage.dart';
enum WhyFarther {
  harder,
  smarter,
  selfStarter,
  tradingCharter,
}
class MyHomePagegoods extends StatefulWidget {
  MyHomePagegoods({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageStateGoods createState() => _MyHomePageStateGoods();
}

class _MyHomePageStateGoods extends State<MyHomePagegoods> {
  @override
  Widget build(BuildContext context) {

    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black38,),
            onPressed: (){Navigator.pop(context);
              }
            ),
        title: Text('填写订单',style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
      ),
      body:
      SingleChildScrollView(
          child: new ConstrainedBox(
              constraints: new BoxConstraints(
                  minHeight: 120.0
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 70,
                          color: Color(0xfff9f9f9),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: new FractionalOffset(0.1, 0.15),
                                child: Text('程程',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,),),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.35, 0.15),
                                child: Text('113****3216',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,),),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.03, 0.75),
                                child: Icon(Icons.place),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.2, 0.75),
                                child: Text('北京丰台区国投财富广场10号楼'),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.95, 0.5),
                                child: IconButton(
                                  icon: Icon(Icons.chevron_right),
                                  onPressed: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (BuildContext context) => MyHomePageadd()),
                                  );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: ClipOval(
                                  child: Image.asset('images/acco.png',
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  )

                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Text('北海道渔夫淡蓝素雅碗',
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black, //字体颜色
                                      fontWeight: FontWeight.w800, //粗体
                                      letterSpacing: 1.0, //字间距
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '数量：x1 颜色：蓝色',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black26, //字体颜色
                                      //粗体
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text('￥120.00',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),

                            Container()
                          ],

                        ),
                        Container(decoration: new BoxDecoration(
                          color: Colors.white,
                          //设置四周边框
                          border: new Border.all(width: 1, color: Colors.black12),
                        ),
                          width: deviceSize.width*1/1,
                          height: deviceSize.height*13/100,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:
                          Row(

                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text("支付配送"),
                                ),
                              ),
                              Column(crossAxisAlignment:CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(child: Text('在线支付'),),
                                  Container(child: Text('商家配送'),),
                                  Container(child: Text('由商家选择合作快递配送'),),
                                ],
                              ),
                              Container(
                                child: IconButton(
                                  onPressed:  () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return new Container(
                                          height: deviceSize.height*1/3,
                                          child: Column(
                                            children: <Widget>[
                                              FlatButton(
                                                child: Text("normal"),
                                                onPressed: () {},
                                              ),
                                              FlatButton(
                                                child: Text("normal"),
                                                onPressed: () {},
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ).then((val) {
                                      print(val);
                                    });
                                  },
                                  icon: Icon(Icons.chevron_right),
                                ),
                                padding: new EdgeInsets.fromLTRB(3, 10, 0, 0),),

                            ],
                          ),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            //设置四周边框
                            border: new Border.all(width: 1, color: Colors.black12),
                          ),
                          width: deviceSize.width*1/1,
                          height: deviceSize.height*7/100,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:
                          Row(
                            crossAxisAlignment:CrossAxisAlignment.end,
                            mainAxisAlignment:MainAxisAlignment.start,
                            //crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text("发票信息"),
                                ),
                              ),
                              Container(child: Text('不开发票'),),
                              Container(
                                child: IconButton(
                                  onPressed:  () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return new Container(
                                          height: deviceSize.height*1/3,
                                          child: new Image.asset('images/acco.png'),
                                        );
                                      },
                                    ).then((val) {
                                      print(val);
                                    });
                                  },
                                  icon: Icon(Icons.chevron_right),
                                ),
                                padding: new EdgeInsets.fromLTRB(3, 10, 0, 0),),
                            ],
                          ),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            //设置四周边框
                            border: new Border.all(width: 1, color: Colors.black12),
                          ),
                          width: deviceSize.width*1/1,
                          height: deviceSize.height*7/100,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child:
                          Row(
                            crossAxisAlignment:CrossAxisAlignment.end,
                            mainAxisAlignment:MainAxisAlignment.start,
                            //crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text("优惠方式"),
                                ),
                              ),
                              Container(child: Text('不开发票'),),
                              Container(
                                child: IconButton(
                                  onPressed:  () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return new Container(
                                          height: deviceSize.height*1/3,
                                          child: new Image.asset('images/acco.png'),
                                        );
                                      },
                                    ).then((val) {
                                      print(val);
                                    });
                                  },
                                  icon: Icon(Icons.chevron_right),
                                ),
                                padding: new EdgeInsets.fromLTRB(3, 10, 0, 0),),
                            ],
                          ),
                        ),
                        Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              //设置四周边框
                              border: new Border.all(width: 1, color: Colors.black12),
                            ),
                            width: deviceSize.width*1/1,
                            height: deviceSize.height*10/100,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child:TextField(
                              decoration: InputDecoration(
                                labelText: "选填：给商家留言（45字以内）",
                              ),
                            )
                        ),
                        SizedBox(height: deviceSize.height*2/100),
                        Stack(
                            children: <Widget>[
                              new Align(
                                alignment: new FractionalOffset(0.05, 0.0),
                                child: Text('商品金额',style: TextStyle(fontSize: 16),),
                              ),
                              new Align(
                                alignment: new FractionalOffset(0.95, 0.0),
                                child: Text('￥600.00',style: TextStyle(fontSize: 16),),
                              ),
                            ]
                        ),

                        Stack(
                            children: <Widget>[
                              new Align(
                                alignment: new FractionalOffset(0.05, 0.0),
                                child: Text('运费',style: TextStyle(fontSize: 16),),
                              ),
                              new Align(
                                alignment: new FractionalOffset(0.95, 0.0),
                                child: Text('￥0.00',style: TextStyle(fontSize: 16),),
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),
                ],
              )
          )
      ),

      bottomNavigationBar: Container(
        color: Color(0xfff9f9f9),
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text("实付款"),
              subtitle: Text("\$600"),
            )),
            Expanded(
              child: MaterialButton(

                height: 50,
                onPressed: (){},
                child: Text("提交订单",style: TextStyle(color: Colors.white,fontSize: 16),),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}


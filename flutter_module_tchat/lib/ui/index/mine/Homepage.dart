import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: new Stack(
          children: <Widget>[
            new Positioned(
              child: AppBar(

                leading: Icon(Icons.arrow_back
                ),
                flexibleSpace: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(10, 70, 0, 0),
                            child: Column(
                              children: <Widget>[
                                new Container(
                                  width: 60.0,
                                  height: 60.0,
                                  margin: const EdgeInsets.all(20.0),
                                  decoration: new BoxDecoration(
                                    color: Colors.white,
                                    image: new DecorationImage(
                                        image: new AssetImage(
                                            'images/acco.png'),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Padding(
                              padding: new EdgeInsets.fromLTRB(0, 70, 0, 0),
                              child: new Text('克莱伦斯', style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),)
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(120, 70, 0, 0),
                            child: new Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                                gradient: LinearGradient(colors: <Color>[
                                  Colors.lightBlueAccent,
                                  Colors.lightBlueAccent,
                                ]),
                              ),
                              child: Text('签到赚积分'),
                              //Icon(Icons.monetization_on,color: Colors.white,),
                              padding: EdgeInsets.fromLTRB(10, 6, 0, 6),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: (1000),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ Colors.lightBlueAccent, Colors.cyanAccent],
                    ),
                  ),
                ),
                //title: Text(widget.title),
                actions: <Widget>[
                  new IconButton(
                      icon: new Icon(Icons.more_horiz),
                      tooltip: 'Add Alarm',
                      onPressed: () {}
                  ),
                  new IconButton(
                      icon: new Icon(Icons.adjust),
                      tooltip: 'Add Alarm',
                      onPressed: () {}
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body:
      SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 120.0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    new Column(
                      children: <Widget>[

                        new RaisedButton(

                          child: new Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8.0),
                              gradient: LinearGradient(colors: <Color>[
                                Colors.yellow,
                                Colors.yellow,
                              ]),
                            ),
                            child: Icon(Icons.stars),
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            alignment: Alignment.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          //圆角大小,与BoxDecoration保持一致，更美观
                          onPressed: () {},

                          textColor: Colors.white,
                        ),
                        new Container(
                          child: new Text('积分任务'),
                        ),
                      ],
                    ),
                    new Column(
                      children: <Widget>[
                        new RaisedButton(
                          child: new Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8.0),
                              gradient: LinearGradient(colors: <Color>[
                                Colors.orange,
                                Colors.orange,
                              ]),
                            ),
                            child: Icon(Icons.create_new_folder),
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            alignment: Alignment.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          //圆角大小,与BoxDecoration保持一致，更美观
                          onPressed: () {},
                          textColor: Colors.white,
                        ),
                        new Container(
                          child: new Text('健康档案'),
                        ),
                      ],
                    ),
                    new Column(
                      children: <Widget>[
                        new RaisedButton(
                          child: new Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8.0),
                              gradient: LinearGradient(colors: <Color>[
                                Colors.blue,
                                Colors.blue,
                              ]),
                            ),
                            child: Icon(Icons.assignment),
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            alignment: Alignment.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          //圆角大小,与BoxDecoration保持一致，更美观
                          onPressed: () {},
                          textColor: Colors.white,
                        ),
                        new Container(
                          child: new Text('血糖记录'),
                        ),
                      ],
                    ),
                    new Column(
                      children: <Widget>[
                        new RaisedButton(
                          child: new Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(8.0),
                              gradient: LinearGradient(colors: <Color>[

                                Colors.green,
                                Colors.green,
                              ]),
                            ),
                            child: Icon(Icons.favorite),
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            alignment: Alignment.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          //圆角大小,与BoxDecoration保持一致，更美观
                          onPressed: () {},
                          textColor: Colors.white,
                        ),
                        new Container(
                          child: new Text('关于我们'),
                        ),
                      ],
                    ),


                    //圆角渐变色按钮


                  ],
                ),
                SizedBox(height: 30.0),
                Row(

                    children: <Widget>[

                      new Column(
                          children: <Widget>[

                            new Image.asset(
                              'images/acco.png',
                              height: 70.0,

                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              fit: BoxFit.fitWidth,
                            ),
                          ]
                      ),
                    ]

                ),
                SizedBox(height: 30.0),
                Stack(
                  children: <Widget>[

                    new Align(
                        alignment: const Alignment(-0.9, 1),
                        child: new Text('测评记录',
                          style: new TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800),)
                    ),
                    new Align(
                      alignment: const Alignment(0.85, -1),
                      child: new Text('更多'),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: ClipOval(
                          child: Image.asset('images/acco.png',
                            height: 50,
                            width: 50,
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
                          child: Text('精神分裂',
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
                        Container(child: Text(
                          '2019-03-01 18:00:00',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black26, //字体颜色
                            //粗体
                          ),
                        ),
                        ),
                      ],
                    ),
                    Container(padding: EdgeInsets.fromLTRB(70, 0, 20, 0),
                      child: Text('高风险',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.orange, //字体颜色
                          fontWeight: FontWeight.w800, //粗体
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration( //用这个装饰
                        //          borderRadius: BorderRadius.all(
                        //            Radius.circular(150)
                        //          )建圆形的第一种方式
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(150), //大圆角使出现圆形：第二种

                      ),
                      child: Icon(Icons.chevron_right, color: Colors.white),
                    ),
                    Container()
                  ],

                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.0, top: 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.black26,
                      width: 350.0,
                      height: 1.0,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: ClipOval(
                          child: Image.asset('images/acco.png',
                            height: 50,
                            width: 50,
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
                          child: Text('肺癌',
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
                        Container(child: Text(
                          '2019-03-01 18:00:00',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black26, //字体颜色
                            //粗体
                          ),
                        ),
                        ),
                      ],
                    ),
                    Container(padding: EdgeInsets.fromLTRB(70, 0, 20, 0),
                      child: Text('高风险',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.orange, //字体颜色
                          fontWeight: FontWeight.w800, //粗体
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration( //用这个装饰
                        //          borderRadius: BorderRadius.all(
                        //            Radius.circular(150)
                        //          )建圆形的第一种方式
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(150), //大圆角使出现圆形：第二种

                      ),
                      child: Icon(Icons.chevron_right, color: Colors.white),
                    ),
                    Container()
                  ],

                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.0, top: 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.black26,
                      width: 350.0,
                      height: 1.0,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: ClipOval(
                          child: Image.asset('images/acco.png',
                            height: 50,
                            width: 50,
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
                          child: Text('糖尿病',
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
                        Container(child: Text(
                          '2019-03-01 18:00:00',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black26, //字体颜色
                            //粗体
                          ),
                        ),
                        ),
                      ],
                    ),
                    Container(padding: EdgeInsets.fromLTRB(70, 0, 20, 0),
                      child: Text('高风险',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.orange, //字体颜色
                          fontWeight: FontWeight.w800, //粗体
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration( //用这个装饰

                        color: Colors.green,
                        borderRadius: BorderRadius.circular(150), //大圆角使出现圆形：第二种

                      ),
                      child: Icon(Icons.chevron_right, color: Colors.white),
                    ),
                    Container()
                  ],

                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.0, top: 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.black26,
                      width: 350.0,
                      height: 1.0,
                    ),
                  ),
                ),
                //buildTitle(),
              ],
            ),
          )
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.business_center), title: Text('活动')),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), title: Text('早筛')),
          BottomNavigationBarItem(
              icon: Icon(Icons.beenhere), title: Text('保险')),
          BottomNavigationBarItem(
              icon: Icon(Icons.tag_faces), title: Text('我的')),
        ],
        fixedColor: Colors.lightBlueAccent,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
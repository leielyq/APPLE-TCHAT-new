import 'package:flutter/material.dart';
import 'package:flutter_more/ui/index/shopping/NewAddress.dart';
import 'package:flutter_more/ui/index/shopping/GoodsPage.dart';
import 'package:flutter_more/ui/index/shopping/EditAddress.dart';
class MyHomePageadd extends StatefulWidget {
  MyHomePageadd({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageStateAdd createState() => _MyHomePageStateAdd();
}

class _MyHomePageStateAdd extends State<MyHomePageadd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black38,),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
        title: Text('我的收货地址',style: TextStyle(color: Colors.black87),),
        actions: <Widget>[
          new FlatButton(
              child: Text('添加新地址'),

              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => MyHomePagenew()),
              );},

          ),
        ],
        backgroundColor: Colors.white,
      ),
      body:
      SingleChildScrollView(
          child: new ConstrainedBox(
              constraints: new BoxConstraints(
                  minHeight: 120.0
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color:Colors.black38,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 70,
                          color: Colors.white,
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
                                alignment: new FractionalOffset(0, 0.75),
                                child: Icon(Icons.place,color: Colors.blue,size: 30,),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.2, 0.75),
                                child: Text('北京丰台区国投财富广场10号楼'),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 70,

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
                                child: Icon(Icons.place,),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.2, 0.75),
                                child: Text('北京丰台区国投财富广场10号楼'),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.95, 0.5),
                                child: FlatButton(
                                    child:Text('丨编辑',style: TextStyle(fontSize: 18,color: Colors.black26),),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (BuildContext context) => MyHomePageedit()),
                                      );
                                    },
                                ),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 70,

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
                                child: Icon(Icons.place,),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.2, 0.75),
                                child: Text('北京丰台区国投财富广场10号楼'),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.95, 0.5),
                                child: FlatButton(
                                  child:Text('丨编辑',style: TextStyle(fontSize: 18,color: Colors.black26),),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) => MyHomePageedit()),
                                    );
                                  },
                                ),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 70,

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
                                child: Icon(Icons.place,),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.2, 0.75),
                                child: Text('北京丰台区国投财富广场10号楼'),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.95, 0.5),
                                child: FlatButton(
                                  child:Text('丨编辑',style: TextStyle(fontSize: 18,color: Colors.black26),),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) => MyHomePageedit()),
                                    );
                                  },
                                ),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 70,

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
                                child: Icon(Icons.place,),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.2, 0.75),
                                child: Text('北京丰台区国投财富广场10号楼'),
                              ),
                              Align(
                                alignment: new FractionalOffset(0.95, 0.5),
                                child: FlatButton(
                                  child:Text('丨编辑',style: TextStyle(fontSize: 18,color: Colors.black26),),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (BuildContext context) => MyHomePageedit()),
                                    );
                                  },
                                ),

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }
}


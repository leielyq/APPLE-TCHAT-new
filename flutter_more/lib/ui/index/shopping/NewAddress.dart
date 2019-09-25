import 'package:flutter/material.dart';
import 'package:flutter_more/ui/index/shopping/AddressPage.dart';
class MyHomePagenew extends StatefulWidget {
  MyHomePagenew({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageStateNew createState() => _MyHomePageStateNew();
}

class _MyHomePageStateNew extends State<MyHomePagenew> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _uaddressController = new TextEditingController();
  TextEditingController _uprefectureController = new TextEditingController();
  bool _switchSelected=false;
  bool isChecked=false;
  int groupValue;

  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.black38,),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
        title: Text('添加收货地址',style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          new FlatButton(
            child: Text('保存',style: TextStyle(color: Colors.deepOrangeAccent),),
            onPressed: () {},
          ),
        ],
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

                    child: Form(
                        key: _formKey, //设置globalKey，用于后面获取FormState
                        autovalidate: true, //开启自动校验
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                autofocus: true,
                                controller: _unameController,
                                decoration: InputDecoration(
                                    labelText: "用户名",
                                    hintText: "用户名或邮箱",
                                    icon: Icon(Icons.person)
                                ),
                                // 校验用户名
                                validator: (v) {
                                  return v
                                      .trim()
                                      .length > 0 ? null : "用户名不能为空";
                                }

                            ),
                            TextFormField(
                                controller: _pwdController,
                                decoration: InputDecoration(
                                    labelText: "手机号码",
                                    hintText: "您的手机号码",
                                    icon: Icon(Icons.call)
                                ),
                                //obscureText: true,
                                validator: (v) {
                                  return v
                                      .trim()
                                      .length > 0 ? null : "手机号不能为空";
                                }
                            ),
                            TextFormField(
                                autofocus: true,
                                controller: _uprefectureController,
                                decoration: InputDecoration(
                                    labelText: "所在地区",
                                    hintText: "地区",
                                    icon: Icon(Icons.person)
                                ),
                                // 校验用户名
                                validator: (v) {
                                  return v
                                      .trim()
                                      .length > 0 ? null : "地区不能为空";
                                }

                            ),
                            TextFormField(
                                autofocus: true,
                                controller: _uaddressController,
                                decoration: InputDecoration(
                                    labelText: "地址",
                                    hintText: "如道路、门牌号、小区、楼栋号、单元室等",
                                    icon: Icon(Icons.person)
                                ),
                                // 校验用户名
                                validator: (v) {
                                  return v
                                      .trim()
                                      .length > 0 ? null : "地址不能为空";
                                }

                            ),


                          ],
                        )
                    ),
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  ),

                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('地址标签',style: TextStyle(fontSize: 20),),
                                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),

                              ),
                              ButtonBar(

                                children: <Widget>[
                                  OutlineButton(

                                    splashColor: Colors.grey,
                                    child: Container(
                                      child: Text("家",style: TextStyle(fontSize: 16),),
                                      padding: EdgeInsets.fromLTRB(15, 2, 15, 2),

                                    ),
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                    onPressed: () {},
                                  ),
                                  OutlineButton(
                                    splashColor: Colors.grey,
                                    child: Container(
                                      child: Text("公司",style: TextStyle(fontSize: 16),),
                                      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    ),
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                    onPressed: () {},
                                  ),
                                  OutlineButton(
                                    splashColor: Colors.grey,
                                    child: Container(
                                      child: Text("学校",style: TextStyle(fontSize: 16),),
                                      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    ),
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Text('更多'),
                                  ),
                                  Icon(Icons.chevron_right)
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
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(child: Text('设为默认地址',style: TextStyle(fontSize: 20),),),
                              Container(child: Switch(
                                value: _switchSelected,//当前状态
                                onChanged:(value){
                                  //重新构建页面
                                  setState(() {
                                    _switchSelected=value;
                                  });
                                },
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
      )
    );
  }
  void updateGroupValue(int e){
    setState(() {
      groupValue=e;
    });
  }
}


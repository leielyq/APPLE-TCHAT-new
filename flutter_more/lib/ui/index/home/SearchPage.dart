import 'package:flutter/material.dart';
import 'package:flutter_more/ui/index/home/SearchDetails.dart';
import 'package:flutter_more/ui/index/MainPage.dart';
class MyHomePagesearch extends StatefulWidget {
  MyHomePagesearch({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageStateSearch createState() => _MyHomePageStateSearch();
}

class _MyHomePageStateSearch extends State<MyHomePagesearch> {

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black38,),
              onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => MainPage()),
                  ModalRoute.withName('/'),
                );
              }
          ),
          title: buildTextField(),
//          TextField(
////              decoration: InputDecoration(
////                //icon: Icon(Icons.person),
////                hasFloatingPlaceholder: false,
////                labelText: "输入搜索",
//////        helperText: "helperText",
//////        errorText: "errorText",
////                // hintText: "hintText",
////                contentPadding: EdgeInsets.all(10.0),
////                border: OutlineInputBorder(
////                  borderRadius: BorderRadius.circular(15.0),
//////          borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
////                ),
////                suffixIcon: Icon(
////                  Icons.camera_alt,
////                ),
////              ),
////          )

          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
//            new FlatButton(
//              child: Text('搜索',style: TextStyle(color: Colors.deepOrangeAccent),),
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (BuildContext context) => MyHomePagesearchdetails()),
//                );
//              },
//            ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 12, 10, 12),
            child:
        RaisedButton(

            child: new Container(

              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20.0),
               gradient: LinearGradient(colors: <Color>[
        Colors.orange,
        Colors.deepOrange,
      ]),
    ),
    child: new Text("搜索"),
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    alignment: Alignment.center,
    ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)), //圆角大小,与BoxDecoration保持一致，更美观
    onPressed: () {Navigator.push(
                 context,
                  MaterialPageRoute(builder: (BuildContext context) => MyHomePagesearchdetails()));},
    textColor: Colors.white,
    ),


          ),

          ],
        ),
        body:
        SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(
                minHeight: 120.0
            ),

          ),
        )
    );
  }
  Widget buildTextField() {
    return Theme(
      data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.blue),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.camera_alt,),
            contentPadding: EdgeInsets.fromLTRB(20,0,10,0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23.0),
//            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
            )
        ),
      ),
    );
  }
}


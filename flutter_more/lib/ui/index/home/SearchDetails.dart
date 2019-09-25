import 'package:flutter/material.dart';
import 'package:flutter_more/ui/index/home/SearchPage.dart';

class MyHomePagesearchdetails extends StatefulWidget {
  MyHomePagesearchdetails({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageStateSearchDetails createState() =>
      _MyHomePageStateSearchDetails();
}

class _MyHomePageStateSearchDetails extends State<MyHomePagesearchdetails> {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black38,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: new FlatButton(
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyHomePagesearch()),
                );
              },
              child: Container(
                decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.deepOrange, width: 1),
                  // 边色与边宽度
                  //color: Color(0xFFFFFFFF),
                         borderRadius: new BorderRadius.circular((20.0)), // 圆角度
                ),
                width: 300,
                height: 30,
                child: Container(
                  margin: EdgeInsets.fromLTRB(4  , 2, 0, 0),
                  child:Text("点击搜索",
                    style: TextStyle(color: Colors.grey),),

                ),
              ),
              color: Colors.white,
            ),
//            TextField(
//              decoration: InputDecoration(
//                //icon: Icon(Icons.person),
//                hasFloatingPlaceholder: false,
//                labelText: "输入搜索",
//                border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(15),
//                    borderSide: BorderSide.none),
//                suffixIcon: Icon(
//                  Icons.camera_alt,
//                ),
//              ),
//            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MyHomePagesearch()),
              );
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            new FlatButton(
              child: Icon(Icons.apps),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(minHeight: 120.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

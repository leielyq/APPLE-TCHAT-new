import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_more/view/MySliverAppBar.dart';
class StatelessWidget extends StatefulWidget {
  StatelessWidget({Key key, this.title}) : super(key: key);
  final String title;
  @override
  DetailsTopArea createState() => DetailsTopArea();
}

class DetailsTopArea extends State<StatelessWidget>{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
        child:Scaffold(
          body: Column(
            children: <Widget>[
                Container(
                  child: Text('a'),

                )
            ],

          ),
        ),

    );
  }
  Widget _goodsImage(url,BuildContext context){
    final Size deviceSize = MediaQuery.of(context).size;
    return Image.network(
      url,
      width: deviceSize.width,
    );
  }
  Widget _goodsName(name){
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
  Widget _goodsNum(num){
    return Container(

    );
  }

}



















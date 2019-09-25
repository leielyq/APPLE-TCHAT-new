import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_module_tchat/view/MySliverAppBar.dart';
import 'package:flutter_module_tchat/style/theme.dart' as Theme;
import 'ShoppingItem.dart';
import 'package:banner_view/banner_view.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;


    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          MySliverAppBar(
            title: Text("抢购区"),
            expandedHeight: deviceSize.width*300/533,
            background: Container(
              child: AspectRatio(
                  aspectRatio: 533 / 300, child: BannerView(_buildBanner(4))
              ),
              color: Colors.yellow,
            ),
          ),
          SliverSafeArea(
            sliver:SliverList(delegate:  SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ShoppingItem();
              },
              childCount: 10,
            ),),
          ),


        ],

      ),

    );
  }


  //创建banner图片
  Widget _buildBannerImg(String url) {
    return Container(
      color: Colors.black,
      child: Image.network(url,width: 533,height: 300,fit: BoxFit.cover,),
    );
  }

  //创建banner多个图片
  List _buildBanner(int size) {
    var list = <Widget>[];
    for (int i = 0; i < size; i++) {
      list.add(_buildBannerImg(
          "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1145885896,3101539579&fm=26&gp=0.jpg"));
    }
    
    return list;
  }


}


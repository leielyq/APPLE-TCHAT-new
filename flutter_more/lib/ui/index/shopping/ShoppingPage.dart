import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_more/view/MySliverAppBar.dart';
import 'package:flutter_more/style/theme.dart' as Theme;
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
            expandedHeight: deviceSize.width*200/533,
            background: Container(
              child: AspectRatio(
                  aspectRatio: 533 / 300,
                  child: BannerView(_buildBanner(4))
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
    var images=["https://img.alicdn.com/tfs/TB1I86uexD1gK0jSZFsXXbldVXa-520-280.jpg_q90_.webp",
      "https://img.alicdn.com/simba/img/TB1q.cbX.z.BuNjt_bXSuwQmpXa.jpg",
      "https://img.alicdn.com/simba/img/TB1q.cbX.z.BuNjt_bXSuwQmpXa.jpg",
      "https://img.alicdn.com/tfs/TB1zC3GekY2gK0jSZFgXXc5OFXa-520-280.jpg_q90_.webp"];
    var list = <Widget>[];
    for (int i = 0; i < size; i++) {
      list.add(_buildBannerImg(
          images[i]));
    }
    return list;
  }


}


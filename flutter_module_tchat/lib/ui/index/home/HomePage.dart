import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banner_view/banner_view.dart';
import 'package:flutter_module_tchat/style/theme.dart' as Theme;
import 'package:flutter_module_tchat/view/MySliverAppBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //创建banner图片
  Image _buildBannerImg(String url) {
    return Image.network(url);
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

  List _buildGridTileList(int size) {
    var list = <Widget>[];
    for (int i = 0; i < size; i++) {
      list.add(Image.network(
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2514535724,3783815243&fm=26&gp=0.jpg",
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ));
    }
    return list;
  }

  //构建十个Item

  List _buildItems(int size) {
    var list = <Widget>[];
    for (int i = 0; i < size; i++) {
      list.add(GridView.count(
        //      横轴数量 这里的横轴就是x轴 因为方向是垂直的时候 主轴是垂直的
        crossAxisCount: 5,
        padding: const EdgeInsets.all(4.0),
        //主轴间隔
        mainAxisSpacing: 10.0,
        //横轴间隔
        crossAxisSpacing: 4.0,

        children: _buildGridTileList(10),
      ));
    }
    return list;
  }

  Widget _buildHeaderView() {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
                aspectRatio: 533 / 300, child: BannerView(_buildBanner(4))),
            Card(
                child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.clock),
                  Flexible(
                    child: Text("最新消息：恭喜会员xxxxx，抢购商品成功"),
                  )
                ],
              ),
            )),
            AspectRatio(
              aspectRatio: 5 / 2.2,
              child: BannerView(
                _buildItems(2),
                indicatorBuilder: (BuildContext context, Widget widget) {
                  return Text("");
                },
              ),
            ),
          ],
        ),
        Container(
          child: _buildSearchView(),
          margin: EdgeInsets.only(top: 35),
        )
      ],
    );
  }

  Widget _buildItemHeader(String s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.black12,
                  Theme.Colors.mainBtn,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: 100.0,
          height: 1.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            s,
            style: TextStyle(
                color: Theme.Colors.mainBtn,
                fontSize: 16.0,
                fontFamily: "WorkSansMedium"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.Colors.mainBtn,
                  Colors.black12,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: 100.0,
          height: 1.0,
        ),
      ],
    );
  }

  Widget _buildSearchView() {
    return Container(
      height: 40,
      child: Container(
        child: FlatButton(
          onPressed: () {
            print("123");
          },
          child: Text(
            "点击搜索",
            style: TextStyle(color: Colors.grey),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.white,
        ),
        width: 350,
      ),
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      MySliverAppBar(
        expandedHeight: 424.7,
        title: _buildSearchView(),
        background: _buildHeaderView(),
      ),
      SliverSafeArea(
        sliver: SliverListDemo(),
      ),
    ]));
  }
}

class SliverListDemo extends StatelessWidget {
  Widget _buildItemHeader(String s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.black12,
                  Theme.Colors.mainBtn,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: 100.0,
          height: 1.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8, bottom: 8),
          child: Text(
            s,
            style: TextStyle(
                color: Theme.Colors.mainBtn,
                fontSize: 16.0,
                fontFamily: "WorkSansMedium"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.Colors.mainBtn,
                  Colors.black12,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          width: 100.0,
          height: 1.0,
        ),
      ],
    );
  }

  Widget _buildItem() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2514535724,3783815243&fm=26&gp=0.jpg",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Text("苏食农场猪带皮五花肉300g"),
          Container(
            child: Text(
              "限时",
            ),
            decoration: BoxDecoration(
              //背景
              color: Colors.white,
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              //设置四周边框
              border: new Border.all(width: 1, color: Colors.red),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "￥" + "10",
                style: TextStyle(color: Colors.red),
              ),
              CupertinoButton(child: Text("购买"), onPressed: null)
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        //设置四周边框
        border: new Border.all(width: 5, color: Colors.transparent),
      ),
      margin: EdgeInsets.all(10),
    );
  }

  Widget _buildItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: _buildItem(),
          flex: 1,
        ),
        Expanded(
          child: _buildItem(),
          flex: 1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index % 2 == 0) {
            return _buildItemHeader("热门商品");
          } else {
            return Container(
              child: _buildItems(),
              color: Theme.Colors.bgColor,
            );
          }
        },
        childCount: 10,
      ),
    );
  }
}

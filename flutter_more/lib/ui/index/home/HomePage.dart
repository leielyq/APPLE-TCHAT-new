import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banner_view/banner_view.dart';
import 'package:flutter_more/style/theme.dart' as Theme;
import 'package:flutter_more/view/SliverAppBarDelegate.dart';
import 'package:flutter_more/view/MySliverAppBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_more/ui/index/home/SearchPage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //创建banner图片
  Image _buildBannerImg(String url) {
    return Image.network(url);
  }

  var images=["https://img.alicdn.com/tfs/TB1I86uexD1gK0jSZFsXXbldVXa-520-280.jpg_q90_.webp",
    "https://img.alicdn.com/simba/img/TB1q.cbX.z.BuNjt_bXSuwQmpXa.jpg",
    "https://img.alicdn.com/simba/img/TB1q.cbX.z.BuNjt_bXSuwQmpXa.jpg",
    "https://img.alicdn.com/tfs/TB1zC3GekY2gK0jSZFgXXc5OFXa-520-280.jpg_q90_.webp"];
  var imgs = [ "https://img.alicdn.com/bao/uploaded/i1/87948303/TB2TuwztFXXXXXeXXXXXXXXXXXX_!!87948303.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/TB1ZQNZLXXXXXaXXXXXXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i2/TB1iM0FLpXXXXcwXVXXXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/TB1e0YeFVXXXXcDXpXXXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i2/T1WF.HFMRbXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i1/10009023015952583/T1av1DXrXXXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/2838887950/TB2AWKkqVXXXXbYXXXXXXXXXXXX_!!2838887950.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i4/10009019440869076/T1hpk5XglXXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i1/693574425/O1CN013tt09V1iYh9C1InyH_!!693574425.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/3300070366/O1CN011iphVp1EZfUsniSd7_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i2/T1WF.HFMRbXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i1/10009023015952583/T1av1DXrXXXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/2838887950/TB2AWKkqVXXXXbYXXXXXXXXXXXX_!!2838887950.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i4/10009019440869076/T1hpk5XglXXXXXXXXX_!!0-item_pic.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i1/693574425/O1CN013tt09V1iYh9C1InyH_!!693574425.jpg_100x100q90.jpg_.webp",
    "https://img.alicdn.com/bao/uploaded/i3/3300070366/O1CN011iphVp1EZfUsniSd7_!!0-item_pic.jpg_100x100q90.jpg_.webp",
  ];
  var text=["鞋子","足球","代购","汽车","鞋子","足球","代购","汽车","鞋子","足球","代购","汽车","鞋子","足球","代购","汽车",];



  //创建banner多个图片
  List _buildBanner(int size) {
    var list = <Widget>[];
    for (int i = 0; i < size; i++) {
      list.add(_buildBannerImg(
         images[i]));
    }
    return list;
  }

  List _buildGridTileList(int size) {
    var list = <Widget>[];
    for (int i = 0; i < size; i++) {
      
      var item = Column(
        children: <Widget>[
          Container(
            child: Image.network(
              imgs[i],
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Text(text[i]),

          )
        ],
      );
      list.add(item);
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
                aspectRatio: 556 / 300, child: BannerView(_buildBanner(4))),
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
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => MyHomePagesearch()),
            );
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
        height: 30,
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
    var image=[
      "https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/670678051/O1CN01cVwyxY29LPGD9LLSE_!!0-item_pic.jpg_250x250.jpg_.webp",
      "https://gma.alicdn.com/bao/uploaded/i4/41908261/O1CN01yJSvHa2AtaSDSqHDX_!!0-saturn_solar.jpg_200x200.jpg_.webp",
      "https://gma.alicdn.com/bao/uploaded/i1/306400190/O1CN01cDm3Zt1DH3nReRe95_!!0-saturn_solar.jpg_200x200.jpg_.webp",
      "https://gma.alicdn.com/bao/uploaded/i1/48269254/O1CN01oH9GhA2IENk6UUgeT_!!0-saturn_solar.jpg_200x200.jpg_.webp",
      "https://g-search2.alicdn.com/img/bao/uploaded/i4/i4/3606131578/O1CN01H2F6hQ1NWlUPIgjPA_!!3606131578.jpg_250x250.jpg_.webp",
      "https://gma.alicdn.com/bao/uploaded/i4/43153435/O1CN01S3kwj71bFGzvX5UJp_!!0-saturn_solar.jpg_200x200.jpg_.webp",
      "https://gma.alicdn.com/bao/uploaded/i4/43153435/O1CN01S3kwj71bFGzvX5UJp_!!0-saturn_solar.jpg_200x200.jpg_.webp",
      "https://gma.alicdn.com/bao/uploaded/i4/43153435/O1CN01S3kwj71bFGzvX5UJp_!!0-saturn_solar.jpg_200x200.jpg_.webp",
      "https://gma.alicdn.com/bao/uploaded/i4/43153435/O1CN01S3kwj71bFGzvX5UJp_!!0-saturn_solar.jpg_200x200.jpg_.webp",
      "https://gma.alicdn.com/bao/uploaded/i4/43153435/O1CN01S3kwj71bFGzvX5UJp_!!0-saturn_solar.jpg_200x200.jpg_.webp"
    ];
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            image[0],
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

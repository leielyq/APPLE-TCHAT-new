import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_more/style/theme.dart' as Theme;
import 'package:flutter_more/ui/index/commodity/CommodityPage.dart';
import 'package:flutter_more/ui/index/shopping/OrderPage.dart';

class ShoppingItem extends StatefulWidget {
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _buildTop(),
            Divider(
              height: 10.0,
              indent: 0.0,
              color: Colors.red,
            ),
            _buildCenter(),
            Padding(
              padding: EdgeInsets.all(2),
            ),
            _buildBottom(),
            _buildBottomBottom()
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: Text(
            "商品由 xxx 卖出",
            style: Theme.Colors.pointStyle,
          ),
        ),
        Text(
          "赚： 99元",
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }

  Widget _buildCenter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.network(
          "https://g-search2.alicdn.com/img/bao/uploaded/i4/i2/670678051/O1CN01cVwyxY29LPGD9LLSE_!!0-item_pic.jpg_250x250.jpg_.webp",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "苏食农场猪带皮五花肉300g",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "我肥瘦相間 包餃子餛飩漩渦哦~",
                style: Theme.Colors.hintStyle,
              ),
              Text(
                "￥" + "10",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        Text(
          "+120券",
          style: Theme.Colors.hintStyle,
        ),
      ],
    );
  }

  Widget _buildBottom() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: Text("未开始批发，请耐心等待", style: Theme.Colors.hintStyle),
        ),
        Text("02时22分22秒", style: Theme.Colors.pointStyle)
      ],
    );
  }

  Widget _buildBottomBottom() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: Text("每售出1个，获得99元"),
        ),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: new Text('批发'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MyHomePageorder()),
            );
          },
        )
      ],
    );
  }
}

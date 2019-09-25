import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_module_tchat/style/theme.dart' as Theme;

class ShoppingItem extends StatefulWidget {
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(padding: EdgeInsets.all(16),

        child: Column(
        children: <Widget>[
          _buildTop(),
          Divider(height:10.0,indent:0.0,color: Colors.red,),
          _buildCenter(),
          Padding(
            padding: EdgeInsets.all(2),
          ),
          _buildBottom(),

          _buildBottomBottom()
        ],
      ),)
      ,
    );
  }

  Widget _buildTop() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: Text("商品由 xxx 卖出",style: Theme.Colors.pointStyle,),
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
          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2514535724,3783815243&fm=26&gp=0.jpg",
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
          child: Text("未开始批发，请耐心等待",style: Theme.Colors.hintStyle),
        ),
        Text("02时22分22秒",style: Theme.Colors.pointStyle)
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
          onPressed: () {},
        )
      ],
    );
  }
}

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_more/http/HttpUtil.dart';
import 'package:flutter_more/model/ShareLifeBean.dart';
import 'package:flutter_more/style/theme.dart' as Theme;
import 'package:flutter_more/ui/comment/CommentPage.dart';
import 'package:flutter_more/view/CLFlow.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_more/view/CustomBottomSheet.dart';
import 'package:flutter_more/view/FoldText.dart';

class ShareLifeItem extends StatefulWidget {
  final dynamic item;
  final int index;
  final Function function;

  const ShareLifeItem({Key key, this.item, this.index, this.function})
      : super(key: key);

  @override
  _ShareLifeItemState createState() => _ShareLifeItemState();
}

abstract class DataListener {
  onChange(int id, bool flag);
}

class _ShareLifeItemState extends State<ShareLifeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            _buildHeaderView(),
            Container(
              height: 1,
            ),
            _buildContextView(),
            Container(
              height: 1,
            ),
            _buildUserToolBarView(),
          ],
        ),
      ),
    );
  }

  goToComment() {
    int id = int.parse(widget.item['uid']);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            body: Container(
              child: CommentPage(
                id: id,
              ),
              padding: EdgeInsets.all(7),
            ),
          );
        });
  }

  like(call) {
    HttpUtil.post("http://specil.jimmychat.com/life/dongtai_clickV1",
        data: {"vid": widget.item['uid']}, success: (res) {
      call(res);
    }, error: (err) {
      print(err);
    });
  }

  forward(call) {
    HttpUtil.post("http://specil.jimmychat.com/life/relay",
        data: {"uid": widget.item['uid']}, success: (res) {
      call(res);
    }, error: (err) {
      print(err);
    });
  }

  toForward() {
    var text = utf8.decode(base64Decode(widget.item['content']));
    var dialog = showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: new Text("提示"),
            content: new Text(
                "转发[${text.substring(0, text.length > 10 ? 10 : text.length)}...]到自己的生活吗？"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了取消");
//                  forward((res) {
//                    Navigator.pop(_);
//                  });
                },
                child: new Text("确认"),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了取消");
                },
                child: new Text("取消"),
              ),
            ],
          );
        });
  }

  toLike() {
    like((res) {
      setState(() {
        widget.item["zangstatus"] = !widget.item["zangstatus"];
        widget.item['zang'] += (1 * (widget.item["zangstatus"] ? 1 : -1));
      });
    });
  }

  focus(call) {
    HttpUtil.post("http://specil.jimmychat.com/focus/dongtai_focus",
        data: {"to_userid": widget.item['userid']}, success: (res) {
      call(res);
    }, error: (err) {
      print(err);
    });
  }

  toFocus() {
    focus((res) {
      setState(() {
        widget.item['focus'] = true;
      });

      widget.function(widget.item['userid'], true);
    });
  }

  focusCancel(call) {
    HttpUtil.post("http://specil.jimmychat.com/focus/quxiao_focus",
        data: {"to_userid": widget.item['userid']}, success: (res) {
      call(res);
    }, error: (err) {
      print(err);
    });
  }

  toFocusCancel() {
    focusCancel((res) {
      setState(() {
        widget.item['focus'] = false;
      });
      widget.function(widget.item['userid'], false);
    });
  }

  toMore() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: ListView(
          children: List.generate(3, (index) {
            var text;

            switch (index) {
              case 0:
                text = Text("翻译");
                break;
              case 1:
                text = Text("举报");
                break;
              case 2:
                text = Text("删除");
                break;
            }

            return InkWell(
                child: Container(
                    alignment: Alignment.center, height: 60.0, child: text),
                onTap: () {
                  print('tapped item ${index + 1}');
                  Navigator.pop(context);
                });
          }),
        ),
        height: 120,
      ),
    );
  }

  Widget _buildHeaderView() {
    print(widget.item);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ExtendedImage.network(
            widget.item['pic'],
            cache: true,
            width: 55,
            height: 55,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: Container(
          height: 55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.item['nickname'],
                      style: Theme.Colors.pointStyle,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: OutlineButton(
                        borderSide: BorderSide(
                            color: widget.item['focus']
                                ? Theme.Colors.textPoint
                                : Theme.Colors.mainBtn),
                        child: Text(
                          widget.item['focus'] ? "取消关注" : "+关注",
                          style: TextStyle(
                              color: widget.item['focus']
                                  ? Theme.Colors.textPoint
                                  : Theme.Colors.mainBtn),
                        ),
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          widget.item['focus'] ? toFocusCancel() : toFocus();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text(widget.item['time'], style: Theme.Colors.hintStyle),
              )
            ],
          ),
        )),
        FlatButton(
          onPressed: toMore,
          child: Text(
            "更多",
            style: Theme.Colors.pointStyle,
          ),
        )
      ],
    );
  }

  getImageContaniner(List<dynamic> pics) {
    List<ExtendedImage> images = [];

    for (var i = 0; pics.length > 0 && i < pics.length; i++) {
      if (pics[i] != "") {
        String imageUrl = utf8.decode(base64Decode(pics[i])).split("&")[0];
        if (imageUrl != null)
          images.add(
            ExtendedImage.network(
              imageUrl,
              cache: true,
              width: 200,
              fit: BoxFit.cover,
            ),
          );
      }
    }

    return images;
  }

  Widget _buildContextView() {
    List<String> _list = [];
    for (var i = 0; i < widget.item['img'].length; i++) {
      if (widget.item['img'][i] != "") {
        _list.add(widget.item['img'][i]);
      }
    }
    Widget imgView;

    if(_list.length >0 ){
      int size = _list.length;

      imgView = GridView.count(
        crossAxisCount: size >= 3 ? 3 : size < 2 ? 1 : 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(4.0),
        //主轴间隔
        mainAxisSpacing: 10.0,
        //横轴间隔
        crossAxisSpacing: 4.0,
        children: getImageContaniner(_list),
      );
    }else{
      imgView = Container();
    }



    final Size deviceSize = MediaQuery.of(context).size;
    var text = utf8.decode(base64Decode(widget.item['content']));
    final TapGestureRecognizer recognizer = new TapGestureRecognizer();
    recognizer.onTap = () {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('协议被点击!'),
      ));
    };



    return Container(
      width: deviceSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Container(
            child: FoldText(
              text: text,
              style: Theme.Colors.pointStyle,
              num: 100,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          imgView,
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }

  Color chooseColor = Colors.grey;

  Widget _buildUserToolBarView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          onTap: toLike,
          child: Row(
            children: <Widget>[
              Icon(Icons.dehaze,
                  color: widget.item["zangstatus"] ? Colors.red : Colors.grey),
              Text("点赞" + widget.item['zang'].toString(),
                  style: widget.item["zangstatus"]
                      ? Theme.Colors.chooseStyle
                      : Theme.Colors.pointStyle)
            ],
          ),
        ),
        InkWell(
          onTap: goToComment,
          child: Row(
            children: <Widget>[
              Icon(Icons.mail, color: Colors.grey),
              Text("评论" + widget.item['comment'].toString(),
                  style: Theme.Colors.pointStyle)
            ],
          ),
        ),
        InkWell(
          onTap: toForward,
          child: Row(
            children: <Widget>[
              Icon(Icons.forward, color: Colors.grey),
              Text("转发", style: Theme.Colors.pointStyle)
            ],
          ),
        ),
      ],
    );
  }
}

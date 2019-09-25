import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_module_tchat/http/HttpUtil.dart';
import 'package:flutter_module_tchat/view/CustomListView.dart';
import 'package:flutter_module_tchat/view/SliverAppBarDelegate.dart';
import 'dart:convert';

import 'CommentItem.dart';

class CommentPage extends StatefulWidget {
  final int id;

  const CommentPage({Key key, this.id}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState(id);
}

class MyCommentItem extends CustomChildBuilderDelegate {
  @override
  Widget build(BuildContext context, int index, data) {
    return CommentItem(
      item: data,
    );
  }
}

class _CommentPageState extends State<CommentPage> {
  List<dynamic> data = List();
  final int id;
  int toId = -1;
  bool isEdit = false;

  FocusNode _focusNode = FocusNode();
  TextEditingController _editingController = TextEditingController();

  _CommentPageState(this.id);

  Row textField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: new TextField(
            controller: _editingController,
            decoration: InputDecoration(
              hintText: 'Say something here...', //提示文字
              border: null,
              focusedBorder: UnderlineInputBorder(
                //输入框被选中时的边框样式
                borderSide: BorderSide(color: Colors.blue[300]),
              ),
            ),
            keyboardType: TextInputType.text,
            //键盘的类型
            maxLength: 250,
            onChanged: (str) {
              setState(() {
                isEdit = str.length > 0;
              });
            }, //最多字数
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.send,
          ),
          onPressed: () {
            toSendComment();
          },
          color: isEdit ? Colors.lightBlue : Colors.black12,
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData((res) {
      setState(() {
        data = res;
      });
    });
  }

  getData(Function call) {
    HttpUtil.post("http://specil.jimmychat.com/life/comment_list",
        data: {"video_id": id}, success: (res) {
      call(res);
    }, error: (err) {
      print(err);
    });
  }

  sendComment(call) {
    if (_editingController.text == null) {
      return;
    }
    HttpUtil.post("http://specil.jimmychat.com/life/comment_addV1", data: {
      "to_id": toId,
      "video_id": id,
      "content": base64Encode(utf8.encode(_editingController.text))
    }, success: (res) {
      call(res);
    }, error: (err) {
      print(err);
    });
  }

  toSendComment() {
    sendComment((res) {
      _editingController.text = "";
      FocusScope.of(context).requestFocus(FocusNode());

      getData((res) {
        setState(() {
          data = res;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var child = MyCommentItem();

    return Column(
      children: <Widget>[
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverSafeArea(
                  sliver: CustomListView(
                childBuilderDelegate: child,
                data: data,
              ))
            ],
          ),
        ),
        textField(),
      ],
    );
  }
}

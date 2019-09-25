import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_more/style/theme.dart' as Theme;

class CommentItem extends StatefulWidget {
  final dynamic item;

  const CommentItem({Key key, this.item}) : super(key: key);

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    print(widget.item);
    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:
            ExtendedImage.network(
              widget.item['pic'],
              cache: true,
              width: 66,
              height: 66,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 66,
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    widget.item['nickname'],
                    style: Theme.Colors.nameStyle,
                  ),
                  Text(
                    utf8.decode(base64Decode(widget.item['content'])),
                    style: Theme.Colors.contextStyle,
                  )
                ],
              ),
            ),

          ),


        ],
      ),
    );
  }

  _buildContent(){
    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ExtendedImage.network(
              widget.item['pic'],
              cache: true,
              width: 66,
              height: 66,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 66,
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    widget.item['nickname'],
                    style: Theme.Colors.nameStyle,
                  ),
                  Text(
                    utf8.decode(base64Decode(widget.item['content'])),
                    style: Theme.Colors.contextStyle,
                  )
                ],
              ),
            ),

          ),


        ],
      ),
    );
  }
}

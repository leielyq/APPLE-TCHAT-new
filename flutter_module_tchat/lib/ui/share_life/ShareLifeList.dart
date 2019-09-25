import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'ShareLifeItem.dart';
import 'package:flutter_module_tchat/style/theme.dart' as Theme;
import 'package:loading_more_list/loading_more_list.dart';

class ShareLifeList extends StatefulWidget {
  final List<dynamic> data;
  final Widget child;

  const ShareLifeList({Key key, this.data, this.child}) : super(key: key);

//  addData(List<dynamic> data) {
//    this.data.addAll(data);
//    createState();
//  }
//
//  newData(List<dynamic> data) {
//    this.data.clear();
//    this.data.add(data);
//    createState();
//  }

  @override
  _ShareLifeListState createState() {
    _ShareLifeListState list = _ShareLifeListState();
    return list;
  }
}

class MyDataListener extends DataListener{
  final data;

  MyDataListener(this.data);

  @override
  onChange(int id, bool flag) {


    data.map((item) {

      });

    return data;
  }

}


class _ShareLifeListState extends State<ShareLifeList> {
  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void _function(String id,bool flag){
    setState(() {
      print(widget.data);
      for(int i = 0;i<widget.data.length;i++){
        dynamic item = widget.data[i];
        String mId = item["userid"];

        if (mId == id) {
          item["focus"] = flag;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    var show = SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isEven) {
            if (widget.data != null && index == widget.data.length * 2) {
              return Offstage(
                  offstage: false,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ));
            } else {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: ShareLifeItem(
                  index: index.toInt() ~/ 2,
                  item: widget.data[index.toInt() ~/ 2],
                  function: _function,
                ),
              );
            }
          }
          return Container(
            color: Theme.Colors.bgColor,
            height: 20,
          );
        },
        semanticIndexCallback: (Widget widget, int localIndex) {
          if (localIndex.isEven) {
            print("当前index:" + (localIndex ~/ 2).toString());
            return localIndex ~/ 2;
          }
          return null;
        },
        childCount: widget.data != null ? widget.data.length * 2 + 1 : 0,
      ),
    );

    return Container(
      child: show,
    );
  }
}

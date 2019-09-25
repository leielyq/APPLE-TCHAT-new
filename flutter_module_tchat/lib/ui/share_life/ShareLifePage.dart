import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_module_tchat/model/ShareLifeBean.dart';
import 'package:flutter_module_tchat/view/MySliverAppBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_module_tchat/style/theme.dart' as Theme;
import 'ShareLifeList.dart';
import 'ShareLifeItem.dart';
import 'package:flutter_module_tchat/http/HttpUtil.dart';
import 'package:json_annotation/json_annotation.dart';

class ShareLifePage extends StatefulWidget {
  @override
  _ShareLifePageState createState() => _ShareLifePageState();
}

class _ShareLifePageState extends State<ShareLifePage> {
  ScrollController _scrollController = ScrollController(); //定义变量及初始化
  List<dynamic> data = List();
  String text = "1456";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      //添加监听
    });
    upData();
  }

  upData() {
    index = 1;
    getData((res) {
      setState(() {
        data = res;
      });
    });
  }

  load(Function call) {
    index++;
    getData((res) {
      setState(() {
        data.addAll(res);
        call(true);
      });
    });
  }

  getData(Function call) {
    HttpUtil.post("http://specil.jimmychat.com/life/friends_listV1",
        data: {"size": 10, "page": index, "type": 2}, success: (res) {
      call(res);
    }, error: (err) {
      print(err);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); //销毁控制器
    super.dispose();
  }

  bool isLoaded = false;
  int index = 1;

  @override
  Widget build(BuildContext context) {
    var list = ShareLifeList(
      data: data,
    );

    /**
     * 下拉刷新方法,为list重新赋值
     */
    Future<Null> _onRefresh() async {
      await Future.delayed(Duration(seconds: 3), () {
        print('refresh');
        upData();
      });
    }

    Future<void> _loadMore() async {
      setState(() {
        load((flag) {
          isLoaded = false;
        });
      });
    }

    _scrollController.addListener(() {
      if (_scrollController.position.axisDirection == AxisDirection.down &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
        if (!isLoaded) {
          isLoaded = true;
          _loadMore();
        }

        print("123");
      }
    });

    return Scaffold(
      body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              MySliverAppBar(
                expandedHeight: 100,
                title: _buildTitleView(),
                background: ExtendedImage.network(
                  "https://img.jimmychat.com/uploads/userpic/20190711141555.png",
                  cache: true,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SliverSafeArea(
                sliver: list,
              ),
              SliverToBoxAdapter(
                child: FlatButton(onPressed: upData, child: Text(text)),
              )
            ],
          )),
    );
  }

  Widget _buildTitleView() {
    return Container(
      child: Center(
        child: Text("生活"),
      ),
    );
  }

  Widget _buildHeaderView() {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[Text("首页"), Icon(FontAwesomeIcons.home)],
        )
      ],
    );
  }
}

import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_more/model/ShareLifeBean.dart';
import 'package:flutter_more/ui/login_page.dart';
import 'package:flutter_more/view/MySliverAppBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_more/style/theme.dart' as Theme;
import 'ShareLifeList.dart';
import 'ShareLifeItem.dart';
import 'package:flutter_more/http/HttpUtil.dart';
import 'package:flutter/services.dart';

class ShareLifePage extends StatefulWidget {
  @override
  _ShareLifePageState createState() => _ShareLifePageState();
}

class _ShareLifePageState extends State<ShareLifePage> {
  ScrollController _scrollController = ScrollController(); //定义变量及初始化
  List<dynamic> data = List();
  String text = "Loading fail.Refresh Data";

  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.pages.your/native_get');
  // 注册一个通知
  static const EventChannel eventChannel = const EventChannel('com.pages.your/native_post');



  static Future<void> pop() async {
    await SystemNavigator.pop();
  }

  // 回调事件
  void _onEvent(Object event) {
    print(event.toString());
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return LoginPage();
    }), (route) => route == null);
  }

  // 错误返回
  void _onError(Object error) {}

  @override
  void initState() {
    super.initState();
    // 监听事件，同时发送参数12345
    eventChannel.receiveBroadcastStream(12345).listen(_onEvent,onError: _onError);
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
                background: ExtendedImage.asset(
                 "assets/img/good.jpg",
                  height: 100,
                  fit: BoxFit.cover,
                ),
                leading: FlatButton(
                  onPressed: () async {
                    await pop();
                  },
                  child: Text("返回"),
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

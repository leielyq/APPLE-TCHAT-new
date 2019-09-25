import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_more/style/theme.dart' as Theme;
import './home/HomePage.dart';
import './shopping/ShoppingPage.dart';
import './mine/Homepage.dart';

import './shops/ShopsPage.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
//        appBar: AppBar(
//          title: Text("首页"),
//        ),
        body: IndexedStack(
          index: index,
          children:[
            HomePage(),
            ShoppingPage(),
            MyHomePages(),
            MyHomePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            title: Text("首页"),
            icon: Icon( FontAwesomeIcons.home)
          ),
          BottomNavigationBarItem(
              title: Text("抢购"),
              icon: Icon( FontAwesomeIcons.search)
          ),

          BottomNavigationBarItem(
              title: Text("商家"),
              icon: Icon( FontAwesomeIcons.shopware,)
          ),

          BottomNavigationBarItem(
              title: Text("我的"),
              icon: Icon( FontAwesomeIcons.personBooth,)
          )
        ],
          currentIndex: index,
          onTap: (int _index){
            setState(() {
              index= _index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Theme.Colors.mainBtn,
          selectedIconTheme: IconThemeData(color:Theme.Colors.mainBtn),




        ),
      ),
    );
  }
}

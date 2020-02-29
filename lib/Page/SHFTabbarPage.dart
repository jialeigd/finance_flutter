import 'package:flutter/material.dart';

import './Home/SHFHomePage.dart';
import './Mine/SHFMinePage.dart';
import './Market/SHFMarketPage.dart';
import '../constant/SHFConstant.dart';

class SHFTabbarPage extends StatefulWidget {
  _SHFTabbarPageState createState() => new _SHFTabbarPageState();
}

class _SHFTabbarPageState extends State<SHFTabbarPage> with SingleTickerProviderStateMixin {

  int tabIndex = 0;
  var pageList;
  var tabImages;
  var appBarTitles = ['首页', '行情', '我的'];

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }
  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }
  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }


  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [getTabImage('assets/image/tab_news_normal.png'), getTabImage('assets/image/tab_news_focus.png')],
      [getTabImage('assets/image/tab_quotes_normal.png'), getTabImage('assets/image/tab_quotes_focus.png')],
      [getTabImage('assets/image/tab_news_normal.png'), getTabImage('assets/image/tab_news_focus.png')]
    ];
    /*
     * 三个子界面
     */
    pageList = [
      new SHFHomePage(),
      new SHFMarketPage(),
      new SHFMinePage(),
    ];
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: pageList[tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          new BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        iconSize: 24.0,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
      ),
    );
  }
}
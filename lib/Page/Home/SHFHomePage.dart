import 'package:flutter/material.dart';
import 'package:flutter_sohu_finance/Model/SHFChannelModel.dart';
import 'package:flutter_sohu_finance/Model/SHFVideoChannelModel.dart';
import 'package:flutter_sohu_finance/Network/Api/SHFChannelApi.dart';

TabController tabController;
List<Widget> tabList;
var titleList = ['要闻', '7*24', 'A股', '公司研究'];

class SHFHomePage extends StatefulWidget {
  _SHFHomePageState createState() => new _SHFHomePageState();
}

class _SHFHomePageState extends State<SHFHomePage> with SingleTickerProviderStateMixin {

  var tabbar;
  List<SHFVideoChannelModel> channels;

  @override
  void initState() {
    super.initState();
    SHFChannelApi.videoChannelRequest((channelList) {
      channels = channelList;
    });
    tabbar = HomePageTabBar();
    tabList = getTabList();
    tabController = TabController(vsync: this, length: tabList.length);
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: DefaultTabController(length: tabList.length,
            child: new Scaffold(
              appBar: new AppBar(
                backgroundColor: Colors.white,
                title: Material(
                  color: Colors.white,
                  child: tabbar,
                ),
              ),
              body: new TabBarView (
                controller : tabController,
                children: [
                  new Icon(Icons.directions_car),
                  new Icon(Icons.directions_transit),
                  new Icon(Icons.directions_bike),
                  new Icon(Icons.directions_bike),
                ]
              ),
            )),
      )
    );
  }

  List<Widget> getTabList() {
    return titleList.map((item) => Text(
      '$item',
    )).toList();
  }
}

class HomePageTabBar extends StatefulWidget {

  HomePageTabBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageTabBarState();
  }
}

class _HomePageTabBarState extends State<HomePageTabBar> {
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;

  @override
  void initState() {
    super.initState();
    selectColor = Colors.black;
    unselectedColor = Colors.grey;
    selectStyle = TextStyle(fontSize: 25, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 15, color: unselectedColor);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 0.0),
      color: Colors.white,
      child: TabBar(
        tabs: tabList,
        isScrollable: true,
        controller: tabController,
        indicatorColor: selectColor,
        labelColor: selectColor,
        labelStyle: selectStyle,
        unselectedLabelColor: unselectedColor,
        unselectedLabelStyle: unselectedStyle,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}
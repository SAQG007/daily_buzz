import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopBar extends StatefulWidget {
  const TopBar({ Key? key }) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {

  TabController? _tabController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // list of all buttons in the top bar
  final List<Tab> _topTabs = <Tab> [
    const Tab(
      icon: Icon(Icons.computer_outlined),
      child: Text(
        'Technology',
      ),
    ),
    const Tab(
      icon: Icon(Icons.business_center_outlined),
      child: Text(
        'Business',
      ),
    ),
    const Tab(
      icon: Icon(Icons.science_outlined),
      child: Text(
        'Science',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // initializing tab controller
    _tabController = TabController(length: _topTabs.length, vsync: this);
  }

  // hadling user's back navigation
  Future<bool> _onWillPop() async {
    if(_tabController?.index == 0) {
      await SystemNavigator.pop();
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      _tabController?.index = 0;
    });

    return (_tabController?.index == 0);
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope can be used to override what happens when a user presses the back button on the device
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Daily Buzz",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: _topTabs,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:material_chat_app/provider/provider.dart';
import 'package:material_chat_app/views/home/chat_home_view.dart';
import 'package:material_chat_app/views/home/contact_home_view.dart';
import 'package:material_chat_app/views/home/group_home_view.dart';
import 'package:material_chat_app/views/home/setting_home_view.dart';
import 'package:provider/provider.dart';

class AllViews extends StatefulWidget {
  const AllViews({super.key});

  @override
  State<AllViews> createState() => _AllViewsState();
}

class _AllViewsState extends State<AllViews> {
  PageController pageController = PageController();
  int curIndex = 0;

  @override
  void initState() {
    Provider.of<MyProvider>(context,listen: false).getLastData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          curIndex = value;
          setState(() {});
        },
        children: const [
          ChatHomeView(),
          GroupHomeView(),
          ContactHomeView(),
          SettingHomeView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: curIndex,
        onDestinationSelected: (value) {
          curIndex = value;
          pageController.jumpToPage(curIndex);
          setState(() {});
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.groups), label: 'Group'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Contacts'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
    );
  }
}

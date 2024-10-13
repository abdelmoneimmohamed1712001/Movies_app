import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/view/browse_tab.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/view/home_tab.dart';
import 'package:movies_app/presentation/home/tabs/search_tab/view/search_tab.dart';
import 'package:movies_app/presentation/home/tabs/watchlist_tab/view/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsManager.darkGrey,
      body: tabs[selectIndex],
      bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).canvasColor)
    , child: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (index) {
            selectIndex = index;
            setState(() {

            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),label: 'SEARCH'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie),label: 'BROWSE'),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark_sharp),label: 'WATCHLIST'),

          ],),
    ));
  }
  List<Widget>tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab()
  ];
}

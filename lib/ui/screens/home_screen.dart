import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/bottom_nav_bar_provider.dart';

import '../widgets/common/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomNavBarProvider>(context,listen: false);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: bottomBarProvider.setActivePageIndex,
        children: bottomBarProvider.pageRoutes,
      ),
      bottomNavigationBar: BottomNavBar(pageController: _pageController),
    );
  }
}

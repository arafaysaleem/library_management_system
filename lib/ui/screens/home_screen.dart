import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/bottom_nav_bar_provider.dart';

import '../../utils/enums/page_type_enum.dart';

import '../widgets/common/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomNavBarProvider>(context,listen: false);
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: bottomBarProvider.setActivePageIndex,
        itemCount: bottomBarProvider.pages.length,
        itemBuilder: (ctx,i) => bottomBarProvider.activePageRoute,
      ),
      bottomNavigationBar: BottomNavBar(pageController: _pageController),
    );
  }
}

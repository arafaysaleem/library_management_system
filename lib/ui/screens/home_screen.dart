import 'package:flutter/material.dart';

import '../../utils/enums/page_type_enum.dart';

import '../widgets/common/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          PageType.COLLECTIONS.getRoute(),
          PageType.GENRES.getRoute(),
          PageType.BOOKSHELF.getRoute(),
          PageType.PROFILE.getRoute(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(pageController: _pageController),
    );
  }
}

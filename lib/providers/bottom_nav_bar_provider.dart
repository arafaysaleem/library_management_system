import 'dart:collection';

import 'package:flutter/material.dart';

import '../utils/enums/page_type_enum.dart';

class BottomNavBarProvider with ChangeNotifier{
  final List<PageType> _pages=[
    PageType.COLLECTIONS,
    PageType.GENRES,
    PageType.AUTHORGALLERY,
    PageType.BOOKSHELF,
    PageType.PROFILE,
  ];

  UnmodifiableListView<PageType> get pages => UnmodifiableListView(_pages);

  PageType _activePage = PageType.COLLECTIONS;

  PageType get activePage => _activePage;

  Widget get activePageRoute => _activePage.getRoute();

  int getPageNumber(PageType page) => _pages.indexOf(page);

  bool isActivePage(PageType page) => _activePage == page;


  setActivePage(PageType newPage) {
    _activePage = newPage;
    notifyListeners();
  }

  setActivePageIndex(int i){
    _activePage = _pages[i];
    notifyListeners();
  }

}
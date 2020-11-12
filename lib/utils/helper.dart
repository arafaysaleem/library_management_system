import 'package:flutter/material.dart';

import 'enums/page_type_enum.dart';

class Helper{
  static final double hPadding = 20.0;

  static navigateToPage({@required BuildContext context, @required PageType page,Object arguments}){
    Navigator.of(context).pushNamed(page.name,arguments: arguments);
  }
}
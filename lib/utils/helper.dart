import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'enums/page_type_enum.dart';

class Helper {
  static final double hPadding = 20.0;
  static final bookPlaceholder='https://kimslater.com/wp-content/uploads/2010/08/blank-cover.png';

  static navigateToPage({@required BuildContext context, @required PageType page, Object arguments}) {
    Navigator.of(context).pushNamed(page.name, arguments: arguments);
  }

  static String dateSerializer(DateTime date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(date);
  }

  static DateTime dateDeserializer(String iso8601date) {
    return DateTime.tryParse(iso8601date);
  }

  static String datePresenter(DateTime date) {
    return DateFormat('d MMM, yyyy').format(date);
  }
}

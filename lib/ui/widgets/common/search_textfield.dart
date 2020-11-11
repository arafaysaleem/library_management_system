import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

class SearchTextField extends StatelessWidget {
  final fillColor;
  final hintTextColor;
  final inputTextColor;

  const SearchTextField({
    Key key,
    @required this.fillColor,
    @required this.hintTextColor,
    @required this.inputTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: TextField(
        onChanged: (val) {},
        keyboardType: TextInputType.name,
        cursorColor: Theme.of(context).primaryColor,
        maxLines: 1,
        textInputAction: TextInputAction.search,
        onSubmitted: (val) {},
        style: TextStyle(color: inputTextColor),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(17),
            filled: true,
            fillColor: fillColor,
            hintText: "What would you like to read?",
            hintStyle: TextStyle(color: hintTextColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: inputTextColor,
                width: 1.4,
                style: BorderStyle.solid,
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: hintTextColor,
            )),
      ),
    );
  }
}

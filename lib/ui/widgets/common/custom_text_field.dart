import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final String hintText;
  final Function(String val) onSubmitted;
  final int maxLines;

  const CustomTextField({
    Key key,
    @required this.keyboardType,
    @required this.prefixIcon,
    @required this.hintText,
    @required this.onSubmitted,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      onSubmitted: widget.onSubmitted,
      onChanged: widget.onSubmitted,
      cursorColor: Theme.of(context).primaryColor,
      maxLines: widget.maxLines,
      obscureText: widget.keyboardType == TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(17),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey[300]),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.4,
            style: BorderStyle.solid,
          ),
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
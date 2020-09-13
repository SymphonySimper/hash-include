import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldColoured extends StatefulWidget {
  final bool isWhite, obscureText;
  final TextEditingController controller;
  final String hintText;

  const TextFieldColoured(
      {Key key, this.isWhite, this.obscureText, this.controller, this.hintText})
      : super(key: key);
  @override
  _TextFieldColouredState createState() => _TextFieldColouredState(
      this.isWhite, this.obscureText, this.controller, this.hintText);
}

class _TextFieldColouredState extends State<TextFieldColoured> {
  final bool isWhite, obscureText;
  final TextEditingController controller;
  final String hintText;

  _TextFieldColouredState(
      this.isWhite, this.obscureText, this.controller, this.hintText);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: isWhite
          ? Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: Theme.of(context).colorScheme.primary)
          : Theme.of(context).textTheme.headline2,
      cursorColor: isWhite
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).cursorColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: isWhite
            ? Theme.of(context).inputDecorationTheme.hintStyle
            : Theme.of(context)
                .inputDecorationTheme
                .hintStyle
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isWhite
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
            width: 0.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isWhite
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

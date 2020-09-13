import 'package:flutter/material.dart';

class TextFormFieldColoured extends StatefulWidget {
  final String hintText, initialValue;
  final bool obscureText, isWhite;
  final Function validator, onSaved;

  const TextFormFieldColoured(
      {Key key,
      this.hintText,
      this.initialValue,
      this.obscureText,
      this.isWhite,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  _TextFormFieldColouredState createState() => _TextFormFieldColouredState(
      this.hintText,
      this.initialValue,
      this.obscureText,
      this.isWhite,
      this.validator,
      this.onSaved);
}

class _TextFormFieldColouredState extends State<TextFormFieldColoured> {
  final String hintText, initialValue;
  final bool obscureText, isWhite;
  final Function validator, onSaved;

  _TextFormFieldColouredState(this.hintText, this.initialValue,
      this.obscureText, this.isWhite, this.validator, this.onSaved);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: isWhite
          ? Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: Theme.of(context).colorScheme.primary)
          : Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: Theme.of(context).colorScheme.secondary),
      validator: widget.validator,
      onSaved: widget.onSaved,
      cursorColor: isWhite
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).cursorColor,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
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

import 'package:flutter/material.dart';

class GeneralTitleText extends StatelessWidget {
  final String text;
  final isWhite;

  const GeneralTitleText({Key key, this.text, this.isWhite}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isWhite
          ? Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: Theme.of(context).colorScheme.primary)
          : Theme.of(context).textTheme.headline2,
    );
  }
}

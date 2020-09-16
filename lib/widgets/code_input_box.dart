import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeInputBox extends StatefulWidget {
  @required
  final String hintText;
  final Function validator, onSaved;

  const CodeInputBox({Key key, this.hintText, this.validator, this.onSaved})
      : super(key: key);
  @override
  _CodeInputBoxState createState() =>
      _CodeInputBoxState(this.hintText, this.validator, this.onSaved);
}

class _CodeInputBoxState extends State<CodeInputBox> {
  @required
  final String hintText;
  final Function validator, onSaved;

  _CodeInputBoxState(this.hintText, this.validator, this.onSaved);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 36.h,
        maxHeight: 484.h,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.h)),
        child: TextFormField(
          style: Theme.of(context).textTheme.headline4,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontSize: 12.ssp),
          ),
          minLines: 1,
          maxLines: 80,
          maxLengthEnforced: true,
          validator: validator,
          onSaved: onSaved,
        ),
      ),
    );
  }
}

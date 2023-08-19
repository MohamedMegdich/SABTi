import 'package:flutter/material.dart';
import 'dart:io';
import 'package:sabti/components/text_field_container.dart';
import 'package:sabti/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextFieldContainer(
      child: Container(
        child: TextField(
          onChanged: onChanged,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}


///
/// Project name : Umenoki
/// Description : The class is defined the custom input field for setting page.
/// Author : Xiao
/// Date : 2020-04-26
///

import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;
  final TextEditingController controller;
  final bool obscureText;
  final bool isReadOnly;

  InputField({
    this.label, this.content = '', this.controller, this.obscureText = false, this.isReadOnly = false
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top:5, bottom: 5),
          child: Row(
            children: <Widget>[
            Container(
              child: Text(
                "$label",
                textAlign: TextAlign.left,
                style: AppTheme.bodyText,
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 40.0,
              child: TextField(
                readOnly: isReadOnly,
                controller: controller,
                obscureText: obscureText,
                style: AppTheme.bodyText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(35.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                  filled: false,
                  hintText: "$content",
                ),
              ),
            ),
          ],
          ),
        );
      },
    );
  }
}

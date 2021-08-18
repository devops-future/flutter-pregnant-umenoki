import 'package:flutter/cupertino.dart';
///
/// Project name : Umenoki
/// Description : The class is defined the custom radio group button for setting page.
/// Author : Xiao
/// Date : 2020-04-26
///

import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';

class CustomRadioButton extends StatefulWidget {
  CustomRadioButton({
    this.buttonLabels,
    this.buttonValues,
    this.radioButtonValue,
    this.buttonColor,
    this.selectedColor,
    this.height = 40,
    this.width = 300,
    this.enableShape = false,
    this.status,
    this.elevation = 5,
    this.customShape,
    this.currentSelectedValue = '',
  })  : assert(buttonLabels.length == buttonValues.length),
        assert(buttonColor != null),
        assert(selectedColor != null);

  final List buttonValues;
  final double height;
  final double width;
  final String status;
  final List<String> buttonLabels;
  final Function(dynamic) radioButtonValue;
  final Color selectedColor;
  final Color buttonColor;
  final ShapeBorder customShape;
  final bool enableShape;
  final double elevation;
  final String currentSelectedValue;

  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int currentSelected = 0;
  String currentSelectedValue;
  Color skinButtonColor;
  Color skinSelectedColor;

  @override
  void initState() {
    super.initState();

    if(widget.currentSelectedValue.isEmpty){
      currentSelectedValue = widget.buttonValues[0];
    }else{
      currentSelectedValue = widget.currentSelectedValue;
    }
  }

  List<Widget> buildButtonsColumn() {
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonValues.length; index++) {
      var button = Expanded(
        // flex: 1,
        child: Card(
          color: currentSelectedValue == widget.buttonValues[index]
              ? widget.selectedColor
              : widget.buttonColor,
          elevation: widget.elevation,
          shape: widget.enableShape
              ? widget.customShape == null
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    )
                  : widget.customShape
              : null,
          child: Container(
            height: widget.height,
            child: MaterialButton(
              shape: widget.enableShape
                  ? widget.customShape == null
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                      : widget.customShape
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1),
                      borderRadius: BorderRadius.zero,
                    ),
              onPressed: () {
                widget.radioButtonValue(widget.buttonValues[index]);
                setState(() {
                  currentSelected = index;
                  currentSelectedValue = widget.buttonValues[index];
                });
              },
              child: Text(
                widget.buttonLabels[index],
                style: TextStyle(
                  color: currentSelectedValue == widget.buttonValues[index]
                      ? Colors.white
                      : Theme.of(context).textTheme.body1.color,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
        ),
      );
      buttons.add(button);
    }
    return buttons;
  }

  List<Widget> buildButtonsRow() {
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonLabels.length; index++) {
      var button = Expanded(
        //flex: 1,
        child: Card(
          color: currentSelectedValue == widget.buttonValues[index]
              ? widget.selectedColor
              : widget.buttonColor,
          elevation: widget.elevation,
          shape: widget.enableShape
              ? widget.customShape == null
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    )
                  : widget.customShape
              : null,
          child: Container(
            height: widget.height,
            // width: 200,
            constraints: BoxConstraints(maxWidth: 250),
            child: MaterialButton(
              shape: widget.enableShape
                  ? widget.customShape == null
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                      : widget.customShape
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1),
                      borderRadius: BorderRadius.zero,
                    ),
              onPressed: () {
                widget.radioButtonValue(widget.buttonValues[index]);
                setState(() {
                  currentSelected = index;
                  currentSelectedValue = widget.buttonValues[index];
                });
              },
              child: Text(
                widget.buttonLabels[index],
                style: TextStyle(
                  color: currentSelectedValue == widget.buttonValues[index]
                      ? Colors.white
                      : Theme.of(context).textTheme.body1.color,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
        ),
      );
      buttons.add(button);
    }
    return buttons;
  }

  List<Widget> buildButtonsSkin(){
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonLabels.length; index++) {
      if(index == 0){
        skinButtonColor = Colors.white;
        skinSelectedColor = AppTheme.nearlyWhite;
      }else if(index == 1){
        skinButtonColor = AppTheme.nearlyBrown;
        skinSelectedColor = AppTheme.nearlyBrown;
      }else{
        skinButtonColor = AppTheme.nearlyBlack;
        skinSelectedColor = AppTheme.nearlyBlack;
      }
      var button = Expanded(
        child: Column(
          children: <Widget>[
            Card(
              color: currentSelectedValue == widget.buttonValues[index]
                  ? skinSelectedColor
                  : skinButtonColor,
              elevation: widget.elevation,
              shape: widget.enableShape
                  ? widget.customShape == null
                      ? RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        )
                      : widget.customShape
                  : null,
              child: Container(
                height: widget.height,
                padding: const EdgeInsets.only(left: 0),
                width: 55,
                constraints: BoxConstraints(maxWidth: 250),
                child: MaterialButton(
                  shape: widget.enableShape
                      ? widget.customShape == null
                          ? OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: currentSelectedValue == widget.buttonValues[index] ? 3.5 : 1),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            )
                          : widget.customShape
                      : OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.zero,
                        ),
                  onPressed: () {
                    widget.radioButtonValue(widget.buttonValues[index]);
                    setState(() {
                      currentSelected = index;
                      currentSelectedValue = widget.buttonValues[index];
                    });
                  },
                  child: Text(
                    widget.buttonLabels[index],
                    style: TextStyle(
                      color: currentSelectedValue == widget.buttonValues[index]
                          ? Colors.white
                          : Theme.of(context).textTheme.body1.color,
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      buttons.add(button);
    }
    return buttons;
  }

  List<Widget> buildButtonsWrap(){
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonLabels.length; index++) {
      var button = Column(
        children: <Widget>[
          Card(
            color: currentSelectedValue == widget.buttonValues[index]
                ? widget.selectedColor
                : widget.buttonColor,
            elevation: widget.elevation,
            shape: widget.enableShape
                ? widget.customShape == null
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      )
                    : widget.customShape
                : null,
            child: Container(
              height: widget.height,
              padding: const EdgeInsets.only(left: 0),
              // width: 200,
              constraints: BoxConstraints(maxWidth: 250),
              child: MaterialButton(
                shape: widget.enableShape
                    ? widget.customShape == null
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )
                        : widget.customShape
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1),
                        borderRadius: BorderRadius.zero,
                      ),
                onPressed: () {
                  widget.radioButtonValue(widget.buttonValues[index]);
                  setState(() {
                    currentSelected = index;
                    currentSelectedValue = widget.buttonValues[index];
                  });
                },
                child: Text(
                  widget.buttonLabels[index],
                  style: TextStyle(
                    color: currentSelectedValue == widget.buttonValues[index]
                        ? Colors.white
                        : Theme.of(context).textTheme.body1.color,
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),
          ),
        ],
      );
      buttons.add(button);
    }
    return buttons;
  }

  Widget switchCase(){
    switch (widget.status) {
      case "column":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: buildButtonsColumn(),
        );
        break;
      case "skin":
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildButtonsSkin(),
        );
        break;
      case "wrap":
        return Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 5.0,
          children: buildButtonsWrap(),
        );
        break;
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildButtonsRow(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.status == "horizontal"
          ? widget.height * (widget.buttonLabels.length + 0.5)
          : null,
      child: Center(
        child: switchCase(),
      ),
    );
  }
}

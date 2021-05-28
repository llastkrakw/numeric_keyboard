library numeric_keyboard;

import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  /// Font size off buttons [default = 26]
  final double fontSize;

  /// Main axis size [default = MainAxisAlignment.max]
  final MainAxisSize mainAxisSize;

  NumericKeyboard(
      {Key? key,
      required this.onKeyboardTap,
      this.textColor = Colors.black,
      this.rightButtonFn,
      this.rightIcon,
      this.leftButtonFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly, this.fontSize = 26, this.mainAxisSize = MainAxisSize.max})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 20),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ButtonBar(
              alignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              children: <Widget>[
                _calcButton('1', widget.fontSize),
                _calcButton('2', widget.fontSize),
                _calcButton('3', widget.fontSize),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ButtonBar(
              alignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              children: <Widget>[
                _calcButton('4', widget.fontSize),
                _calcButton('5', widget.fontSize),
                _calcButton('6', widget.fontSize),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ButtonBar(
              alignment: widget.mainAxisAlignment,
              mainAxisSize:widget.mainAxisSize,
              children: <Widget>[
                _calcButton('7', widget.fontSize),
                _calcButton('8', widget.fontSize),
                _calcButton('9', widget.fontSize),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ButtonBar(
              alignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              children: <Widget>[
                InkWell(
                    borderRadius: BorderRadius.circular(45),
                    onTap: widget.leftButtonFn,
                    child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: widget.leftIcon)),
                _calcButton('0', widget.fontSize),
                InkWell(
                    borderRadius: BorderRadius.circular(45),
                    onTap: widget.rightButtonFn,
                    child: Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: widget.rightIcon))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value, double fontSize) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: Text(
            value,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: widget.textColor),
          ),
        ));
  }
}

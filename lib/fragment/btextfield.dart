import 'package:flutter/material.dart';
import 'package:kampungku/utils/colorapp.dart';

class BTextfield extends StatefulWidget {
  final BorderRadius cornerRadius;
  final double width, height, wordSpacing;
  final Color backgroundColor, accentColor, textColor;
  final String placeholder, fontFamily;
  final Icon prefixIcon, suffixIcon;
  final TextInputType inputType;
  final EdgeInsets margin;
  final Duration duration;
  final VoidCallback onClickSuffix;
  final TextBaseline textBaseline;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final bool autofocus, autocorrect, enabled, obscureText, isShadow;
  final FocusNode focusNode;
  final int maxLength, minLines, maxLines;
  final ValueChanged<String> onChanged, onSubmitted;
  final GestureTapCallback onTap;
  final TextEditingController controller;

  const BTextfield(
      {@required this.width,
        @required this.height,
        @required this.prefixIcon,
        @required this.inputType,
        this.controller,
        this.suffixIcon,
        this.duration = const Duration(milliseconds: 500),
        this.margin = const EdgeInsets.all(10),
        this.obscureText = false,
        this.backgroundColor = const Color(0xff111823),
        this.cornerRadius = const BorderRadius.all(Radius.circular(10)),
        this.textColor = const Color(0xff5c5bb0),
        this.accentColor = Colors.white,
        this.placeholder = "Placeholder",
        this.isShadow = true,
        this.onClickSuffix,
        this.wordSpacing,
        this.textBaseline,
        this.fontFamily,
        this.fontStyle,
        this.fontWeight,
        this.autofocus = false,
        this.autocorrect = false,
        this.focusNode,
        this.enabled = true,
        this.maxLength,
        this.maxLines,
        this.minLines,
        this.onChanged,
        this.onTap,
        this.onSubmitted})
      : assert(width != null),
        assert(height != null),
        assert(prefixIcon != null),
        assert(inputType != null);

  @override
  _BTextfieldState createState() => _BTextfieldState();
}

class _BTextfieldState extends State<BTextfield> {
  bool isFocus = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          boxShadow: widget.isShadow
              ? [BoxShadow(color: ColorApp.primaryaccent.withOpacity(0.1), blurRadius: 2, spreadRadius: 1)]
              : BoxShadow(spreadRadius: 0, blurRadius: 0),
          borderRadius: widget.cornerRadius,
        border: Border.all(color: ColorApp.primaryaccent,width: 0.5),
//          color: widget.suffixIcon == null
//              ? isFocus ? widget.accentColor : widget.backgroundColor
//              : widget.backgroundColor
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          widget.suffixIcon == null
              ? Container()
              : Align(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
              width: isFocus ? 500 : 40,
              height: isFocus ? widget.height : 40,
              margin: EdgeInsets.only(right: isFocus ? 0 : 7),
              duration: widget.duration,
              decoration: BoxDecoration(
                borderRadius: isFocus
                    ? widget.cornerRadius
                    : BorderRadius.all(Radius.circular(60)),
                color: widget.accentColor,
              ),
            ),
          ),
          widget.suffixIcon == null
              ? Container()
              : GestureDetector(
            onTap: () {
              setState(() {
                isFocus ? isFocus = false : isFocus = true;
                if (widget.onClickSuffix != null) {
                  widget.onClickSuffix();
                }
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              alignment: Alignment.centerRight,
              child: Icon(
                widget.suffixIcon.icon,
                color: Colors.black54,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    widget.prefixIcon.icon,
                    color: Colors.black54,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.only(right: 50, top: 0),
                    child: TextField(
                      controller: widget.controller,
                      cursorWidth: 2,
                      obscureText: widget.obscureText,
                      keyboardType: widget.inputType,
                      style: TextStyle(
                        fontFamily: widget.fontFamily,
                        fontStyle: widget.fontStyle,
                        fontWeight: widget.fontWeight,
                        wordSpacing: widget.wordSpacing,
                        textBaseline: widget.textBaseline,
                        fontSize: 14,
                        letterSpacing: 0,
                        color: widget.textColor,
                      ),
                      autofocus: widget.autofocus,
                      autocorrect: widget.autocorrect,
                      focusNode: widget.focusNode,
                      enabled: widget.enabled,
                      maxLength: widget.maxLength,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      onChanged: widget.onChanged,
                      onTap: () {
                        setState(() {
                          isFocus = true;
                        });
                        if (widget.onTap != null) {
                          widget.onTap();
                        }
                      },
                      onSubmitted: (t) {
                        setState(() {
                          isFocus = false;
                        });
                        widget.onSubmitted(t);
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black54,fontStyle: FontStyle.italic,fontSize: 14),
                          hintText: widget.placeholder,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      duration: widget.duration,
    );
  }
}
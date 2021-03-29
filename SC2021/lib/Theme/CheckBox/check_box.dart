import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox(this.icon,this.label,
      {Key key,
        @required this.onSelect,
        this.selectedBackgroundColor,
        this.notSelectedBackgroundColor,
        this.selectedTextColor,
        this.notSelectedTextColor,
        this.height,
        this.width})
      : super(key: key);

  final IconData icon;
  final String label;
  final ValueChanged<bool> onSelect;
  final Color selectedBackgroundColor;
  final Color selectedTextColor;
  final Color notSelectedBackgroundColor;
  final Color notSelectedTextColor;
  final double height;
  final double width;

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _selected = true;

  void _onTap() {
    setState(() {
      _selected = !_selected;
    });
    widget.onSelect(_selected);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    Color backgroundColor = _selected
        ? (widget.selectedBackgroundColor == null
        ? _theme.primaryColorDark
        : widget.selectedBackgroundColor)
        : (widget.notSelectedBackgroundColor == null
        ? _theme.primaryColorDark
        : widget.notSelectedBackgroundColor);
    Color textColor = _selected
        ? (widget.selectedTextColor == null
        ? Colors.white
        : widget.selectedTextColor)
        : (widget.notSelectedTextColor == null
        ? Colors.white
        : widget.notSelectedTextColor);
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      width: widget.width == null ? 100 : widget.width,
      height: widget.height == null ? 100 : widget.height,
      child: FlatButton(
        textColor: textColor,
        onPressed: (){
          _onTap();
        },
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Icon(
                widget.icon,
                size: 35,
                color: Colors.white,
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: Center(child: Text(widget.label, textAlign: TextAlign.center, style: TextStyle(fontSize: 13),)),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';


class SwitchButton extends StatefulWidget {

  const SwitchButton(
      { Key key,
        this.arrays,
        this.themeColor = LightColors.primary,
        this.unselbgColor = Colors.white,
        this.selTextColor = Colors.white,
        this.unselTextColor =  const Color(0xFF929292),
        this.height = 40.0,
        this.callback,
        this.index = 0
      }) : super(key: key);

  final List<String> arrays;
  final Color themeColor;
  final Color unselbgColor;
  final Color selTextColor;
  final Color unselTextColor;
  final double height;
  final SelectedItemCallback callback;
  final int index;

  @override
  _SwitchButtonState createState() => new _SwitchButtonState(
      arrays: this.arrays,
      height: this.height,
      selbgColor: this.themeColor,
      unselbgColor: this.unselbgColor,
      selTextColor: this.selTextColor,
      unselTextColor: this.unselTextColor,
      callback: this.callback,
      selIndex: this.index
  );


}

//选项卡回调
typedef void SelectedItemCallback(var index,String title);



class _SwitchButtonState extends State<SwitchButton>{
  final List<String> arrays;
  final Color selbgColor;
  final Color unselbgColor;
  final Color selTextColor;
  final Color unselTextColor;
  final double height;
  final SelectedItemCallback callback;

  int selIndex;

  static Radius _radius = new Radius.circular(5.0);
  static Radius _zeroRadius = new Radius.circular(0.0);

  _SwitchButtonState(
      {
        this.arrays,
        this.height,
        this.selbgColor,
        this.unselbgColor,
        this.selTextColor,
        this.unselTextColor,
        this.callback,
        this.selIndex
      }
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Container(
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: getItems()
        )
    );
  }

  List<Widget> getItems(){
    List<Widget> widgets = new List();
    for (var i = 0; i < arrays.length; i++) {
      if (i == 0 || i == arrays.length-1) {
        widgets.add(
          new Expanded(
            child: new GestureDetector(
              onTap: (){
                setState((){
                  if (selIndex == i) {
                    return;
                  }
                  selIndex = i;
                  this.callback(i,arrays[i]);
                });
              },
              child: new Container(
                decoration: new BoxDecoration(
                  color: selIndex == i ? selbgColor : unselbgColor,
                  border: new Border.all(
                      width: 1.0,
                      color: selbgColor
                  ),
                  borderRadius: new BorderRadius.only(
                    topLeft: i == 0 ? _radius : _zeroRadius ,
                    bottomLeft: i == 0 ? _radius : _zeroRadius,
                    topRight: i == arrays.length-1 ? _radius : _zeroRadius,
                    bottomRight: i == arrays.length-1 ? _radius : _zeroRadius,
                  ),
                ),
                height: height,
                child: new Center(
                  child: new Text(
                    arrays[i],
                    style: new TextStyle(
                        color: selIndex == i ? selTextColor : unselTextColor,
                        fontSize: 12.0
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }else{
        widgets.add(
          new Expanded(
            child: new GestureDetector(
              onTap: (){
                setState((){
                  if (selIndex == i) {
                    return;
                  }
                  selIndex = i;
                  this.callback(i,arrays[i]);
                });
              },
              child: new Container(

                decoration: new BoxDecoration(
                  color: selIndex == i ? selbgColor : unselbgColor,
                  border: new Border(
                      top: BorderSide(
                          width: 1.0,
                          color: selbgColor
                      ),
                      bottom: BorderSide(
                          width: 1.0,
                          color: selbgColor
                      ),
                      right: BorderSide(
                          width: i == arrays.length-2 ? 0.0 : 0.5,
                          color: selbgColor
                      ),
                      left: BorderSide(
                          width: i == 1 ? 0.0 : 0.5,
                          color: selbgColor
                      )
                  ),
                ),
                height: height,
                child: new Center(
                  child: new Text(
                    arrays[i],
                    style: new TextStyle(
                        color: selIndex == i ? selTextColor : unselTextColor,
                        fontSize: 10.0
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    return widgets;
  }
}
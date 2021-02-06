import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String hint;
  final Widget widget;

  const InputField(
      {@required this.title,
      this.controller,
      @required this.hint,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 14.0),
              height: 52,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      readOnly: widget == null ? false : true,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hint,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget == null ? Container() : widget,
                ],
              ),
            )
          ],
        ));
  }
}

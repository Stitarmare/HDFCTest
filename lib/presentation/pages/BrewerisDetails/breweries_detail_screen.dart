import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowWidget extends StatelessWidget {
  final String title;
  final String value;
  RowWidget({this.title, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Text("-"),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ))
        ],
      ),
    );
  }
}

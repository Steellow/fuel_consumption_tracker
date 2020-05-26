import 'package:flutter/material.dart';

class CenterIcon extends StatelessWidget {
  final Icon icon;

  CenterIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(left: 6),
      child: icon,
    );
  }
}
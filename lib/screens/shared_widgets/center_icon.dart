import 'package:flutter/material.dart';

class CenterIcon extends StatelessWidget {
  final Icon icon;

  CenterIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    // ListTile icons are never centered for some reason, this container (should) fix it
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(left: 6),
      child: icon,
    );
  }
}
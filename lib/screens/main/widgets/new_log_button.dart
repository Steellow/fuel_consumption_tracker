import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';

class NewLogButton extends StatefulWidget {
  @override
  _NewLogButtonState createState() => _NewLogButtonState();
}

class _NewLogButtonState extends State<NewLogButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: RaisedButton(
        shape: Styles.roundShape,
        color: Colors.white,
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.all(12),
          child: Text('New Log', style: Styles.whiteBold.copyWith(color: Colors.indigo)),
        ),
      ),
    );
  }
}

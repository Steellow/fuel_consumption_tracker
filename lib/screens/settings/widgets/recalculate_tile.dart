import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';

class RecalculateTile extends StatefulWidget {
  @override
  _RecalculateTileState createState() => _RecalculateTileState();
}

class _RecalculateTileState extends State<RecalculateTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CenterIcon(
        Icon(Icons.refresh),
      ),
      title: Text("Refresh stats"),
      subtitle: Text("Recalculate total fuel & average consumption"),
    );
  }
}

import 'package:flutter/material.dart';

import 'widgets/history_list_view.dart';
import 'widgets/title_bar.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleBar(),
          HistoryListView(),
        ],
      ),
    );
  }
}

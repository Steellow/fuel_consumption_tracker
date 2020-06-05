import 'package:flutter/material.dart';

import 'widgets/edit_tip_text.dart';
import 'widgets/history_list_view.dart';
import 'widgets/title_bar.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          EditTipText(),
          Column(
            children: [
              TitleBar(),
              HistoryListView(),
            ],
          ),
        ],
      ),
    );
  }
}

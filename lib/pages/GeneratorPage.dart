import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppState.dart';
import '../widgets/BigCard.dart';
import '../widgets/HistoryList.dart';
import '../widgets/LikeButton.dart';
import '../widgets/NextButton.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryList(),
          ),
          SizedBox(height: 10),
          BigCard(pair: pair),
          SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LikeButton(appState: appState),
              SizedBox(width: 10),
              NextButton(appState: appState),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

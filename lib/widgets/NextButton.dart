import 'package:flutter/material.dart';

import '../AppState.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        appState.getNext();
      },
      child: Text('Next'),
    );
  }
}
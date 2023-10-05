import 'package:flutter/material.dart';

import '../AppState.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        appState.toggleFavorite();
      },
      icon: Icon(getIcon()),
      label: Text('Like'),
    );
  }

  IconData getIcon() {
    if(appState.currentIsFavorite) {
      return Icons.favorite;
    } else {
      return Icons.favorite_border;
    }
  }
}
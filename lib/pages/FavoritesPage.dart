import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppState.dart';

class FavoritesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var theme = Theme.of(context);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have ${appState.favorites.length} favorites:'),
          ),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 400.0,
              childAspectRatio: 400 / 80,
              children: [
                for(var favorite in appState.favorites)
                  ListTile(
                    leading: IconButton(
                        icon: Icon(Icons.delete, semanticLabel: "Delete"),
                        color: theme.colorScheme.primary,
                        onPressed: () {
                          appState.remove(favorite);
                        },
                      ),
                    title: Text(favorite.asString, textScaleFactor: 1,),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
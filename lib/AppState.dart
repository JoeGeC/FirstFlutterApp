import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];
  var history = <WordPair>[];
  GlobalKey? historyListKey;

  bool get currentIsFavorite => favorites.contains(current);

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite([WordPair? wordPair]){
    wordPair = wordPair ?? current;
    if(isFavorite(wordPair)) {
      favorites.remove(wordPair);
    } else {
      favorites.add(wordPair);
    }
    notifyListeners();
  }

  void remove(WordPair favorite) {
    favorites.remove(favorite);
    notifyListeners();
  }

  bool isFavorite(WordPair wordPair) => favorites.contains(wordPair);
}
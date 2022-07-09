import 'package:flutter/cupertino.dart';
class FavoriteController {
  ValueNotifier<bool> isFavorite$ = ValueNotifier<bool>(false);
  bool get isFavorite => isFavorite$.value;
  void toggleFavorite() => isFavorite$.value = !isFavorite$.value;
}
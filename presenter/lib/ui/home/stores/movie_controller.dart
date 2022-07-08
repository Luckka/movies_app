import 'package:flutter/material.dart';
import 'package:presenter/presenter.dart';


class MovieController {
  final GetMoviesUsecase _getMoviesUsecase;

  MovieController(this._getMoviesUsecase) {
    fetch();
  }

  ValueNotifier<MoviesEntity?> movies = ValueNotifier<MoviesEntity?>(null);
  MoviesEntity? _cachedMovies;

  onChanged(String value) {
    List<MovieDetails> list = _cachedMovies!.listMovies
        .where(
          (e) => e.toString().toLowerCase().contains((value.toLowerCase())),
        )
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }
 fetch() async {
    var result = await _getMoviesUsecase();

    result.fold(
      (error) => debugPrint(error.toString()),
      (success) => movies.value = success,
    );

    _cachedMovies = movies.value;
  }
}
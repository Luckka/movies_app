import 'package:flutter/cupertino.dart';

import '../../domain/entities/movie_details_entity.dart';

class MovieDetailDto extends MovieDetails with ChangeNotifier {
  MovieDetailDto(
      {required super.adult,
      required super.backdropPath,
      required super.genreIds,
      required super.id,
      required super.mediaType,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.video,
      required super.voteAverage,
      required super.voteCount});

  Map toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'media_type': mediaType,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  static MovieDetails fromJson(Map json) {
    return MovieDetails(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genreIds: List.castFrom<dynamic, int>(json['genre_ids']),
        id: json['id'],
        mediaType: json['media_type'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count']);
  }

  static MovieDetailDto fromEntity(MovieDetails movieDetails) {
    return MovieDetailDto(
        adult: movieDetails.adult,
        backdropPath: movieDetails.backdropPath,
        genreIds: movieDetails.genreIds,
        id: movieDetails.id,
        mediaType: movieDetails.mediaType,
        originalLanguage: movieDetails.originalLanguage,
        originalTitle: movieDetails.originalTitle,
        overview: movieDetails.overview,
        popularity: movieDetails.popularity,
        posterPath: movieDetails.posterPath,
        releaseDate: movieDetails.releaseDate,
        title: movieDetails.title,
        video: movieDetails.video,
        voteAverage: movieDetails.voteAverage,
        voteCount: movieDetails.voteCount);
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

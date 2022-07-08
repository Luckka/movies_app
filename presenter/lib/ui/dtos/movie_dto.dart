import '../../dependencies/dependencies.dart';

extension MoviePresenterDto on MoviesEntity {
  MoviesEntity copyWith({
    List<MovieDetails>? listMovies,
  }) {
    return MoviesEntity(
      averageRating: averageRating,
      backdropPath: backdropPath,
      description: description,
      id: id,
      iso_3166_1: iso_3166_1,
      iso_639_1: iso_639_1,
      name: name,
      page: page,
      posterPath: posterPath,
      public: public,
      listMovies: listMovies ?? this.listMovies,
      revenue: revenue,
      runtime: runtime,
      sortBy: sortBy,
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}
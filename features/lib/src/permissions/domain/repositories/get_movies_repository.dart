import '../../../../dependencies/dependencies.dart';
import '../entities/movie_entity.dart';

abstract class GetMoviesRepository {
  Future<Either<Exception, MoviesEntity>> call();
}
import '../../../../dependencies/dependencies.dart';
import '../../domain/entities/movie_entity.dart';

abstract class GetMoviesDataSource {
   Future<Either<Exception, MoviesEntity>> call();
}
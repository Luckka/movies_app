import '../../../../features.dart';


abstract class GetMoviesUsecase {
  Future<Either<Exception, MoviesEntity>> call();
}
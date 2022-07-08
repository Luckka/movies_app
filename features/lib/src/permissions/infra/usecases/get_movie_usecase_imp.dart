import 'package:features/src/permissions/domain/entities/movie_entity.dart';
import 'package:features/src/permissions/domain/repositories/get_movies_repository.dart';
import '../../../../dependencies/dependencies.dart';
import '../../domain/usecases/get_movie_usecase.dart';

class GetMoviesUsecaseImp implements GetMoviesUsecase{ 
  final GetMoviesRepository _getMoviesRepository;

  GetMoviesUsecaseImp(this._getMoviesRepository);

  @override
  Future<Either<Exception, MoviesEntity>> call() async{
    return await _getMoviesRepository();
  }
 
}
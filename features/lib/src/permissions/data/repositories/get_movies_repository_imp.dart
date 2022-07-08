import 'package:features/src/permissions/domain/entities/movie_entity.dart';
import 'package:features/src/permissions/domain/repositories/get_movies_repository.dart';

import '../../../../dependencies/dependencies.dart';
import '../datasources/get_movies_datasource.dart';

class GetMoviesRepositoryImp implements GetMoviesRepository{
  
  final GetMoviesDataSource _getMoviesDataSource;

  GetMoviesRepositoryImp(this._getMoviesDataSource);

  
  
  @override
  Future<Either<Exception, MoviesEntity>> call() async{
    return await _getMoviesDataSource();
  }
  
}
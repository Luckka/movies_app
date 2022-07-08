import 'package:core/core.dart';
import 'package:features/src/permissions/data/datasources/get_movies_datasource.dart';
import 'package:features/src/permissions/domain/entities/movie_entity.dart';

import '../dtos/movie_dto.dart';
class GetMoviesRemoteDatasourceImp implements GetMoviesDataSource{

  final DioService _dioService;

  GetMoviesRemoteDatasourceImp(this._dioService);
  
  @override
  Future<Either<Exception,MoviesEntity>> call() async{
    try{
      await Future.delayed(const Duration(seconds: 3));
      var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
      return Right(MovieDto.fromJson(result.data));
    }catch(e){
      return Left(Exception('Falha no datasource'));
    }
  }
  
}
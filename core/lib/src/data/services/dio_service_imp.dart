import '../../../../core.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/4/', headers: {
      'content-type': 'application/json;charset=utf-8',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYjc4YmU3NmVlOWMzYzMyNWUzMTFlYWZhNzZlNjNmNyIsInN1YiI6IjYyMWY5Y2M0MDU4MjI0MDA2YzQ2MDFjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.f332vpucRBSJ3bZ8hMMWrWhNBQuyDvHFnH5t_rXNVIM'
    }));
  }
}
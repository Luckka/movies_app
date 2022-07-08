
import 'package:presenter/dependencies/dependencies.dart';
import 'screens/screens.dart';
import 'stores/stores.dart';
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => MovieController(i())),
    Bind.singleton((i) => GetMoviesUsecaseImp(i())),
    Bind.singleton((i) => GetMoviesRepositoryImp(i())),
    Bind.singleton((i) => GetMoviesRemoteDatasourceImp(i())),
    Bind.singleton((i) => DioServiceImp()),
    Bind.singleton((i) => FavoriteController()),

    
  ];


  @override
  final List<ModularRoute>  routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
import 'package:features/features.dart';
import '../../ui.dart';


class AppModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => Dio()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/details/', module: DetailsModule())
    
  ];
}
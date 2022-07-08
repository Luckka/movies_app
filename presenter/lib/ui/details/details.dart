import 'package:presenter/dependencies/dependencies.dart';
import 'package:presenter/ui/details/screens/details_page.dart';


class DetailsModule extends Module {
  @override
  final List<Bind> binds = [
    
  ];

   @override
  final List<ModularRoute>  routes = [
    ChildRoute('/details/:movie', child: (_, args) =>  DetailsPage(movie: args.params['movie'],)),
  ];
}
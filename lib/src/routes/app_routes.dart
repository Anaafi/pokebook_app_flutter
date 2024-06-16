import 'package:auto_route/auto_route.dart';
import 'package:pokebook_app/src/routes/app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: PokemonListRoute.page),
      ];
}

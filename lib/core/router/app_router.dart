import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app_router.gr.dart';

final routerProvider = Provider<AppRouter>((_) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, initial: true),
        AutoRoute(
          page: BottomNavBarRoute.page,
          children: [
            AutoRoute(page: PokemonListRoute.page),
            AutoRoute(page: FavouritePokemonsRoute.page),
          ],
        ),
        AutoRoute(page: PokemonDetailsRoute.page)
      ];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart'
    as _i8;
import 'package:pokedex_case_study/view/bottom_nav_bar/bottom_navbar_view.dart'
    as _i1;
import 'package:pokedex_case_study/view/favourite_pokemons/favourite_pokemons_view.dart'
    as _i2;
import 'package:pokedex_case_study/view/pokemon_details/pokemon_details_view.dart'
    as _i3;
import 'package:pokedex_case_study/view/pokemon_list/pokemon_list_view.dart'
    as _i4;
import 'package:pokedex_case_study/view/splash/splash_screen_view.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BottomNavBarRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavBarView(),
      );
    },
    FavouritePokemonsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavouritePokemonsView(),
      );
    },
    PokemonDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailsRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PokemonDetailsView(
          key: args.key,
          pokemon: args.pokemon,
        ),
      );
    },
    PokemonListRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PokemonListView(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreenView(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomNavBarView]
class BottomNavBarRoute extends _i6.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavouritePokemonsView]
class FavouritePokemonsRoute extends _i6.PageRouteInfo<void> {
  const FavouritePokemonsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FavouritePokemonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouritePokemonsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PokemonDetailsView]
class PokemonDetailsRoute extends _i6.PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({
    _i7.Key? key,
    required _i8.Pokemon pokemon,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PokemonDetailsRoute.name,
          args: PokemonDetailsRouteArgs(
            key: key,
            pokemon: pokemon,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailsRoute';

  static const _i6.PageInfo<PokemonDetailsRouteArgs> page =
      _i6.PageInfo<PokemonDetailsRouteArgs>(name);
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({
    this.key,
    required this.pokemon,
  });

  final _i7.Key? key;

  final _i8.Pokemon pokemon;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{key: $key, pokemon: $pokemon}';
  }
}

/// generated route for
/// [_i4.PokemonListView]
class PokemonListRoute extends _i6.PageRouteInfo<void> {
  const PokemonListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PokemonListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonListRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreenView]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

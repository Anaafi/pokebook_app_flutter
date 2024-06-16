// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:pokebook_app/src/screens/detail_screen/pokemon_details_screen.dart'
    as _i2;
import 'package:pokebook_app/src/screens/home_screen/view/home_screen.dart'
    as _i1;
import 'package:pokebook_app/src/screens/pokeman_list_screen/model/pokemon_list_model.dart'
    as _i6;
import 'package:pokebook_app/src/screens/pokeman_list_screen/view/pokeman_list_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    PokemonDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PokemonDetailsScreen(
          key: args.key,
          pokemon: args.pokemon,
        ),
      );
    },
    PokemonListRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PokemonListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PokemonDetailsScreen]
class PokemonDetailsRoute extends _i4.PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({
    _i5.Key? key,
    required _i6.Pokemon pokemon,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          PokemonDetailsRoute.name,
          args: PokemonDetailsRouteArgs(
            key: key,
            pokemon: pokemon,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailsRoute';

  static const _i4.PageInfo<PokemonDetailsRouteArgs> page =
      _i4.PageInfo<PokemonDetailsRouteArgs>(name);
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({
    this.key,
    required this.pokemon,
  });

  final _i5.Key? key;

  final _i6.Pokemon pokemon;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{key: $key, pokemon: $pokemon}';
  }
}

/// generated route for
/// [_i3.PokemonListScreen]
class PokemonListRoute extends _i4.PageRouteInfo<void> {
  const PokemonListRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PokemonListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonListRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_case_study/constants/asset_constants/asset_constants.dart';
import 'package:pokedex_case_study/core/router/app_router.gr.dart';
import 'package:pokedex_case_study/core/storage_manager/storage_manager.dart';

class FavouriteBadgeWidget extends ConsumerWidget {
  const FavouriteBadgeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favHiveBox = ref.watch(hiveStorageManagerProvider);

    return InkWell(
      onTap: () {
        context.router.push(
          const FavouritePokemonsRoute(),
        );
      },
      child: favHiveBox.whenOrNull(
            data: (data) {
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Badge.count(
                  count: data.length,
                  child: Image.asset(
                    AssetConstants.pokeball,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ) ??
          Image.asset(
            AssetConstants.pokeball,
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
    );
  }
}

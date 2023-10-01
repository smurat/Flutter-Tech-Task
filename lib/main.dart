import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_case_study/core/storage_manager/hive_initializer.dart';
import 'package:pokedex_case_study/core/router/app_router.dart';
import 'package:pokedex_case_study/utils/viewmodel_helpers/stete_logger.dart';

Future<void> main() async {
  HiveInitializer.initHiveDependencies();
  runApp(
    ProviderScope(
      observers: [StateLogger()],
      child: const PokemonApp(),
    ),
  );
}

class PokemonApp extends HookConsumerWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}

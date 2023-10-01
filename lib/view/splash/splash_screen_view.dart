import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_case_study/constants/asset_constants/asset_constants.dart';
import 'package:pokedex_case_study/core/router/app_router.gr.dart';

@RoutePage()
class SplashScreenView extends StatefulHookConsumerWidget {
  const SplashScreenView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends ConsumerState<SplashScreenView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 2000), () {
        context.replaceRoute(const BottomNavBarRoute());
      });
      return null;
    });
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: animationController.value,
              child: child,
            );
          },
          child: Image.asset(
            AssetConstants.pokedex,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

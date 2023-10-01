import 'package:flutter/material.dart';
import 'package:pokedex_case_study/model/pokemon/details/pokemon_details_model.dart';
import 'package:pokedex_case_study/utils/animations/fade_animation.dart';
import 'package:pokedex_case_study/utils/extensions/model_extension.dart';
import 'package:pokedex_case_study/view/pokemon_details/widgets/percentage_indicator.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({
    super.key,
    required this.data,
    required this.progressBarColor,
    this.backgroundColor,
  });

  final PokemonDetailsModel data;
  final Color? backgroundColor;
  final Color progressBarColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 20,
              children: data.types
                      ?.map(
                        (e) => FadeAmination(
                          delay: 0.35,
                          child: Chip(
                            backgroundColor: backgroundColor ?? const Color(0xFFB8DFCA),
                            label: Text(
                              e.type!.name!.capitalize,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                      )
                      .toList() ??
                  [],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FadeAmination(
                  delay: 0.4,
                  child: _detailsTile(
                    textStyle: theme.textTheme,
                    title: 'Height',
                    value: data.height?.toString() ?? '0',
                  ),
                ),
                FadeAmination(
                  delay: 0.55,
                  child: _detailsTile(
                    textStyle: theme.textTheme,
                    title: 'Weight',
                    value: data.weight?.toString() ?? '0',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              'Stats',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            for (int i = 0; i < data.stats!.length; i++)
              FadeAmination(
                delay: 0.45 + (i * 0.1),
                child: Builder(builder: (context) {
                  return PercentageIndicator(
                    percentage: data.stats?[i].baseStat ?? 0,
                    title: data.stats![i].stat!.subName!.toUpperCase(),
                    textStyle: theme.textTheme,
                    progressColor: progressBarColor,
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }

  Widget _detailsTile({
    required TextTheme textStyle,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: textStyle.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          title,
          style: textStyle.bodyLarge!.copyWith(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouriteButton extends ConsumerWidget {
  final bool isFavorite;
  final VoidCallback onPressed;
  const FavouriteButton({super.key, required this.isFavorite, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: onPressed,
    );
  }
}

import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.description, required this.onTap});

  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            const Icon(Icons.error_outline, size: 48),
            Text('Что-то пошло не так', style: textTheme.titleMedium),
            Text(
              description,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
            FilledButton(
              onPressed: onTap,
              child: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }
}

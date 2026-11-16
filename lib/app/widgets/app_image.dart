import 'package:flutter/material.dart';
import 'package:recipes_app/app/theme/theme.dart';

/// Изображение из сети со скруглёнными углами и заглушкой
/// на время загрузки или в случае ошибки.
class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.borderRadius = 16,
  });

  final String url;
  final double? width;
  final double? height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, progress) =>
            progress == null ? child : _placeholder(),
        errorBuilder: (_, __, ___) =>
            _placeholder(icon: Icons.image_not_supported_outlined),
      ),
    );
  }

  Widget _placeholder({IconData? icon}) {
    return Container(
      width: width,
      height: height,
      color: ThemeColors.placeholder,
      child: icon == null ? null : Icon(icon, color: ThemeColors.grey),
    );
  }
}

import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final double radius;
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData icon;

  const ImagePlaceholder({
    super.key,
    this.imagePath,
    this.width,
    this.height,
    this.radius = 25.0,
    this.backgroundColor,
    this.iconColor,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: imagePath != null
          ? ClipOval(
              child: Image.asset(
                imagePath!,
                width: width,
                height: height,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholder();
                },
              ),
            )
          : _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Icon(
      icon,
      color: iconColor ?? Colors.grey[600],
      size: (width != null ? width! : radius) * 0.6,
    );
  }
}

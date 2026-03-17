import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.lighterGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        // Adding fallback logic in case URL is null or invalid
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, color: Colors.grey),
              )
            : const Icon(Icons.image_not_supported, color: Colors.grey),
      ),
    );
  }
}

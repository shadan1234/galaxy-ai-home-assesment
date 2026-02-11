import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/entities/pin.dart';

class PinCard extends StatelessWidget {
  final Pin pin;

  const PinCard({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/pin/${pin.id}', extra: pin),
      onLongPress: () {
        HapticFeedback.lightImpact();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          color: Colors.grey[200], // Placeholder color
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'pin_${pin.id}',
              child: CachedNetworkImage(
                imageUrl: pin.src.medium ?? '', 
                fit: BoxFit.cover,
                placeholder: (context, url) => AspectRatio(
                  aspectRatio: (pin.width > 0 && pin.height > 0) 
                      ? pin.width / pin.height 
                      : 1.0,
                  child: Container(color: Colors.grey[300]),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  height: 200, 
                  child: Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            // Optional: Title or user info below image if design requires
          ],
        ),
      ),
    );
  }
}

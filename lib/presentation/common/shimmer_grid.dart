import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/utils/constants.dart';

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: AppConstants.defaultPadding,
        crossAxisSpacing: AppConstants.defaultPadding,
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: (index % 2 + 1) * 150.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppConstants.cardRadius),
            ),
          );
        },
      ),
    );
  }
}

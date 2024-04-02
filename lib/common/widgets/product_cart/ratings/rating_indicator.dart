import 'package:babyhub/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class BRatingBarIndicator extends StatelessWidget {
  const BRatingBarIndicator({
    super.key,
    required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: BabyHubColors.grey,
        itemBuilder: (_, __) => const Icon(
              Iconsax.star1,
              color: BabyHubColors.primary,
            ));
  }
}

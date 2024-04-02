import 'package:babyhub/common/widgets/images/b_circular_image.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BVerticalImageText extends StatelessWidget {
  const BVerticalImageText({
    super.key,
    required this.image,
    this.textColor = BabyHubColors.white,
    this.backgroundColor,
    this.onTap,
    required this.title,
    this.isNetworkImage = true,
  });

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: BabyHubSizes.spaceBtwItems),
        child: Column(
          children: [
            BCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: BabyHubSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              // overlayColor: dark ? BabyHubColors.light : BabyHubColors.dark,
            ),
            const SizedBox(height: BabyHubSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

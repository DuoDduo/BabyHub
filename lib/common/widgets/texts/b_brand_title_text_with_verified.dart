import 'package:babyhub/common/widgets/texts/b_brand_title_text.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/enums.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BBrandTitleWithVerifiedIcon extends StatelessWidget {
  const BBrandTitleWithVerifiedIcon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = BabyHubColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: BBrandTitleText(
                title: title,
                color: textColor,
                maxLines: maxLines,
                textAlign: textAlign,
                brandTextSize: brandTextSize)),
        const SizedBox(width: BabyHubSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: BabyHubSizes.iconXs)
      ],
    );
  }
}

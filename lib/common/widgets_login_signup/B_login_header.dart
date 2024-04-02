import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BLoginHeader extends StatelessWidget {
  const BLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          height: 150,
          image: AssetImage(BabyHubImages.darkAppLogo),
        ),
        Text(BabyHubTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium!.apply(
                  color: dark ? BabyHubColors.primary : BabyHubColors.primary,
                  decorationColor:
                      dark ? BabyHubColors.white : BabyHubColors.primary,
                )),
        const SizedBox(height: BabyHubSizes.sm),
        Text(
          BabyHubTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}

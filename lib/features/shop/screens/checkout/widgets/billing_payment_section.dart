import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BBillingPaymentSection extends StatelessWidget {
  const BBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        BSectionHeading(
          title: " Payment Method",
          buttonTitle: " Change",
          onPressed: () {},
          showActionButton: true,
        ),
        const SizedBox(
          height: BabyHubSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            BRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: BHelperFunctions.isDarkMode(context)
                  ? BabyHubColors.light
                  : BabyHubColors.white,
              padding: const EdgeInsets.all(BabyHubSizes.sm),
              child: const Image(
                image: AssetImage(BabyHubImages.huggies),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: BabyHubSizes.spaceBtwItems / 2,
            ),
            Text(
              " Paypal",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}

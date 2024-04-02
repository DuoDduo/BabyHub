import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BOrderListItems extends StatelessWidget {
  const BOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(
        height: BabyHubSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => BRoundedContainer(
        padding: const EdgeInsets.all(BabyHubSizes.md),
        showBorder: true,
        backgroundColor: dark ? BabyHubColors.dark : BabyHubColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: BabyHubSizes.spaceBtwItems / 2,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Processing",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: BabyHubColors.primary, fontWeightDelta: 1),
                      ),
                      Text(" 20 Mar 2024",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                      size: BabyHubSizes.iconSm,
                    ))
              ],
            ),
            const SizedBox(
              height: BabyHubSizes.spaceBtwItems,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: BabyHubSizes.spaceBtwItems / 2,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Order",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(" [#24653]",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: BabyHubSizes.spaceBtwItems / 2,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(" 30 Mar 2024",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

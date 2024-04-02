import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BSingleAddress extends StatelessWidget {
  const BSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);

    return BRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(BabyHubSizes.md),
      backgroundColor: selectedAddress
          ? BabyHubColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? BabyHubColors.primary
              : BabyHubColors.grey,
      margin: const EdgeInsets.only(bottom: BabyHubSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? BabyHubColors.light
                        : BabyHubColors.dark.withOpacity(0.6)
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " John Doe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: BabyHubSizes.sm / 2),
              Text(
                "(+234 908 1234 6890)",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: BabyHubSizes.sm / 2),
              const Text(
                " 0490 Cairo England, Anderson Street, 944, USA",
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}

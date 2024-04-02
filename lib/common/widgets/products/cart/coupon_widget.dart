import 'package:babyhub/common/styles/rounded_container.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BCouponCode extends StatelessWidget {
  const BCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return BRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? BabyHubColors.dark : BabyHubColors.white,
      padding: const EdgeInsets.only(
          top: BabyHubSizes.sm,
          bottom: BabyHubSizes.sm,
          right: BabyHubSizes.sm,
          left: BabyHubSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: " Got a promo code ? use now",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: dark
                          ? BabyHubColors.white.withOpacity(0.5)
                          : BabyHubColors.dark.withOpacity(0.5),
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      side: BorderSide(color: Colors.grey.withOpacity(0.1))),
                  onPressed: () {},
                  child: const Text(" Apply")))
        ],
      ),
    );
  }
}

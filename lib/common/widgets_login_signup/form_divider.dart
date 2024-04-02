import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BFormDivider extends StatelessWidget {
  const BFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? BabyHubColors.primary : BabyHubColors.primary,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
          color: dark ? BabyHubColors.primary : BabyHubColors.primary,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        ))
      ],
    );
  }
}

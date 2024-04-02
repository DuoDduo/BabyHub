import 'package:babyhub/common/widgets/images/b_circular_image.dart';
import 'package:babyhub/features/personalization/controllers/user_controller.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BUserProfileTitle extends StatelessWidget {
  const BUserProfileTitle({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const BCircularImage(
        image: BabyHubImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: BabyHubColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: BabyHubColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: BabyHubColors.white,
        ),
      ),
    );
  }
}

import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/images/b_circular_image.dart';
import 'package:babyhub/common/widgets/texts/section_heading.dart';
import 'package:babyhub/features/personalization/controllers/user_controller.dart';
import 'package:babyhub/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:babyhub/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:babyhub/utils/constant/image_strings.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/popups/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const BAppBar(
        showBackArrow: true,
        title: Text(" Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BabyHubSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : BabyHubImages.user;
                      return controller.imageUploading.value
                          ? const BShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : BCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text(" Change Profile Picture")),
                  ],
                ),
              ),

              ///Details
              const SizedBox(
                height: BabyHubSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: BabyHubSizes.spaceBtwItems,
              ),
              const BSectionHeading(
                title: " Profile Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: BabyHubSizes.spaceBtwItems,
              ),
              BProfileMenu(
                title: " Name",
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              BProfileMenu(
                title: " Username",
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(height: BabyHubSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(
                height: BabyHubSizes.spaceBtwItems,
              ),
              const BSectionHeading(
                title: " Personal Information",
                showActionButton: false,
              ),

              BProfileMenu(
                title: " User ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              BProfileMenu(
                title: " Email",
                value: controller.user.value.email,
                onPressed: () {},
              ),
              BProfileMenu(
                title: " phoneNumber",
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              BProfileMenu(
                title: " Gender",
                value: " Female",
                onPressed: () {},
              ),
              BProfileMenu(
                title: " Date of birth",
                value: " 10 Oct",
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: BabyHubSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    " Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

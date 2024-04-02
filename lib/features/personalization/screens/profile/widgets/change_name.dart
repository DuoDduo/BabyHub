import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/features/personalization/controllers/update_name_controller.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/constant/text_string.dart';
import 'package:babyhub/utils/validations/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: BAppBar(
        showBackArrow: true,
        title: Text(
          " Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(BabyHubSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Use real name for easy verification, This name will appear on several pages",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: BabyHubSizes.spaceBtwSections,
            ),
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          BValidator.validateEmptyText(" First name", value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: BabyHubTexts.firstname,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: BabyHubSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          BValidator.validateEmptyText(" Last name", value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: BabyHubTexts.lastname,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                )),
            const SizedBox(
              height: BabyHubSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text(" Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

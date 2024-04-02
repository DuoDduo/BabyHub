import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/features/personalization/screens/address/add_new_address.dart';
import 'package:babyhub/features/personalization/screens/address/widgets/single_address.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: BabyHubColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: BabyHubColors.white,
        ),
      ),
      appBar: BAppBar(
        showBackArrow: true,
        title: Text(
          " Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BabyHubSizes.defaultSpace),
          child: Column(children: [
            BSingleAddress(
              selectedAddress: true,
            ),
            BSingleAddress(
              selectedAddress: false,
            ),
          ]),
        ),
      ),
    );
  }
}

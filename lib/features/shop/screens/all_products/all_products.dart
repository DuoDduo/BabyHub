import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/common/widgets/products/sortable/sortable_products.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BAppBar(
        title: Text(" Popular Products"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BabyHubSizes.defaultSpace),
          child: BSortableProducts(),
        ),
      ),
    );
  }
}

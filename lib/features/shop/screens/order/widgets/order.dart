import 'package:babyhub/common/widgets/appbar/appbar.dart';
import 'package:babyhub/features/shop/screens/order/widgets/orders_list.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        title: Text(
          " My Orders",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(BabyHubSizes.defaultSpace),
        child: BOrderListItems(),
      ),
    );
  }
}

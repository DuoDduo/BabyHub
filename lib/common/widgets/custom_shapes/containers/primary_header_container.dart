import 'package:babyhub/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:babyhub/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class BPrimaryHeaderContainer extends StatelessWidget {
  const BPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BCurvedEdgeWidget(
        child: Container(
      color: BabyHubColors.primary,
      padding: const EdgeInsets.only(bottom: 0),
      child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -250,
            child: BCircularContainer(
              backgroundColor: BabyHubColors.textWhite.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 100,
            right: -300,
            child: BCircularContainer(
              backgroundColor: BabyHubColors.textWhite.withOpacity(0.1),
            ),
          ),
          child,
        ],
      ),
    ));
  }
}

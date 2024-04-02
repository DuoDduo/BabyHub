import 'package:babyhub/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class BCurvedEdgeWidget extends StatelessWidget {
  const BCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BCustomCurvedEdges(),
      child: child,
    );
  }
}

// Container(
// color: BabyHubColors.primary,
// padding: const EdgeInsets.all(0),
// child: SizedBox(
// height: 400,
// child: Stack(
// children: [
// Positioned(
// top: -150,
// right: -250,
// child: BCircularContainer(
// backgroundColor: BabyHubColors.textWhite.withOpacity(0.1),
// ),
// ),
// Positioned(
// top: 100,
// right: -300,
// child: BCircularContainer(
// backgroundColor: BabyHubColors.textWhite.withOpacity(0.1),
// ),
// ),
// ],
// ),
// ),
// ),

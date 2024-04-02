import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/constant/sizes.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:babyhub/utils/popups/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BCircularImage extends StatelessWidget {
  const BCircularImage({
    super.key,
    this.fit,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = BabyHubSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: backgroundColor ??
                (BHelperFunctions.isDarkMode(context)
                    ? BabyHubColors.black
                    : BabyHubColors.white),
            borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const BShimmerEffect(
                      width: 55,
                      height: 55,
                      radius: 55,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(image),
                    color: overlayColor,
                    // color: BHelperFunctions.isDarkMode(context) ? BabyHubColors.white : BabyHubColors.dark,
                  ),
          ),
        ));
  }
}

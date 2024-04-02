import 'package:babyhub/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:babyhub/utils/constant/colors.dart';
import 'package:babyhub/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BChoiceChip extends StatelessWidget {
  const BChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = BHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? BabyHubColors.white : null),
        avatar: isColor
            ? BCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: BHelperFunctions.getColor(text)!)
            : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? BHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}

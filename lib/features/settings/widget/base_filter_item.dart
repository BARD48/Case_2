import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/constants/dynamic_constants.dart';
import '../../../core/constants/text_constants.dart';

// ignore: must_be_immutable
class BaseFitreItem extends StatefulWidget {
  BaseFitreItem({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.title,
    this.widget,
  });
  bool isChecked;
  final VoidCallback onChanged;
  final String? title;
  final Widget? widget;

  @override
  State<BaseFitreItem> createState() => _BaseFitreItemState();
}

class _BaseFitreItemState extends State<BaseFitreItem> {
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final filterItemType = widget.isChecked
        ? FilterItemType.Selected
        : FilterItemType.Default;
    return GestureDetector(
      onTap: widget.onChanged,
      child: Container(
        height: context.dynamicHeight(0.08),
        padding: context.symmetricPadding(8, 8),
        color: filterItemType.backgroundColor(context),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: widget.onChanged,
                child: PhosphorIcon(
                  widget.isChecked
                      ? PhosphorIconsFill.checkSquare
                      : PhosphorIconsBold.square,
                  color: widget.isChecked
                      ? Constant.iconDark(context)
                      : Constant.iconBase(context),
                ),
              ),
            ),

            Expanded(
              flex: 6,
              child:
                  widget.widget ??
                  Text(
                    widget.title ?? '',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

enum FilterItemType { Default, Selected, Disabled }

extension FilterColor on FilterItemType {
  Color backgroundColor(BuildContext context) {
    switch (this) {
      case FilterItemType.Default:
        return Constant.fillWhite(context);
      case FilterItemType.Selected:
        return Constant.fillLight(context);
      case FilterItemType.Disabled:
        return Constant.fillWhite(context);
    }
  }
}

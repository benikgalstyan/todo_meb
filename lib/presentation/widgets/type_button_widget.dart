import 'package:flutter/material.dart';
import 'package:todo_meb/core/context_extensions.dart';
import 'package:todo_meb/core/theme/palette.dart';
import 'package:todo_meb/core/theme/text_styles.dart';
import 'package:todo_meb/presentation/tokens/spacing.dart';

class TypeButtonWidget extends StatelessWidget {
  const TypeButtonWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final int selectedFilter;
  final ValueChanged<int> onFilterChanged;

  static const iconSize = 30.0;
  static const containerHeight = 50.0;
  static const padding = EdgeInsets.only(right: 60);

  IconData get icon =>
      selectedFilter == 1 ? Icons.circle_rounded : Icons.circle_outlined;

  IconData get anotherIcon =>
      selectedFilter == 2 ? Icons.circle_rounded : Icons.circle_outlined;

  @override
  Widget build(BuildContext context) => Container(
        height: containerHeight,
        color: Palette.dateColor,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => onFilterChanged(1),
                icon: Icon(icon, size: iconSize, color: Colors.white),
              ),
              Spacings.spacer4,
              Text(context.s.work, style: TextStyles.typeTextStyle),
              const Spacer(),
              IconButton(
                onPressed: () => onFilterChanged(2),
                icon: Icon(anotherIcon, size: iconSize, color: Colors.white),
              ),
              Spacings.spacer4,
              Text(context.s.personal, style: TextStyles.typeTextStyle),
            ],
          ),
        ),
      );
}

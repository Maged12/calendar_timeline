import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Size dayCardSize;
  final TextStyle? unselectedDayNumberTextStyle;
  final TextStyle? unselectedDayNameTextStyle;
  final TextStyle? selectedDayNumberTextStyle;
  final TextStyle? selectedDayNameTextStyle;
  final double cardBorderRadius;
  final double spaceBetweenNameAndNumber;
  final Color? selectedDayBackgroundColor;
  final Color? unselectedDayBackgroundColor;
  final bool available;

  DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    required this.dayCardSize,
    required this.cardBorderRadius,
    required this.spaceBetweenNameAndNumber,
    this.isSelected = false,
    this.unselectedDayNumberTextStyle,
    this.selectedDayNumberTextStyle,
    this.selectedDayBackgroundColor,
    this.unselectedDayBackgroundColor,
    this.unselectedDayNameTextStyle,
    this.selectedDayNameTextStyle,
    this.available = true,
  }) : super(key: key);

  _buildDay(BuildContext context) {
    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: selectedDayBackgroundColor ??
                    Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(cardBorderRadius),
              )
            : BoxDecoration(
                color: unselectedDayBackgroundColor ??
                    Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(cardBorderRadius),
              ),
        height: dayCardSize.height,
        width: dayCardSize.width,
        child: Column(
          children: <Widget>[
            SizedBox(height: 6),
            Text(
              shortName,
              style: isSelected
                  ? selectedDayNameTextStyle
                  : unselectedDayNameTextStyle,
            ),
            SizedBox(height: spaceBetweenNameAndNumber),
            Text(
              dayNumber.toString(),
              style: isSelected
                  ? selectedDayNumberTextStyle
                  : unselectedDayNumberTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}

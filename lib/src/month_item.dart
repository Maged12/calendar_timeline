import 'package:flutter/material.dart';

/// Creates a Widget to represent the months.
class MonthItem extends StatelessWidget {
  final String name;
  final Function onTap;
  final bool isSelected;
  final TextStyle selectedMonthTextStyle;
  final TextStyle unselectedMonthTextStyle;
  final bool shrink;

  MonthItem({
    required this.name,
    required this.onTap,
    this.isSelected = false,
    required this.selectedMonthTextStyle,
    required this.unselectedMonthTextStyle,
    this.shrink = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap as void Function()?,
      child: Text(
        name[0].toUpperCase() + name.substring(1),
        style: isSelected ? selectedMonthTextStyle : unselectedMonthTextStyle,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_meb/core/theme/palette.dart';

class TextStyles {
  static const TextStyle sectionTitleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Palette.defaultContainerColor,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const taskNameStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Palette.taskTextColor,
  );

  static const dateStyle = TextStyle(
    fontSize: 10,
    color: Palette.dateColor,
    fontWeight: FontWeight.w400,
  );
  static const filterButtonsLabelStyle = TextStyle(
    fontSize: 18,
  );
  static const hintTextStyle = TextStyle(
    color: Palette.hintColor,
    fontSize: 24,
  );

  static const textFieldStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );
  static const textDescriptionStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const typeTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const attachTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle emptyStateTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}

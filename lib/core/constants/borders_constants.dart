import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBorders {
  // Vertical Top
  static BorderRadius get verticalTopSmall =>
      BorderRadius.vertical(top: Radius.circular(10.r));
  static BorderRadius get verticalTopMedium =>
      BorderRadius.vertical(top: Radius.circular(20.r));
  static BorderRadius get verticalTopLarge =>
      BorderRadius.vertical(top: Radius.circular(30.r));
  // Vertical Bottom
  static BorderRadius get verticalBottomSmall =>
      BorderRadius.vertical(bottom: Radius.circular(10.r));
  static BorderRadius get verticalBottomMedium =>
      BorderRadius.vertical(bottom: Radius.circular(20.r));
  static BorderRadius get verticalBottomLarge =>
      BorderRadius.vertical(bottom: Radius.circular(30.r));
  // Horizontal Left
  static BorderRadius get horizontalLeftSmall =>
      BorderRadius.horizontal(left: Radius.circular(10.r));
  static BorderRadius get horizontalLeftMedium =>
      BorderRadius.horizontal(left: Radius.circular(20.r));
  static BorderRadius get horizontalLeftLarge =>
      BorderRadius.horizontal(left: Radius.circular(30.r));
  // Horizontal Right
  static BorderRadius get horizontalRightSmall =>
      BorderRadius.horizontal(right: Radius.circular(10.r));
  static BorderRadius get horizontalRightMedium =>
      BorderRadius.horizontal(right: Radius.circular(20.r));
  static BorderRadius get horizontalRightLarge =>
      BorderRadius.horizontal(right: Radius.circular(30.r));
  // All Corners
  static BorderRadius get allCornersSmall =>
      BorderRadius.all(Radius.circular(10.r));
  static BorderRadius get allCornersMedium =>
      BorderRadius.all(Radius.circular(20.r));
  static BorderRadius get allCornersLarge =>
      BorderRadius.all(Radius.circular(30.r));
  // Only Top Corners
  static BorderRadius get onlyTopCornersSmall => BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
      );
  static BorderRadius get onlyTopCornersMedium => BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      );
  static BorderRadius get onlyTopCornersLarge => BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      );
  // Only Bottom Corners
  static BorderRadius get onlyBottomCornersSmall => BorderRadius.only(
        bottomLeft: Radius.circular(10.r),
        bottomRight: Radius.circular(10.r),
      );
  static BorderRadius get onlyBottomCornersMedium => BorderRadius.only(
        bottomLeft: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      );
  static BorderRadius get onlyBottomCornersLarge => BorderRadius.only(
        bottomLeft: Radius.circular(30.r),
        bottomRight: Radius.circular(30.r),
      );
}

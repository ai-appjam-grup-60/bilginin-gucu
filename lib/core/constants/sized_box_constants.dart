import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizedBoxes {
  // Vertical
  // vertical - h = height
  static SizedBox get verticalExtraSmall => SizedBox(height: 5.h);
  static SizedBox get verticalSmall => SizedBox(height: 10.h);
  static SizedBox get verticalMedium => SizedBox(height: 20.h);
  static SizedBox get verticalLarge => SizedBox(height: 30.h);
  static SizedBox get verticalExtraLarge => SizedBox(height: 40.h);
  // Vertical - sh = screen height
  static SizedBox get verticalScreenHeightSmall => SizedBox(height: 0.25.sh);
  static SizedBox get verticalScreenHeightMedium => SizedBox(height: 0.50.sh);
  static SizedBox get verticalScreenHeightLarge => SizedBox(height: 0.75.sh);
  static SizedBox get verticalScreenHeightExtraLarge =>
      SizedBox(height: 1.0.sh);

  // Horizontal - w = width
  static SizedBox get horizontalExtraSmall => SizedBox(width: 5.w);
  static SizedBox get horizontalSmall => SizedBox(width: 10.w);
  static SizedBox get horizontalMedium => SizedBox(width: 20.w);
  static SizedBox get horizontalLarge => SizedBox(width: 30.w);
  static SizedBox get horizontalExtraLarge => SizedBox(width: 40.w);
  // Horizontal - sw = screen width
  static SizedBox get horizontalScreenWidthSmall => SizedBox(width: 0.25.sw);
  static SizedBox get horizontalScreenWidthMedium => SizedBox(width: 0.50.sw);
  static SizedBox get horizontalScreenWidthLarge => SizedBox(width: 0.75.sw);
  static SizedBox get horizontalScreenWidthExtraLarge =>
      SizedBox(width: 1.0.sw);
}

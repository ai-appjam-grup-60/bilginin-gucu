import 'package:ai_study_app/core/custom_colors.dart';
import 'package:flutter/material.dart';

class NavbarController {
  Color navBarSelectedMethod(bool selected) {
    return selected ? CustomColors.customGreen : CustomColors.customGrey600;
  }
}

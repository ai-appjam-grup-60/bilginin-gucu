import 'package:ai_study_app/controllers/navbar_controller.dart';
import 'package:ai_study_app/core/constants/size_constants.dart';
import 'package:ai_study_app/core/constants/sized_box_constants.dart';
import 'package:flutter/material.dart';
import '../core/custom_colors.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  const BottomNavigationItemWidget(
      {super.key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed});
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: CustomColors.customTransparent,
      highlightColor: CustomColors.customTransparent,
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              size:
                  AppSizes.iconSizeMedium, // Ekran boyutuna göre ölçeklendirme
              color: NavbarController().navBarSelectedMethod(selected)),
          AppSizedBoxes.verticalSmall,
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: .1,
                color: NavbarController().navBarSelectedMethod(selected)),
          )
        ],
      ),
    );
  }
}

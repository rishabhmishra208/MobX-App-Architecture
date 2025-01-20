import 'package:flutter/material.dart';
import '../App_Theme_Utils/app_theme_export.dart';
import '../Common_Function/comman_functions_export.dart';

class SubmitButton extends StatelessWidget {
  final String btnTitle;
  final bool isDisable;
  final bool isShowIcon;
  final double? btnHeight;
  final double? btnWidth;
  final Function()? onPressed;
  final Color btnTitleColor;
  final Color disableBtnTitleColor;
  final Color backGroundColor;
  final Color disableBackGroundColor;
  final Color disableBorderColor;
  final Color borderColor;
  final double borderRadius;

  const SubmitButton({
    super.key,
    this.btnTitle = '',
    this.isDisable = false,
    this.isShowIcon = false,
    this.btnHeight,
    this.btnWidth,
    this.onPressed,
    this.btnTitleColor = ThemeConstants.whiteColor,
    this.disableBtnTitleColor = ThemeConstants.grayColor,
    this.backGroundColor = ThemeConstants.blueColor,
    this.disableBackGroundColor = ThemeConstants.darkBlueColor,
    this.borderColor = ThemeConstants.blueColor,
    this.disableBorderColor = ThemeConstants.darkBlueColor,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight ?? Sizes.crossLength * 0.037,
      width: btnWidth ?? Sizes.crossLength,
      child: ElevatedButton(
        onPressed: isDisable ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isDisable ? disableBackGroundColor : backGroundColor,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: isDisable ? disableBorderColor : borderColor,
                width: 2.0,
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnTitle,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: isDisable ? disableBtnTitleColor : btnTitleColor,
                  ),
            ),
            // if (isShowIcon)
            //   Transform.translate(
            //     offset: const Offset(1.5, 1.7),
            //     child: SvgPicture.asset(
            //       svgNextArrow,
            //       height: Sizes.crossLength * 0.011,
            //       colorFilter: ColorFilter.mode(
            //         isDisable ? disableBtnTitleColor : btnTitleColor,
            //         BlendMode.srcIn,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

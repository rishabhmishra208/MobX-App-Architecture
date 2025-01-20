import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:cached_network_image/cached_network_image.dart';

import '../Icons_Utils/icons_export.dart';
import '../App_Theme_Utils/app_theme_export.dart';
import '../Common_Widgets/common_widget_export.dart';
import '../Common_Function/comman_functions_export.dart';

class AlertErrorDialog extends StatefulWidget {
  final String assetPath;
  final String networkIcon;
  final String title;
  final String subTitle;
  final String primaryBtnTitle;
  final String secondaryBtnTitle;
  final Function()? primaryBtnTap;
  final Function()? secondaryBtnTap;
  final double? svgIconSize;
  final bool isDisable;
  final bool isShowIcon;
  final bool isShowCloseIcon;

  const AlertErrorDialog({
    super.key,
    this.assetPath = '',
    this.networkIcon = '',
    this.title = '',
    this.subTitle = '',
    this.primaryBtnTitle = '',
    this.secondaryBtnTitle = '',
    this.primaryBtnTap,
    this.secondaryBtnTap,
    this.svgIconSize,
    this.isDisable = false,
    this.isShowIcon = false,
    this.isShowCloseIcon = true,
  });

  @override
  State<AlertErrorDialog> createState() => _AlertErrorDialogState();
}

class _AlertErrorDialogState extends State<AlertErrorDialog> {
  @override
  Widget build(BuildContext context) {
    String extension = path.extension(widget.assetPath).replaceFirst('.', '');

    return AlertDialog(
      scrollable: true,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(
        vertical: Sizes.crossLength * 0.01,
        horizontal: Sizes.crossLength * 0.23,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      content: Stack(
        children: [
          SizedBox(
            width: Sizes.crossLength * 0.38,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Sizes.crossLength * 0.011,
                vertical: Sizes.crossLength * 0.01,
              ),
              decoration: const BoxDecoration(
                color: ThemeConstants.blackColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: Sizes.crossLength * 0.027,
                      bottom: Sizes.crossLength * 0.02,
                      left: Sizes.crossLength * 0.027,
                      right: Sizes.crossLength * 0.027,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.isShowIcon)
                          widget.assetPath.isNotEmpty
                              ? extension == 'svg'
                                  ? SvgPicture.asset(
                                      widget.assetPath,
                                      height: widget.svgIconSize ??
                                          Sizes.crossLength * 0.06,
                                    )
                                  : Image.asset(
                                      widget.assetPath,
                                      height: widget.svgIconSize ??
                                          Sizes.crossLength * 0.06,
                                    )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.networkIcon,
                                    height: Sizes.crossLength * 0.06,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) {
                                      return const SizedBox.shrink();
                                    },
                                    errorWidget: (context, url, error) {
                                      return SvgPicture.asset(
                                        svgWarning,
                                        height: widget.svgIconSize ??
                                            Sizes.crossLength * 0.06,
                                      );
                                    },
                                  ),
                                ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Sizes.crossLength * 0.02,
                            bottom: Sizes.crossLength * 0.015,
                          ),
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontSize: 22,
                                ),
                          ),
                        ),
                        widget.subTitle.isEmpty
                            ? const SizedBox.shrink()
                            : Text(
                                widget.subTitle,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: ThemeConstants.darkGrayColor,
                                      fontSize: 15,
                                    ),
                              ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.subTitle.isEmpty
                                ? Sizes.crossLength * 0.01
                                : Sizes.crossLength * 0.02,
                            bottom: widget.secondaryBtnTitle.isEmpty
                                ? Sizes.crossLength * 0.01
                                : Sizes.crossLength * 0.005,
                          ),
                          child: SubmitButton(
                            btnTitle: widget.primaryBtnTitle,
                            btnHeight: Sizes.crossLength * 0.035,
                            btnWidth: Sizes.crossLength * 0.26,
                            isDisable: widget.isDisable,
                            onPressed: widget.primaryBtnTap ??
                                () => Navigator.pop(context),
                          ),
                        ),
                        widget.secondaryBtnTap == null
                            ? const SizedBox.shrink()
                            : InkWell(
                                onTap: widget.secondaryBtnTap,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: Sizes.crossLength * 0.01,
                                    bottom: Sizes.crossLength * 0.007,
                                    right: Sizes.crossLength * 0.02,
                                    left: Sizes.crossLength * 0.02,
                                  ),
                                  child: Text(
                                    widget.secondaryBtnTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color:
                                              ThemeConstants.brightWhiteColor,
                                        ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.isShowCloseIcon)
            Positioned(
              right: 0,
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        svgCloseIcon,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

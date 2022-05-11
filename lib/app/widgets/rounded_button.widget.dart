import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/text_themes.dart';
import 'package:flutter/material.dart';

//

class RoundedButton extends StatelessWidget {
  final Widget? icon;
  final String? labelText;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color disableBackgroundColor;
  final Color disableBorder;
  final Color textColor;
  final Color? borderColor;
  final bool isBorder;
  final bool disabled;
  final EdgeInsets margin;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final double fontSize;
  final double radius;
  final bool effectsRipple;
  final Color rippleColor;
  final Widget? child;

  const RoundedButton({
    Key? key,
    this.labelText,
    this.icon,
    this.child,
    this.width,
    this.height = 44,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.margin = const EdgeInsets.all(0),
    this.backgroundColor = ColorStyles.kPrimaryColor,
    this.disableBackgroundColor = const Color(0xff90A5F4),
    this.disableBorder = const Color(0xffE6E9F0),
    this.borderColor,
    this.textColor = Colors.white,
    this.disabled = false,
    this.onPressed,
    this.textStyle,
    this.radius = 6,
    this.isBorder = false,
    this.fontSize = 14,
    this.effectsRipple = false,
    this.rippleColor = Colors.yellow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        style: effectsRipple
            ? ElevatedButton.styleFrom(
                onPrimary: rippleColor,
                elevation: 0,
                primary: disabled ? disableBackgroundColor : backgroundColor,
                padding: padding,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: isBorder
                        ? BorderSide(
                            color: borderColor != null
                                ? borderColor!
                                : ColorStyles.black.shade300)
                        : BorderSide.none),
              )
            : TextButton.styleFrom(
                elevation: 0,
                backgroundColor:
                    disabled ? disableBackgroundColor : backgroundColor,
                padding: padding,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: isBorder
                        ? BorderSide(
                            color: disabled
                                ? disableBorder
                                : borderColor ?? ColorStyles.black.shade300)
                        : BorderSide.none),
              ),
        onPressed: disabled ? null : onPressed,
        child: FittedBox(
          child: child ?? Row(
            children: [
              if (icon != null) icon!,
              if (icon != null)
                SizedBox(
                  width: 10,
                ),
              Text(
                labelText!,
                style: textStyle ??
                    TextStyles.mediumButton.copyWith(
                        fontSize: fontSize,
                        color:
                            disabled ? ColorStyles.black.shade500 : textColor,
                        fontWeight: FontWeight.w700,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

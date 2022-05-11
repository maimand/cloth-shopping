
import 'package:app/app/theme/colors_theme.dart';
import 'package:app/app/theme/constants.dart';
import 'package:app/app/theme/text_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? labelText;
  final String? labelInput;
  final void Function(String)? onChanged;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final double radius;
  final double iconSize;
  final String? initValue;
  final bool readOnly;
  final bool enabled;
  final Widget? iconPrefix;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final bool obscureText;
  final bool autoFocus;
  final bool isBorder;
  final bool isUnderline;
  final bool showClearIcon;
  final Function()? onSuffixTap;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Color? fillColor;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool isCustomErrorMessage;
  final bool isClearController;
  final bool autoValidate;
  final bool hasKeyboardAction;

  // this field is use for custom validation,
  // if you want to show this text field is error in some specific case
  // like you want to auto validate the field is not empty but validate the
  // field is email when user tap button to validate, use this field to make the border error color
  final bool isCustomError;
  final TextAlign textAlign;
  final AutovalidateMode? autovalidateMode;

  AppInput({
    Key? key,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.onChanged,
    this.minLines = 1,
    this.maxLength,
    this.maxLines = 1,
    this.radius = 30,
    this.iconSize = 20,
    this.iconPrefix,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.contentPadding,
    this.inputFormatters,
    this.style,
    this.labelText,
    this.initValue,
    this.fillColor,
    this.focusNode,
    this.onTap,
    this.hintStyle,
    this.labelInput,
    this.textCapitalization = TextCapitalization.sentences,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onSuffixTap,
    this.obscureText = false,
    this.isBorder = true,
    this.autoFocus = false,
    this.isUnderline = false,
    this.showClearIcon = false,
    this.enabled = true,
    this.readOnly = false,
    this.labelStyle,
    this.onFieldSubmitted,
    this.isCustomErrorMessage = false,
    this.isClearController = true,
    this.autoValidate = false,
    this.isCustomError = false,
    this.hasKeyboardAction = false,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  _AppInputState createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    bool _showClearIcon =
        widget.controller != null ? widget.controller!.text.isNotEmpty : false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelInput != null)
          Padding(
            padding: EdgeInsets.only(bottom: widget.isUnderline ? 0 : 5),
            child: Text(
              widget.labelInput!,
              style: widget.labelStyle ??
                  TextStyles.smallSmall.copyWith(
                      color: ColorStyles.black5, fontWeight: FontWeight.w700),
            ),
          ),
        TextFormField(
          maxLength: widget.maxLength,
          scrollPadding: EdgeInsets.all(widget.hasKeyboardAction ? 70 : 20),
          textAlign: widget.textAlign,
          textCapitalization: widget.textCapitalization,
          autovalidateMode: widget.autoValidate
              ? AutovalidateMode.always
              : widget.autovalidateMode,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          style: widget.style ??
              TextStyles.mediumBody2.copyWith(color: ColorStyles.black10),
          autofocus: widget.autoFocus,
          controller: widget.controller,
          onChanged: (text) {
            if (widget.onChanged != null) {
              widget.onChanged!(text);
            }
            setState(() {
              _showClearIcon = text.isNotEmpty;
            });
          },
          initialValue: widget.initValue,
          onFieldSubmitted: (String text) {
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!(text);
              if (widget.isClearController && widget.controller != null) {
                setState(() {
                  widget.controller!.clear();
                });
              }
            }
          },
          readOnly: widget.readOnly,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          obscureText: widget.obscureText,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            errorStyle:
                widget.isCustomErrorMessage ? TextStyle(height: 0) : null,
            isDense: true,
            labelText: widget.labelText,
            filled: true,
            fillColor: widget.fillColor ?? Colors.transparent,
            prefixIcon: widget.iconPrefix != null ? widget.iconPrefix : null,
            suffixIcon: widget.suffixIcon != null
                ? widget.suffixIcon
                : widget.showClearIcon && _showClearIcon
                    ? IconButton(
                        onPressed: () {
                          widget.controller!.text = '';
                          setState(() {
                            _showClearIcon = false;
                          });
                        },
                        icon: Icon(
                          CupertinoIcons.clear_circled_solid,
                          size: 18,
                          color: ColorStyles.black5,
                        ),
                      )
                    : null,
            suffixIconConstraints: widget.suffixIconConstraints ??
                BoxConstraints(minWidth: 32, maxHeight: 32),
            prefixIconConstraints: widget.prefixIconConstraints ??
                BoxConstraints(minWidth: 32, maxHeight: 32),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle != null
                ? widget.hintStyle
                : TextStyle(color: ColorStyles.black5),
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(
                    vertical: 11,
                    horizontal:
                        widget.isUnderline || !widget.isBorder ? 0 : 10),
            errorBorder: _getInputBorder(kErrorColor),
            focusedErrorBorder: _getInputBorder(kErrorColor),
            enabledBorder: widget.isCustomError
                ? _getInputBorder(kErrorColor)
                : _getInputBorder(ColorStyles.black.shade300),
            focusedBorder: widget.isCustomError
                ? _getInputBorder(kErrorColor)
                : _getInputBorder(ColorStyles.blue.shade700),
            disabledBorder: _getInputBorder(ColorStyles.black.shade300),
          ),
        ),
      ],
    );
  }

  InputBorder _getInputBorder(Color color) {
    return widget.isBorder
        ? widget.isUnderline
            ? UnderlineInputBorder(borderSide: BorderSide(color: color))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: color))
        : InputBorder.none;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/fonts_and_sizes.dart';

class PrimaryTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final String? suffixUrl;
  final Widget? suffixWidget;
  final String? sideImageUrl;
  final Function? onTap;
  final Widget? prefixWidget;
  final TextInputType? textInputType;
  final String err;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Color? sideColor;
  final bool sideColorRequired;
  final bool isRTL;
  final Size? sideImageSize;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onSideImageTap;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? boderColor;
  final bool? obscureText;

  const PrimaryTextField({
    super.key,
    required this.hintText,
    this.readOnly = false,
    this.prefixWidget,
    this.err = '',
    this.padding,
    this.labelText = '',
    this.suffixWidget,
    this.inputFormatters,
    this.sideImageUrl = '',
    required this.controller,
    this.sideColor,
    this.sideColorRequired = true,
    this.onSideImageTap,
    this.icon,
    this.isRTL = false,
    this.contentPadding,
    this.hintTextStyle,
    this.boderColor,
    this.sideImageSize,
    this.textInputType = TextInputType.text,
    this.suffixUrl,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.style,
    this.onTap,
    this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != '')
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            child: Text(
              labelText!,
              style: TextStyles.urbanistMedium.f12.white.copyWith(letterSpacing: 0),
            ),
          )
        else
          const SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            onChanged: onChanged,
            focusNode: focusNode,
            style: style ?? TextStyles.urbanistBold.f16.primaryColor,
            readOnly: readOnly,
            inputFormatters: inputFormatters,
            keyboardType: textInputType,
            cursorColor: FontColors.primaryColor,
            cursorWidth: 1.5,
            onSubmitted: onSubmitted,
            obscureText: obscureText ?? false,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: prefixWidget != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: prefixWidget,
                    )
                  : null,
              suffixIcon: (suffixUrl?.isNotEmpty ?? false)
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: suffixUrl!.contains('svg')
                          ? SvgPicture.asset(
                              suffixUrl!,
                              width: 20,
                              height: 20,
                            )
                          : Image.asset(
                              suffixUrl!,
                              width: 20,
                              height: 20,
                            ),
                    )
                  : suffixWidget ?? const SizedBox(),
              // contentPadding: contentPadding ?? const EdgeInsets.all(10),
              border: UnderlineInputBorder(borderSide: BorderSide(color: FontColors.bgWhite)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: FontColors.bgWhite)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: FontColors.bgWhite)),

              // hintText: hintText,
              // hintStyle: hintTextStyle ?? TextStyles.urbanistRegular.f14.white.copyWith(letterSpacing: 0.5, wordSpacing: 1),
              // // filled: true,
              // fillColor: Colors.grey[200],
            ),
          ),
        ),
        // if (err != '')
        //   FittedBox(
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 8),
        //       child: Text(
        //         err,
        //         style: TextStyles.urbanistRegular.f10.error,
        //       ),
        //     ),
        //   )
      ],
    );
  }
}

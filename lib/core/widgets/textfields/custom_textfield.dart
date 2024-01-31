import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/dimensions.dart';
import '../../utils/fonts_and_sizes.dart';

class AlternateTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final String? suffixSvgUrl;
  final String? sideImageUrl;
  final Function? onTap;
  final TextInputType? inputType;
  final String? err;
  final String? prefixText;
  final bool readOnly;
  final TextEditingController? controller;
  final Function? onChanged;
  final Color? sideColor;
  final bool sideColorRequired;
  final bool isRTL;
  final Size? sideImageSize;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onSideImageTap;
  final String? Function(String?)? vadlidation;

  const AlternateTextField({
    Key? key,
    required this.hintText,
    this.readOnly = false,
    this.err = '',
    required this.labelText,
    this.inputFormatters,
    this.sideImageUrl = '',
    this.controller,
    this.sideColor,
    this.sideColorRequired = true,
    this.onSideImageTap,
    this.icon,
    this.isRTL = false,
    this.sideImageSize,
    this.prefixText = '',
    this.inputType = TextInputType.text,
    this.suffixSvgUrl,
    this.onChanged,
    this.vadlidation,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textformField = TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      onTap: onTap as void Function()?,
      readOnly: readOnly,
      style: TextStyles.urbanistSemiBold.f16.black,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      // validator: validator,
      validator: vadlidation,
      onChanged: onChanged as void Function(String)?,
      // enabled: enabled,
      decoration: InputDecoration(
        suffixIcon: suffixSvgUrl == null
            ? null
            : SvgPicture.asset(
                suffixSvgUrl!,
              ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 20, minHeight: 10, minWidth: 10),
        hintText: hintText,
        hintStyle: TextStyles.urbanistLight.f14.greyMid,
        contentPadding: const EdgeInsets.all(0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x00F7F7F7)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x00F7F7F7)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00F7F7F7),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00F7F7F7),
          ),
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 70 * SizedBoxConfig.responsiveHeightValueToDivide,
          decoration: BoxDecoration(color: const Color.fromRGBO(247, 247, 247, 1), borderRadius: BorderRadius.circular(8), border: Border.all(color: err == '' ? const Color.fromRGBO(235, 235, 235, 1) : FontColors.error, width: 2)),
          child: Padding(
            padding: EdgeInsets.only(
              left: 12 * SizedBoxConfig.responsiveHeightValueToDivide,
              right: 12 * SizedBoxConfig.responsiveHeightValueToDivide,
              top: 7 * SizedBoxConfig.responsiveHeightValueToDivide,
              bottom: 5 * SizedBoxConfig.responsiveHeightValueToDivide,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          labelText!,
                          style: TextStyles.urbanistSemiBold.f14.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: prefixText!.isNotEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(prefixText!, style: TextStyles.urbanistSemiBold.f16.black),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: textformField,
                                  ),
                                ],
                              )
                            : textformField,
                      ),
                    ],
                  ),
                ),
                sideImageUrl != null && sideImageUrl!.isNotEmpty
                    ? sideImageUrl!.contains('png')
                        ? InkWell(
                            onTap: onSideImageTap,
                            child: Container(
                              margin: EdgeInsets.only(left: isRTL ? 0 : 8 * SizedBoxConfig.responsiveHeightValueToDivide, right: isRTL ? 8 * SizedBoxConfig.responsiveHeightValueToDivide : 0),
                              width: 28 * SizedBoxConfig.responsiveHeightValueToDivide,
                              height: 27 * SizedBoxConfig.responsiveHeightValueToDivide,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                image: DecorationImage(image: AssetImage(sideImageUrl!), fit: BoxFit.cover, alignment: Alignment.center),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: onSideImageTap,
                            child: SvgPicture.asset(
                              sideImageUrl!,
                              color: sideColorRequired ? sideColor ?? FontColors.success : null,
                              height: (sideImageSize != null ? sideImageSize!.height : 30) * SizedBoxConfig.responsiveHeightValueToDivide,
                              width: (sideImageSize != null ? sideImageSize!.width : 30) * SizedBoxConfig.responsiveHeightValueToDivide,
                            ),
                          )
                    : Container(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0 * SizedBoxConfig.responsiveHeightValueToDivide),
          child: Text(
            err!,
            style: TextStyles.urbanistBold.f16.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

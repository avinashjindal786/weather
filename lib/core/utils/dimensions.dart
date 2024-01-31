// import 'utils.dart';
import 'package:flutter/material.dart';

import 'fonts_and_sizes.dart';
import 'utils.dart';

///Base formula on which scaling of font is Happening
///A.Base Value from zeplin
///B.(screenHeight <= 640.0)
/// MI Note 4 and 5 /// Motorola G6 and G8 version
/// C. C=B+2
///(screenHeight > 640.0 && screenHeight <= 820)
/// HONOR 9N+ /// MI NOTE7+///SUMSUNG S370 /// IPHONE 6,7,8
/// D. D=C+2
///screenHeight > 820.0 && screenHeight <= 970
/// ONE PLUS7T & IPHONE10 /// SUMSUNG NOTE 10
///work make things more generic and have to use this config file for other mapping for padding and margin
class FontSizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double screenWidth = 360;
  static double screenHeight = 640;
  static double? devicePixelRatio;
  static double? deviceAspectRatio;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static double? safeBlockSizeHorizontal;
  static double? safeBlockSizeVertical;
  static bool? isRTL;
  //TextStyles
  static TextStyle? bannerText;
  static TextStyle? appBarText;
  static TextStyle? textfieldEntryText;
  static TextStyle? textfieldLabelText;
  static TextStyle? textfieldHintText;
  static TextStyle? primaryButtonText;
  static TextStyle? whiteBgButtonText;
  static TextStyle? staticText;
  static TextStyle? headerText;
  static TextStyle? subHeaderText;
  static TextStyle? regularText;
  static TextStyle? regularBoldText;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    
    Sizes().init(_mediaQueryData.size);
    // TextStyles().init(true);
    FontSizes().init(true);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    deviceAspectRatio = _mediaQueryData.size.aspectRatio;
    Utils.printI(
        'screenHeight : ${screenHeight.toString()}\nscreenWidth : ${screenWidth.toString()}\ndevicePixelRatio : ${devicePixelRatio.toString()}\ndeviceAspectRatio : ${deviceAspectRatio.toString()}');
    SizedBoxConfig().init(_mediaQueryData);
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockSizeHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockSizeVertical = (screenHeight - _safeAreaVertical) / 100;

    /// Below style are list having specs,if you find same style specific to any screen
    /// you can use or if you find a new style , then add that style specs below.

    bannerText = TextStyles.urbanistBold.f50.copyWith(
      color: Colors.white,
      letterSpacing: 1.6,
      height: 1.4,
    );
    appBarText = TextStyles.urbanistSemiBold.f16.copyWith(
      color: Colors.black,
      letterSpacing: 1.2,
    );
    textfieldLabelText =
        TextStyles.urbanistBold.f16.copyWith(color: Colors.black, height: 1.4);

    textfieldEntryText = TextStyles.urbanistRegular.f18
        .copyWith(color: Colors.black, letterSpacing: 1.2, height: 1.6);

    textfieldHintText =
        TextStyles.urbanistRegular.f18.copyWith(color: Colors.grey);

    headerText = TextStyles.urbanistBold.f30.copyWith(
      color: const Color(0xFF111419),
      letterSpacing: 1.1,
      height: 2,
    );

    subHeaderText = TextStyles.urbanistRegular.f18
        .copyWith(color: const Color(0xFF111419), height: 2);
    primaryButtonText = TextStyles.urbanistMedium.f20.copyWith(
      color: Colors.white,
      letterSpacing: 1.1,
      height: 2,
    );

    whiteBgButtonText = TextStyles.urbanistMedium.f20.copyWith(
      color: Colors.white,
      letterSpacing: 1.3,
      height: 1.5,
    );

    regularText = TextStyles.urbanistRegular.f14
        .copyWith(color: Colors.black, height: 1.2);

    regularBoldText =
        TextStyles.urbanistBold.f14.copyWith(color: Colors.black, height: 1.5);

    /// Below code refer scaling of widgets,icons etc we are taking height and width
  }
}

class SizedBoxConfig {
  static double screenWidth = 360;
  static double screenHeight = 640;
  static double? devicePixelRatio;
  static double? deviceAspectRatio;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static double? safeBlockSizeHorizontal;
  static late double safeBlockSizeVertical;
  static double responsiveHeightValueToDivide = 0.9;

  void init(MediaQueryData mediaQueryData) {
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    devicePixelRatio = mediaQueryData.devicePixelRatio;
    deviceAspectRatio = mediaQueryData.size.aspectRatio;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        mediaQueryData.padding.left + mediaQueryData.padding.right;
    _safeAreaVertical =
        mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    safeBlockSizeHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockSizeVertical = (screenHeight - _safeAreaVertical) / 100;

    responsiveHeightValueToDivide = screenHeight <= 640
        ? 0.6
        : screenHeight > 640.0 && screenHeight <= 740
            ? 0.63
            : screenHeight > 740.0 && screenHeight <= 825
                ? 0.68
                : screenHeight > 825.0 && screenHeight <= 900
                    ? 0.73
                    : screenHeight > 900.0 && screenHeight <= 1040
                        ? 0.85
                        : 0.95;
  }
}

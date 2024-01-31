import 'package:flutter/material.dart';

abstract class Fonts {
  static String get urbanistSemiBold => 'urbanist-semibold';
  static String get urbanistRegular => 'urbanist-regular';
  static String get urbanistMedium => 'urbanist-medium';
  static String get urbanistBold => 'urbanist-bold';
  static String get urbanistLight => 'urbanist-light';
  static String get tajawalLight => 'Tajawal-light';
  static String get tajawalMedium => 'Tajawal-medium';
  static String get tajawalRegular => 'Tajawal-regular';
  static String get tajawalBold => 'Tajawal-bold';
  static String get tajawalExtraBold => 'Tajawal-extrabold';
  static String get tajawalExtraLight => 'Tajawal-extralight';
}

class FontSizes {
  static double scale = 1;
  void init(bool isRTL) {
    scale = isRTL ? 1.1 : 1;
  }

  static double get f50 => Sizes.size50 * scale;
  static double get f42 => Sizes.size42 * scale;
  static double get f26 => Sizes.size26 * scale;
  static double get f20 => Sizes.size20 * scale;
  static double get f18 => Sizes.size18 * scale;
  static double get f16 => Sizes.size16 * scale;
  static double get f36 => Sizes.size36 * scale;
  static double get f14 => Sizes.size14 * scale;
  static double get f34 => Sizes.size34 * scale;
  static double get f12 => Sizes.size12 * scale;
  static double get f10 => Sizes.size10 * scale;
  static double get f30 => Sizes.size30 * scale;
  static double get f24 => Sizes.size24 * scale;
  static double get f52 => Sizes.size52 * scale;
  static double get f32 => Sizes.size32 * scale;
  static double get f22 => Sizes.size22 * scale;
}

class Sizes {
  static late double size10;
  static late double size12;
  static late double size14;
  static late double size16;
  static late double size18;
  static late double size20;
  static late double size26;
  static late double size34;
  static late double size36;
  static late double size42;
  static late double size50;
  static late double size24;
  static late double size30;
  static late double size52;
  static late double size32;
  static late double size22;
  void init(Size size) {
    size52 = size.height <= 640
        ? 47
        : size.height > 640.0 && size.height <= 740
            ? 49
            : size.height > 740.0 && size.height <= 820
                ? 52
                : size.height > 820.0 && size.height <= 900
                    ? 53
                    : size.height > 900.0 && size.height <= 1040
                        ? 54
                        : 56;
    size50 = size.height <= 640
        ? 39
        : size.height > 640.0 && size.height <= 740
            ? 48
            : size.height > 740.0 && size.height <= 820
                ? 50
                : size.height > 820.0 && size.height <= 900
                    ? 51
                    : size.height > 900.0 && size.height <= 1040
                        ? 52
                        : 56;
    size30 = size.height <= 640
        ? 25
        : size.height > 640.0 && size.height <= 740
            ? 28
            : size.height > 740.0 && size.height <= 820
                ? 30
                : size.height > 820.0 && size.height <= 900
                    ? 31
                    : size.height > 900.0 && size.height <= 1040
                        ? 32
                        : 32;
    size10 = size.height <= 640
        ? 7
        : size.height > 640.0 && size.height <= 740
            ? 8
            : size.height > 740.0 && size.height <= 820
                ? 10
                : size.height > 820.0 && size.height <= 900
                    ? 11
                    : size.height > 900.0 && size.height <= 1040
                        ? 12
                        : 14;
    size12 = size.height <= 640
        ? 9
        : size.height > 640.0 && size.height <= 740
            ? 11
            : size.height > 740.0 && size.height <= 820
                ? 13
                : size.height > 820.0 && size.height <= 900
                    ? 14
                    : size.height > 900.0 && size.height <= 1040
                        ? 15
                        : 16;
    size14 = size.height <= 640
        ? 12
        : size.height > 640.0 && size.height <= 740
            ? 13
            : size.height > 740.0 && size.height <= 820
                ? 14
                : size.height > 820.0 && size.height <= 900
                    ? 15
                    : size.height > 900.0 && size.height <= 1040
                        ? 16
                        : 17;
    size16 = size.height <= 640
        ? 14
        : size.height > 640.0 && size.height <= 740
            ? 15
            : size.height > 740.0 && size.height <= 820
                ? 16
                : size.height > 820.0 && size.height <= 900
                    ? 17
                    : size.height > 900.0 && size.height <= 1040
                        ? 18
                        : 20;
    size18 = size.height <= 640
        ? 15
        : size.height > 640.0 && size.height <= 740
            ? 16
            : size.height > 740.0 && size.height <= 820
                ? 18
                : size.height > 820.0 && size.height <= 900
                    ? 19
                    : size.height > 900.0 && size.height <= 1040
                        ? 20
                        : 21;
    size20 = size.height <= 640
        ? 16
        : size.height > 640.0 && size.height <= 740
            ? 18
            : size.height > 740.0 && size.height <= 820
                ? 20
                : size.height > 820.0 && size.height <= 900
                    ? 21
                    : size.height > 900.0 && size.height <= 1040
                        ? 22
                        : 22;
    size26 = size.height <= 640
        ? 22
        : size.height > 640.0 && size.height <= 740
            ? 24
            : size.height > 740.0 && size.height <= 820
                ? 26
                : size.height > 820.0 && size.height <= 900
                    ? 27
                    : size.height > 900.0 && size.height <= 1040
                        ? 28
                        : 29;
    size34 = size.height <= 640
        ? 28
        : size.height > 640.0 && size.height <= 740
            ? 30
            : size.height > 740.0 && size.height <= 820
                ? 32
                : size.height > 820.0 && size.height <= 900
                    ? 33
                    : size.height > 900.0 && size.height <= 1040
                        ? 34
                        : 36;
    size36 = size.height <= 640
        ? 30
        : size.height > 640.0 && size.height <= 740
            ? 32
            : size.height > 740.0 && size.height <= 820
                ? 34
                : size.height > 820.0 && size.height <= 900
                    ? 35
                    : size.height > 900.0 && size.height <= 1040
                        ? 36
                        : 38;
    size42 = size.height <= 640
        ? 36
        : size.height > 640.0 && size.height <= 740
            ? 38
            : size.height > 740.0 && size.height <= 820
                ? 40
                : size.height > 820.0 && size.height <= 900
                    ? 42
                    : size.height > 900.0 && size.height <= 1040
                        ? 44
                        : 46;
    size24 = size.height <= 640
        ? 18
        : size.height > 640.0 && size.height <= 740
            ? 20
            : size.height > 740.0 && size.height <= 820
                ? 22
                : size.height > 820.0 && size.height <= 900
                    ? 23
                    : size.height > 900.0 && size.height <= 1040
                        ? 24
                        : 26;
    size32 = size.height <= 640
        ? 26
        : size.height > 640.0 && size.height <= 740
            ? 28
            : size.height > 740.0 && size.height <= 820
                ? 30
                : size.height > 820.0 && size.height <= 900
                    ? 32
                    : size.height > 900.0 && size.height <= 1040
                        ? 33
                        : 36;
    size22 = size.height <= 640
        ? 16
        : size.height > 640.0 && size.height <= 740
            ? 18
            : size.height > 740.0 && size.height <= 820
                ? 20
                : size.height > 820.0 && size.height <= 900
                    ? 21
                    : size.height > 900.0 && size.height <= 1040
                        ? 22
                        : 26;
  }
}

abstract class FontColors {
  static Color get primaryColor => Color(0xFFDDB130);
  static Color get secondaryColor => const Color(0xFF362A84);
  static Color get textColorBlack => const Color.fromRGBO(17, 20, 25, 1);
  static Color get textColorgrayBlue => const Color.fromRGBO(73, 86, 106, 1);
  static Color get textColorgray => const Color.fromRGBO(145, 150, 157, 1);
  static Color get bgWhite => const Color.fromRGBO(255, 255, 255, 1);
  static Color get bgOffWhite => const Color.fromRGBO(247, 247, 247, 1);
  static Color get boxBorder => const Color.fromRGBO(230, 230, 230, 1);
  static Color get highlighter => const Color.fromRGBO(249, 170, 51, 1);
  static Color get error => const Color.fromRGBO(197, 29, 29, 1);
  static Color get success => const Color.fromRGBO(73, 161, 82, 1);
  static Color get disabledButton => const Color.fromRGBO(83, 96, 99, 1);
  static Color get white78 => const Color(0xC7FFFFFF);
  static Color get blueDark => const Color(0xFF007AFF);
  static Color get greyDark => const Color(0xFF454F63);
  static Color get greyMid => const Color(0xFF959DAD);
  static Color get greyLight => const Color(0xFFBFC5D3);
  static Color get greyVeryLight => const Color(0xFFEBEBEB);
  static Color get primColor => const Color.fromRGBO(53, 194, 193, 1);
}

class TextStyles {

  static TextStyle get urbanistSemiBold => TextStyle(
      fontFamily:  Fonts.urbanistSemiBold,
      fontWeight: FontWeight.w700);
  static TextStyle get urbanistSemiBoldItalic => TextStyle(
      fontFamily: Fonts.urbanistSemiBold,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700);
  static TextStyle get urbanistBold => TextStyle(
      fontFamily:  Fonts.urbanistBold,
      fontWeight: FontWeight.w800);
  static TextStyle get urbanistBoldItalic => TextStyle(
      fontFamily: Fonts.urbanistBold,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w800);
  static TextStyle get urbanistLight => TextStyle(
      fontFamily:  Fonts.urbanistLight,
      fontWeight: FontWeight.w300);
  static TextStyle get urbanistLightItalic => TextStyle(
      fontFamily: Fonts.urbanistLight,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w300);
  static TextStyle get urbanistRegular => TextStyle(
      fontFamily:  Fonts.urbanistRegular,
      fontWeight: FontWeight.w500);
  static TextStyle get urbanistRegularItalic => TextStyle(
      fontFamily: Fonts.urbanistRegular,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500);
  static TextStyle get urbanistMedium => TextStyle(
      fontFamily: Fonts.urbanistMedium,
      fontWeight: FontWeight.w600);
  static TextStyle get urbanistMediumItalic => TextStyle(
      fontFamily: Fonts.urbanistMedium,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w600);
}

extension TextStyleHelpers on TextStyle {
  TextStyle get f50 => copyWith(fontSize: FontSizes.f50);
  TextStyle get f42 => copyWith(fontSize: FontSizes.f42);
  TextStyle get f24 => copyWith(fontSize: FontSizes.f24);
  TextStyle get f26 => copyWith(fontSize: FontSizes.f26);
  TextStyle get f20 => copyWith(fontSize: FontSizes.f20);
  TextStyle get f18 => copyWith(fontSize: FontSizes.f18);
  TextStyle get f34 => copyWith(fontSize: FontSizes.f34);
  TextStyle get f16 => copyWith(fontSize: FontSizes.f16);
  TextStyle get f14 => copyWith(fontSize: FontSizes.f14);
  TextStyle get f12 => copyWith(fontSize: FontSizes.f12);
  TextStyle get f36 => copyWith(fontSize: FontSizes.f36);
  TextStyle get f10 => copyWith(fontSize: FontSizes.f10);
  TextStyle get f30 => copyWith(fontSize: FontSizes.f30);
  TextStyle get f52 => copyWith(fontSize: FontSizes.f52);
  TextStyle get f32 => copyWith(fontSize: FontSizes.f32);
  TextStyle get f22 => copyWith(fontSize: FontSizes.f22);
  TextStyle get const50 => copyWith(fontSize: 50);
  TextStyle get const42 => copyWith(fontSize: 42);
  TextStyle get const24 => copyWith(fontSize: 24);
  TextStyle get const26 => copyWith(fontSize: 26);
  TextStyle get const20 => copyWith(fontSize: 20);
  TextStyle get const18 => copyWith(fontSize: 18);
  TextStyle get const34 => copyWith(fontSize: 34);
  TextStyle get const16 => copyWith(fontSize: 16);
  TextStyle get const14 => copyWith(fontSize: 14);
  TextStyle get const12 => copyWith(fontSize: 12);
  TextStyle get const36 => copyWith(fontSize: 36);
  TextStyle get const10 => copyWith(fontSize: 10);
  TextStyle get const30 => copyWith(fontSize: 30);
  TextStyle get const52 => copyWith(fontSize: 52);
  TextStyle get const32 => copyWith(fontSize: 32);
  TextStyle get const22 => copyWith(fontSize: 22);

  ///#DE1692
  TextStyle get primaryColor => copyWith(color: FontColors.primaryColor);

  ///#FFFFFF
  TextStyle get white => copyWith(color: Colors.white);

  ///#C7FFFF
  TextStyle get white78 => copyWith(color: FontColors.white78);

  ///#000000
  TextStyle get black => copyWith(color: Colors.black);

  ///#454F63
  TextStyle get greyDark => copyWith(color: FontColors.greyDark);

  ///#007AFF
  TextStyle get blueDark => copyWith(color: FontColors.blueDark);

  ///#959DAD
  TextStyle get greyMid => copyWith(color: FontColors.greyMid);

  ///#BFC5D3
  TextStyle get greyLight => copyWith(color: FontColors.greyLight);
  TextStyle get blueColor => copyWith(color: const Color(0xFF042d43));
  TextStyle get lightBlueColor => copyWith(color: const Color(0xFF385869));

  ///#EBEBEB
  TextStyle get greyVeryLight => copyWith(color: FontColors.greyVeryLight);

  TextStyle get secondaryColor => copyWith(color: FontColors.secondaryColor);
  TextStyle get textColorBlack => copyWith(color: FontColors.textColorBlack);
  TextStyle get textColorgrayBlue =>
      copyWith(color: FontColors.textColorgrayBlue);
  TextStyle get textColorgray => copyWith(color: FontColors.textColorgray);
  TextStyle get bgWhite => copyWith(color: FontColors.bgWhite);
  TextStyle get bgOffWhite => copyWith(color: FontColors.bgOffWhite);
  TextStyle get boxBorder => copyWith(color: FontColors.boxBorder);
  TextStyle get highlighter => copyWith(color: FontColors.highlighter);
  TextStyle get error => copyWith(color: FontColors.error);
  TextStyle get success => copyWith(color: FontColors.success);
  // TextStyle get primary => copyWith(color: FontColors.success);
}

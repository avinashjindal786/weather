import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/fonts_and_sizes.dart';

class WrapWidget extends StatelessWidget {
  String name;
  String image;
  bool forAccount;

  WrapWidget({
    required this.image,
    required this.name,
    required this.forAccount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: forAccount ? 98 : 74,
      height: forAccount ? 64 : 54,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFCCCCCC)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(image, width: 24, height: 24),
          const SizedBox(height: 2),
          Text(name, textAlign: TextAlign.center, style: TextStyles.urbanistRegular.const10.black.copyWith(letterSpacing: -0.50)),
        ],
      ),
    );
  }
}

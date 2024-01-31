import 'package:flutter/material.dart';

import '../../utils/fonts_and_sizes.dart';

class AppBarWithIcon extends StatelessWidget {
  final String title, imagePath;
  final bool isBackButton;
  final Function()? onBackTap;
  final List<Widget>? actions;
  final TextStyle? titleTextStyle;
  final Widget leadingIcon;
  final double? toolBarheight;
  const AppBarWithIcon({
    Key? key,
    this.imagePath = '',
    required this.title,
    this.isBackButton = false,
    this.onBackTap,
    this.titleTextStyle,
    this.actions,
    this.toolBarheight,
    this.leadingIcon = const Icon(
      Icons.arrow_back_ios,
      color: Colors.black,
      size: 18,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolBarheight,
      leadingWidth: isBackButton ? 50 : 20,
      leading: isBackButton
          ? IconButton(
              icon: leadingIcon,
              splashRadius: 1,
              padding: const EdgeInsets.all(0),
              onPressed: onBackTap,
            )
          : const SizedBox(),
      title: Row(
        children: [
          Text(
            title,
            style: titleTextStyle ?? TextStyles.urbanistBold.f30.black,
          ),
          const SizedBox(width: 10),
          imagePath.isNotEmpty
              ? Image.asset(
                  imagePath,
                  height: 20,
                  width: 20,
                )
              : const SizedBox()
        ],
      ),
      titleSpacing: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class CommonAppBar extends StatelessWidget {
  String name;
  VoidCallback onTap;
  CommonAppBar({
    required this.name,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: onTap, icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black)),
      title: Text(name, style: const TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      shape: Border(bottom: BorderSide(color: Colors.grey.withOpacity(.1), width: 3)),
    );
  }
}

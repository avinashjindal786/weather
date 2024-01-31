import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:flutter_assignment/core/provider/user.dart';
import 'package:flutter_assignment/core/services/needed_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../service_locator/service_locator.dart';
import '../../utils/fonts_and_sizes.dart';
import '../common_widget/common.dart';

class DrawerUtil {
  final NavigationService navigationService = locator<NavigationService>();
  static Drawer getDrawer(
    BuildContext context,
  ) {
    final NavigationService _navigationService = locator<NavigationService>();
    final NeededVariables _needVariable = locator<NeededVariables>();
    final provider = Provider.of<UserProvider>(context);
    return Drawer(
      width: 311,
      backgroundColor: Colors.white,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            width: 311,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: const Icon(
                                  Icons.close,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            (provider.userData?.profilePic) != null
                                ? CircleAvatar(
                                    radius: 74,
                                    backgroundImage: NetworkImage(provider.userData?.profilePic ?? ""),
                                  )
                                : CircleAvatar(
                                    radius: 74,
                                    backgroundColor: FontColors.primaryColor,
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Image.asset(
                                        "assets/images/user.png",
                                        color: FontColors.bgWhite,
                                      ),
                                    )),
                                  ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 135, // 311 - 50 - 102 - 24,
                              child: Text(
                                provider.userData?.fullName ?? "",
                                // "Add Model",
                                textAlign: TextAlign.center,
                                style: TextStyles.urbanistSemiBold.f16.black.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DrawerUtil().bottomItems(),
                      ],
                    ),
                    const SizedBox(height: 32),
                    InkWell(
                      onTap: () async {
                        _needVariable.sharedPreferences.clear();
                        _navigationService.clearStackAndShow(Routes.onbordingScreen);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: ShapeDecoration(
                          color: FontColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Center(child: Text('Log Out', style: TextStyles.urbanistBold.f18.copyWith(color: FontColors.bgWhite))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomItems() {
    List bottomContent = [
      {
        'title': "About Us",
        'icon': "assets/icons/iconamoon_information-circle.svg",
        'onTap': () {},
      },
      {
        'title': "FAQ",
        'icon': "assets/icons/FAQ.svg",
        'onTap': () {},
      },
      {
        'title': "Privacy Policy",
        'icon': "assets/icons/Privacy Policy.svg",
        'onTap': () {},
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          for (var i = 0; i < bottomContent.length; i++) singleBottomContainer(bottomContent[i]),
        ],
      ),
    );
  }

  Widget singleBottomContainer(Map currentData) {
    return GestureDetector(
      onTap: () {
        currentData['onTap']();
      },
      child: WrapWidget(
        name: currentData['title'],
        image: currentData['icon'],
        forAccount: false,
      ),
    );
  }
}

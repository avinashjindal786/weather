import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/fonts_and_sizes.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final NavigationService _navigationService = locator<NavigationService>();
  final NeededVariables _neededVariables = locator<NeededVariables>();

  @override
  Widget build(BuildContext context) {
    FontSizeConfig().init(context);
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.fill)),
          child: Column(
            children: [
              Hero(tag: "logo", child: Center(child: Image.asset("assets/images/Weather _))10 18.png"))),
              Text(
                "Weather",
                style: TextStyles.urbanistBold.white.f52,
              ),
              Text(
                "ForeCasts",
                style: TextStyles.urbanistBold.primaryColor.f52,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
              InkWell(
                onTap: () {
                  _navigationService.navigateToLoginScreen();
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
                  child: Center(child: Text('LogIn', style: TextStyles.urbanistBold.f18.copyWith(color: FontColors.bgWhite))),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  _navigationService.navigateToRegisterScreen();
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: ShapeDecoration(
                    color: FontColors.bgOffWhite,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50), side: BorderSide(color: FontColors.primaryColor, width: 5)),
                  ),
                  child: Center(child: Text('Register', style: TextStyles.urbanistBold.f18.copyWith(color: FontColors.primaryColor))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

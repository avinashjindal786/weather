import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/fonts_and_sizes.dart';
import '../../core/widgets/textfields/primary_textfield.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          extendBody: true,
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.fill)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.06,
                    ),
                    Hero(
                        tag: "logo",
                        child: Image.asset(
                          "assets/images/Weather _))10.png",
                          height: 190,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hi, Welcome Back!",
                      style: TextStyles.urbanistBold.f20.white,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.06,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PrimaryTextField(
                          hintText: 'Enter Email or Mob No.',
                          labelText: "Enter Email or Mob No.",
                          controller: model.email,
                          err: model.errorEmailText,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        PrimaryTextField(
                          hintText: 'Enter password',
                          labelText: 'Password',
                          controller: model.password,
                          err: model.errorPasswordText,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password",
                              style: TextStyles.urbanistMedium.f12.primaryColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () async {
                            await model.validationFunction(context);
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
                            child: model.isBusy
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Center(child: Text('LogIn', style: TextStyles.urbanistBold.f18.copyWith(color: FontColors.bgWhite))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                              RichText(
                                  textAlign: TextAlign.right,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Don't have an account",
                                      style: TextStyles.urbanistRegular.greyDark.f12.primaryColor,
                                    ),
                                    TextSpan(
                                      text: "\nRegister",
                                      style: TextStyles.urbanistMedium.f14.white,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _navigationService.navigateToRegisterScreen();
                                        },
                                    )
                                  ]))
                            ])),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

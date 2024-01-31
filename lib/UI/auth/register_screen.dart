import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/UI/auth/register_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/fonts_and_sizes.dart';
import '../../core/widgets/textfields/primary_textfield.dart';
import 'login_view_model.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            extendBody: true,
            body: Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyles.urbanistBold.f20.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: model.profilePath != null
                                ? CircleAvatar(
                                    radius: 74,
                                    backgroundImage: FileImage(File(model.profilePath!.path)),
                                  )
                                : CircleAvatar(
                                    radius: 74,
                                    backgroundColor: FontColors.bgWhite,
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Image.asset(
                                        "assets/images/user.png",
                                        color: FontColors.primaryColor,
                                      ),
                                    )),
                                  ),
                          ),
                          Positioned.fill(
                            bottom: 2,
                            right: -100,
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () async {
                                    model.cameraDialogFunc(context);
                                  },
                                  child: Image.asset(
                                    "assets/images/Vector.png",
                                    color: FontColors.primaryColor,
                                    width: 22,
                                    height: 22,
                                  ),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PrimaryTextField(
                            hintText: 'Enter Name',
                            labelText: "Enter Name",
                            controller: model.name,
                            err: model.errorEmailText,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          PrimaryTextField(
                            hintText: 'Enter Email',
                            labelText: 'Enter Email',
                            controller: model.email,
                            err: model.errorPasswordText,
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          PrimaryTextField(
                            hintText: 'Enter password',
                            labelText: 'Enter Password',
                            controller: model.password,
                            err: model.errorPasswordText,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          PrimaryTextField(
                            hintText: 'Enter password',
                            labelText: 'Enter Confirm Password',
                            controller: model.confirmPassword,
                            err: model.errorPasswordText,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.08,
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
                              child: Center(
                                  child: model.isBusy
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text('Register', style: TextStyles.urbanistBold.f18.copyWith(color: FontColors.bgWhite))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![1]);
    startTimer(5);
  }

  void startTimer(int seconds) {
    Duration duration = Duration(seconds: seconds);
    Timer timer = Timer(duration, onEnd);
  }

  void onEnd() async {
    await takePicture();
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      log(picture.path);
      Navigator.pop(context, picture);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Stack(children: [
        (_cameraController.value.isInitialized)
            ? CameraPreview(_cameraController)
            : Container(
                color: Colors.white,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ))),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(24)), color: Colors.black),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 30,
                  icon: Icon(_isRearCameraSelected ? CupertinoIcons.switch_camera : CupertinoIcons.switch_camera_solid, color: Colors.white),
                  onPressed: () {
                    setState(() => _isRearCameraSelected = !_isRearCameraSelected);
                    initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                  },
                )),
                Expanded(
                    child: IconButton(
                  onPressed: takePicture,
                  iconSize: 50,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.circle, color: Colors.white),
                )),
                const Spacer(),
              ]),
            )),
      ]),
    );
  }
}

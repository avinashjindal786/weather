
import 'package:flutter_assignment/UI/auth/register_screen.dart';
import 'package:flutter_assignment/UI/splash_screen/onbording_screen.dart';
import 'package:flutter_assignment/UI/splash_screen/splash_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import '../UI/auth/login.dart';
import '../UI/home/home_screen.dart';



@StackedApp(routes: [
  AdaptiveRoute(page: LoginScreen,initial: false), 
  AdaptiveRoute(page: SplashScreen,initial: true), 
  AdaptiveRoute(page: HomeScreen, initial: false),
  AdaptiveRoute(page: OnbordingScreen, initial: false),
  AdaptiveRoute(page: RegisterScreen, initial: false), 
  // AdaptiveRoute(page: HomeScreen)
])
class App {
  //empty class, will be filled after code generation
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:flutter_assignment/UI/auth/login.dart' as _i2;
import 'package:flutter_assignment/UI/auth/register_screen.dart' as _i6;
import 'package:flutter_assignment/UI/home/home_screen.dart' as _i4;
import 'package:flutter_assignment/UI/splash_screen/onbording_screen.dart'
    as _i5;
import 'package:flutter_assignment/UI/splash_screen/splash_screen.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const loginScreen = '/login-screen';

  static const splashScreen = '/';

  static const homeScreen = '/home-screen';

  static const onbordingScreen = '/onbording-screen';

  static const registerScreen = '/register-screen';

  static const all = <String>{
    loginScreen,
    splashScreen,
    homeScreen,
    onbordingScreen,
    registerScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i2.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i3.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.homeScreen,
      page: _i4.HomeScreen,
    ),
    _i1.RouteDef(
      Routes.onbordingScreen,
      page: _i5.OnbordingScreen,
    ),
    _i1.RouteDef(
      Routes.registerScreen,
      page: _i6.RegisterScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(
        orElse: () => const LoginScreenArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i2.LoginScreen(key: args.key),
        settings: data,
      );
    },
    _i3.SplashScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.SplashScreen(),
        settings: data,
      );
    },
    _i4.HomeScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.HomeScreen(),
        settings: data,
      );
    },
    _i5.OnbordingScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i5.OnbordingScreen(),
        settings: data,
      );
    },
    _i6.RegisterScreen: (data) {
      final args = data.getArgs<RegisterScreenArguments>(
        orElse: () => const RegisterScreenArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i6.RegisterScreen(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginScreenArguments {
  const LoginScreenArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class RegisterScreenArguments {
  const RegisterScreenArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant RegisterScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToLoginScreen({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        arguments: LoginScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnbordingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onbordingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterScreen({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registerScreen,
        arguments: RegisterScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        arguments: LoginScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnbordingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onbordingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterScreen({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.registerScreen,
        arguments: RegisterScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

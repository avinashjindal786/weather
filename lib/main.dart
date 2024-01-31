import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/core/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.router.dart';
import 'core/service_locator/service_locator.dart';
import 'core/services/needed_utils.dart';
import 'firebase_options.dart';

const bool _intialized = false;

Future<void> loadNecessaryAssets() async {
  await locator<NeededVariables>().load(token: "fcmToken", type: Platform.isIOS ? 'IOS' : 'ANDROID', version: "");
}

void main() async {
  configureServicesSetup();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await loadNecessaryAssets();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
          scaffoldBackgroundColor: const Color.fromRGBO(245, 251, 255, 1),
          canvasColor: Colors.transparent,
          primaryColor: const Color.fromRGBO(238, 84, 49, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}



// Step for run the application
// 1. flutter clean
// 2. flutter pub get
// 3. flutter pub run build_runner build --delete-conflicting-outputs
// 4. flutter run
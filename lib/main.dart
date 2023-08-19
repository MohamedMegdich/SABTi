import 'package:flutter/material.dart';
import 'package:sabti/Screens/Welcome/welcome_screen.dart';
import 'package:sabti/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sabti/screens/falahhome/falah_home.dart';
import 'package:camera/camera.dart';
import 'package:sabti/splash_screen.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales,
      debugShowCheckedModeBanner: false,
      title: 'Sabti',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Splash(),
    );
  }
}

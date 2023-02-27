import "package:flutter/material.dart";
import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:version1_2/screens/counter_screen.dart';
//import 'package:version1_2/screens/home_screen.dart';
import 'package:version1_2/screens/login.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  runApp(const Myapp());
}

void setup() async {
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Corresponsales-ASTRONET',
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        theme: ThemeData(fontFamily: 'Dosis'));
    //debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

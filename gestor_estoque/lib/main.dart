import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestor_estoque/pages/authentication/login_page.dart';

void main() async {
  var options = const FirebaseOptions(
    apiKey: "AIzaSyBv_GHqByYAJSFhT8byxL_MNsftH9_cq3Y",
    authDomain: "commodities-98e71.firebaseapp.com",
    projectId: "commodities-98e71",
    storageBucket: "commodities-98e71.appspot.com",
    messagingSenderId: "947845104499",
    appId: "1:947845104499:web:1062b2c575a00d0d6d3b06",
    measurementId: "G-NGQTLZ9J95",
  );
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(options: options);
  } else {
    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
            apiKey: 'AIzaSyCwBt6dcJs9gbbDQHN2palLMLiXGXopebE',
            appId: '1:947845104499:android:ec456f48bbe4fc696d3b06',
            messagingSenderId: '947845104499',
            projectId: 'commodities-98e71',
          ))
        : Firebase.initializeApp();
    // await Hive.initFlutter();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Commodities App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 7, 39, 1)),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

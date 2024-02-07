import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskr/auth/auth.dart';
import 'package:taskr/firebase_options.dart';
import 'package:taskr/screens/add.dart';
import 'package:taskr/screens/home.dart';
import 'package:taskr/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {'/': (context) => Auth(), '/add': (context) => Add()},
    );
  }
}

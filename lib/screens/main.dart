import 'package:camera/screens/splash.dart';
import 'package:flutter/material.dart';

import '../model/db_model/db_function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await createdatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const splash(),
    );
  }
}

import 'package:camera/screens/Homescreen.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    log();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
            height: 240,
            image: AssetImage('assets/images/pngwing.com (1).png')),
      ),
    );
  }

  Future<void> log() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Homecsreen(),
    ));
  }
}

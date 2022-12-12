import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miningapp/ad_helper.dart';
import 'package:miningapp/ad_method.dart';
import 'package:miningapp/ad_view.dart';
import 'package:miningapp/firstscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/splash_bg.png',
                ))),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Positioned(
                top: 190,
                left: 65,
                child: Image.asset(
                  'assets/images/min.png',
                  height: 270,
                  width: 270,
                ),
              ),
              Positioned(
                  left: 150,
                  top: 410,
                  child: Text(
                    'Mining App',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Positioned(
                  bottom: 80,
                  left: 160,
                  child: Image.asset(
                    'assets/images/loader.gif',
                    height: 80,
                    width: 80,
                    color: Colors.white,
                  ))
            ])));
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => FirstScreen(),
      ));
    });
  }
}

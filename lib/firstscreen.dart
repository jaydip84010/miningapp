import 'package:flutter/material.dart';
import 'package:miningapp/second_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final Uri _url = Uri.parse('https://play646.atmequiz.com/start');
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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Coin Mining',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Center(
                child: Text(
                  'Secure and Valuable \n \t\t\t coin currency',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        InkWell(
                          child: Image.asset(
                            'assets/images/btn_cont.png',
                            height: 120,
                            width: 200,
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SecondScreen()));
                          },highlightColor: Colors.transparent,
                        ),
                        Positioned(
                            top: 70,
                            child: InkWell(
                              child: Image.asset(
                                'assets/images/ad1.png',
                                height: 120,
                                width: 200,
                              ),onTap: (){
                                launchUrl(_url);
                            },highlightColor: Colors.transparent,
                            ))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

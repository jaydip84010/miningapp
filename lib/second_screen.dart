import 'package:flutter/material.dart';
import 'package:miningapp/miningscreen.dart';
import 'package:miningapp/start_mine_Page.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
                  'Multiple Way to Earn',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      launchUrl(_url);
                    },
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 300,
                      child: Stack(children: [Image.asset(
                        'assets/images/ad2.png',
                        height: 120,
                        width: 200,
                      ),
                        Positioned(top: 70,child:  InkWell(
                          highlightColor: Colors.transparent,
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiningScreen(),));
                          },
                          child: Image.asset(
                            'assets/images/btn_next.png',
                            height: 120,
                            width: 200,
                          ),
                        ))],),
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

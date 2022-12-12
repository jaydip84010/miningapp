import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miningapp/start_mine_Page.dart';

class UpgradePage extends StatefulWidget {
  const UpgradePage({Key? key}) : super(key: key);

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  bool visible = false;
  bool visible1 = false;
  bool visible2 = true;

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
              body: Center(
                  child: Column(
                children: [
                  Visibility(
                    visible: visible,
                    child: Column(
                      children: [
                        Image.asset('assets/images/icons8-checkmark.gif',
                            height: 200, width: 200),
                        Text(
                          'Speed Boost Activated',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Visibility(
                      visible: visible1,
                      child: Image.asset(
                        'assets/images/rocket-joypixels.gif',
                        height: 200,
                        width: 200,
                      )),
                  SizedBox(
                    height: 100,
                  ),
                  Visibility(
                    visible: visible2,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          visible1 = true;
                          Timer(Duration(seconds: 3), () {
                            setState(() {
                              visible = true;
                              visible1 = false;
                              visible2 = false;
                            });
                          });
                          Timer(Duration(seconds: 5), () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StartMinePage(),
                            ));
                          });
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => StartMinePage(),
                        //     ));
                      },
                      child: Container(
                        height: 60,
                        width: 260,
                        child: Center(
                          child: Text(
                            'Upgrade Speed',
                            style: TextStyle(fontSize: 23, color: Colors.brown),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              )))),
    );
  }
}

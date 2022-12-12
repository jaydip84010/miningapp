import 'package:flutter/material.dart';
import 'package:miningapp/start_mine_Page.dart';
import 'package:miningapp/wallpaper_page.dart';

class MiningScreen extends StatefulWidget {
  const MiningScreen({Key? key}) : super(key: key);

  @override
  State<MiningScreen> createState() => _MiningScreenState();
}

class _MiningScreenState extends State<MiningScreen> {
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
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Image.asset('assets/images/iv_back.png',
                          height: 35, width: 35),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      highlightColor: Colors.transparent,
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
                    Image.asset('assets/images/q3.gif', height: 35, width: 35),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Stack(
                        children: [
                          InkWell(
                            child: Image.asset(
                              'assets/images/btn_start_mining.png',
                              height: 130,
                              width: 210,
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StartMinePage(),
                              ));
                            },
                            highlightColor: Colors.transparent,
                          ),
                          Positioned(
                              top: 70,
                              child: InkWell(
                                child: Image.asset(
                                  'assets/images/btn_wallpaper.png',
                                  height: 130,
                                  width: 210,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WallpaperPage(),
                                  ));
                                },highlightColor: Colors.transparent,
                              )),
                          Positioned(
                              top: 140,
                              child: Image.asset(
                                'assets/images/btn_how_mining.png',
                                height: 130,
                                width: 210,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

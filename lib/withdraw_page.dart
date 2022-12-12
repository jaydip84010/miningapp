import 'package:flutter/material.dart';
import 'package:miningapp/start_mine_Page.dart';
import 'package:miningapp/top_lst.dart';
import 'package:miningapp/upgrade_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'invite_page.dart';
import 'lifetime_earning.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final Uri _url = Uri.parse('https://www.freeprivacypolicy.com/live/e5568a62-27c1-4d16-add4-1f9c7e460c90');
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
          key: key,
          drawer:drawerinit() ,
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Column(
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
                          onTap: () {
                            key.currentState!.openDrawer();
                          },
                          child: Image.asset(
                            'assets/images/threelinebar.png',
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          )),
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
                      Image.asset('assets/images/q1.gif',
                          height: 40, width: 40),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/vec_withdraw.png',
                  height: 250,
                  width: 250,
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/Group 1072.png',
                  height: 80,
                  width: 210,
                )
              ],
            ),
            Positioned(
              bottom: 20,
              left: 25,
              child: Container(
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/wh_home.png',
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),onTap: (){Navigator.of(context)
                        .push(MaterialPageRoute(
                      builder: (context) => StartMinePage(),
                    ));},highlightColor: Colors.transparent
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/wh_wallet.png',
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Wallet',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),onTap: (){Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => LifetimeEarning(),
                    ));},highlightColor: Colors.transparent,
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/wh_top.png',
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Top',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),onTap: (){Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => TopLst(),
                    ));},highlightColor: Colors.transparent
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/wh_invite.png',
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Invite',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),onTap: (){Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => InvitePage(),
                    ));},highlightColor: Colors.transparent
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/wh_withdraw.png',
                            height: 25,
                            width: 25,
                            color:Color(0xffffbb01),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Withdraw',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color:Color(0xffffbb01)),
                          )
                        ],
                      ),highlightColor: Colors.transparent
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  drawerinit() {
    return Drawer(
      backgroundColor: Color(0xff342b2b),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          ListTile(leading: InkWell(onTap:(){Navigator.pop(context);},child: Image.asset('assets/images/iv_back.png',height:35,width: 35,)),title: Text('Coin Mining',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),),
          SizedBox(
            height: 5,
          ),
          ListTile(
            title: const Text(
              'Upgrade Speed',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>UpgradePage() ,));
            },
          ),
          ListTile(
            title: const Text('Share App',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            onTap: () async {
              Navigator.of(context).pop();
              Share.share('hello');
            },
          ),
          ListTile(
              title: const Text(' Rate App',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () async {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Center(
                          child: Text(
                            'if any bug or issue write review in Playstore',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )),
                    );
                  },
                );
              }),

          ListTile(
              title: const Text('Privacy Policy',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () async {
                Navigator.of(context).pop();
                launchUrl(_url);

              }),
        ],
      ),
    ); //Deawer
  }
}

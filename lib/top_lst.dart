import 'package:flutter/material.dart';
import 'package:miningapp/start_mine_Page.dart';
import 'package:miningapp/upgrade_page.dart';
import 'package:miningapp/withdraw_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'invite_page.dart';
import 'lifetime_earning.dart';
import 'model.dart';

class TopLst extends StatefulWidget {
  const TopLst({Key? key}) : super(key: key);

  @override
  State<TopLst> createState() => _TopLstState();
}

class _TopLstState extends State<TopLst> {
  List<model> lst = [
    model(coin: '7123 Coin', name: 'Ram Pathak'),
    model(coin: '7100 Coin', name: 'Riya Pandey'),
    model(coin: '6900 Coin', name: 'Gita Ramani'),
    model(coin: '6885 Coin', name: 'Jaydip Virani'),
    model(coin: '6870 Coin', name: 'Ankit Patel'),
    model(coin: '6820 Coin', name: 'Parth Ghori'),
    model(coin: '6700 Coin', name: 'Dhruv Jain'),
    model(coin: '6500 Coin', name: 'Ritul Manek'),
    model(coin: '6200 Coin', name: 'Rohan Sharma'),
    model(coin: '5900 Coin', name: 'Vidhyut Patel')
  ];
  final Uri _url = Uri.parse('https://www.freeprivacypolicy.com/live/e5568a62-27c1-4d16-add4-1f9c7e460c90');
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
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
                  margin: EdgeInsets.only(right: 20,left: 20),
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
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.25,
                    width:MediaQuery.of(context).size.width/1.01,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 60,
                              width: 360,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        '${lst[index].coin}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff342a2a),
                                            fontWeight: FontWeight.w400),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '${lst[index].name}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff342a2a),
                                            fontWeight: FontWeight.w400),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    ),
                  ),
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
                        .pushReplacement(MaterialPageRoute(
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
                    ));},highlightColor: Colors.transparent
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/wh_top.png',
                            height: 25,
                            width: 25,
                            color:Color(0xffffbb01),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Top',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color:Color(0xffffbb01)),
                          )
                        ],
                      ),highlightColor: Colors.transparent
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
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Withdraw',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),onTap: (){Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                      builder: (context) => WithdrawPage(),
                    ));},highlightColor: Colors.transparent
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

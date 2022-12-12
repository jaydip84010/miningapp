import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miningapp/invite_page.dart';
import 'package:miningapp/lifetime_earning.dart';
import 'package:miningapp/top_lst.dart';
import 'package:miningapp/upgrade_page.dart';
import 'package:miningapp/withdraw_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class StartMinePage extends StatefulWidget {
  const StartMinePage({Key? key}) : super(key: key);

  @override
  State<StartMinePage> createState() => _StartMinePageState();
}

class _StartMinePageState extends State<StartMinePage> {
  final Uri _url = Uri.parse('https://www.freeprivacypolicy.com/live/e5568a62-27c1-4d16-add4-1f9c7e460c90');
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  Future<SharedPreferences>? pref = SharedPreferences.getInstance();
  Color? color;
  Timer? _timer;
  int _start = 10;
  String timetext = "START";
  var coin=0;
  var data;

  savepref() async {
    if(coin==null){
      return coin=0;
    }else{
      setState(() {
        coin=int.parse(data)+20;
      });
      await pref?.then((value) => value.setString('coin', coin.toString()));
    }
  }

  getpref() async {
    data = await pref?.then((value) => value.getString('coin'));
    setState(() {
     if(data==null){
       setState(() {
         data='0';
       });
     }
     else{
       setState(() {
         data=data;
       });
     }
    });
  }

  @override
  void initState() {
    super.initState();
    getpref();
  }

  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
          drawer: drawerinit(),
          key: key,
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
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
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Center(
                              child: Text(
                                  _start == 10
                                      ? 'START'
                                      : '00:00:0' + _start.toString(),
                                  style: TextStyle(
                                      color: Color(0xff3b2922),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/start_btn.png')),
                          ),
                          height: 140,
                          width: 140,
                        ),
                        onTap: () {
                          opendialog();
                        },
                        highlightColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Group 1056 (1).png',
                            height: 100,
                            width: 250,
                          ),
                          Positioned(
                              top: 40,
                              left: 200,
                              child: Text(data
                                ,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/Group 1057.png',
                              height: 120,
                              width: 200,
                            ),
                            Positioned(
                              top: 70,
                              child: Image.asset(
                                'assets/images/Group 1058.png',
                                height: 120,
                                width: 200,
                              ),
                            ),
                            Positioned(
                                top: 52,
                                left: 150,
                                child: Text(
                                  data,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )),
                            Positioned(
                                top: 122,
                                left: 110,
                                child: Text(
                                  '0.0000000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                            color: Color(0xffffbb01),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffbb01)),
                          )
                        ],
                      ),
                      highlightColor: Colors.transparent,
                    ),
                    InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/wh_wallet.png',
                              height: 25,
                              width: 25,
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
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => LifetimeEarning(),
                          ));
                        },
                        highlightColor: Colors.transparent),
                    InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/wh_top.png',
                              height: 25,
                              width: 25,
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
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => TopLst(),
                          ));
                        },
                        highlightColor: Colors.transparent),
                    InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/wh_invite.png',
                              height: 25,
                              width: 25,
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
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => InvitePage(),
                          ));
                        },
                        highlightColor: Colors.transparent),
                    InkWell(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/wh_withdraw.png',
                              height: 25,
                              width: 25,
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
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => WithdrawPage(),
                          ));
                        },
                        highlightColor: Colors.transparent)
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

  opendialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Color(0xffffbb01),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 300,
            width: 350,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Start Mining',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      startTimer();
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        'Mining',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  child: Center(
                    child: Text(
                      'Start Quiz',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    opendialog1();
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        'Fast Mining',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  opendialog1() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Color(0xffffbb01),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 250,
            width: 350,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Fast Mining',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpgradePage(),));
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        'Start Mining',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void startTimer() {
    const oneSec = const Duration(
      seconds: 1,
    );
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _start = 10;
          });
          if (_start == 10) {
            savepref();
            getpref();
          }
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}

// class Countdownt extends StatefulWidget {
//   const Countdownt({Key? key}) : super(key: key);
//
//   @override
//   State<Countdownt> createState() => _CountdowntState();
// }
//
// class _CountdowntState extends State<Countdownt> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Countdown(
//         seconds: 10,
//         build: (p0, p1) {
//           return Column(
//             children: [
//               Text(p1.toString()),
//               Container(
//                   height: 50,
//                   width: 150,
//                   child: ElevatedButton(onPressed: () {}, child: Center(child: Text(''),)))
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

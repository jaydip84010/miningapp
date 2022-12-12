import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miningapp/ad_helper.dart';

class AdView extends StatefulWidget {
  const AdView({Key? key}) : super(key: key);

  @override
  State<AdView> createState() => _AdViewState();
}

class _AdViewState extends State<AdView> {
  AdHelper ads = AdHelper();

  @override
  void initState() {
    super.initState();
    ads.loadBannerAd();
    Timer(Duration(seconds: 5), () {
      ads.loadinterAd();
    });

    Timer(Duration(seconds: 8), () {
      ads.loadRewardAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ads.bannerAd != null
          ? Container(
              height: 300.0,
              alignment: Alignment.center,
              child: AdWidget(ad: ads.bannerAd!),
            )
          : Container(
              height: 200,
            ),
    ));
  }
}

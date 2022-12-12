import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdHelper {
  bool isAdLoaded = false;
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;
  NativeAd? nativeAd;

  loadBannerAd() {
    String adunitid = Platform.isAndroid
        ? "ca-app-pub-3940256099942544/6300978111"
        : "ca-app-pub-3940256099942544/2934735716";
    BannerAdListener listener = BannerAdListener(onAdLoaded: (ad) {
      bannerAd!.load();
      print("success");
    }, onAdFailedToLoad: (ad, error) {
      bannerAd!.dispose();
      print('failed');
    });
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: adunitid,
        listener: listener,
        request: AdRequest());

    bannerAd!.load();
  }

  loadinterAd() {
    String unitid = Platform.isAndroid
        ? "ca-app-pub-3940256099942544/1033173712"
        : "ca-app-pub-3940256099942544/4411468910";
    InterstitialAd.load(
      adUnitId: unitid,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          interstitialAd!.show();
          interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) => print('add success full'),
            onAdFailedToShowFullScreenContent: (ad, error) =>
                print('failed ad full'),
          );
        },
        onAdFailedToLoad: (error) {
          print('failed');
        },
      ),
    );
  }

  loadRewardAd() {
    String unitid = Platform.isAndroid
        ? "ca-app-pub-3940256099942544/5224354917"
        : "ca-app-pub-3940256099942544/1712485313";
    RewardedAd.load(
        adUnitId: unitid,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: ((ad) {
            rewardedAd = ad;
            rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
              onAdFailedToShowFullScreenContent: (ad, error) => print('Failed'),
              onAdShowedFullScreenContent: (ad) => print('successful'),
            );
            rewardedAd!.show(
              onUserEarnedReward: (ad, reward) {
                print('reward added');
              },
            );
          }),
          onAdFailedToLoad: (error) {
            print('failed');
          },
        ));
  }
  loadsml() {
    nativeAd = NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      factoryId: 'listTileSmall',
      request: AdRequest(),
      listener: NativeAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          isAdLoaded = true;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
        // Called when a click is recorded for a NativeAd.
        onAdClicked: (Ad ad) => print('Ad clicked.'),
      ),
    )..load();
  }

  loadmid() {
    nativeAd = NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      factoryId: 'listTileMedium',
      request: AdRequest(),
      listener: NativeAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          isAdLoaded = true;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
        // Called when a click is recorded for a NativeAd.
        onAdClicked: (Ad ad) => print('Ad clicked.'),
      ),
    )..load();
  }
}

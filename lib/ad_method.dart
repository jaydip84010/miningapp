import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMethod {
  AdMethod({this.ad});
   static bool isloaded=false;
   NativeAd? ad;
   showad(){
     ad= NativeAd(
       adUnitId: 'ca-app-pub-3940256099942544/2247696110',
       factoryId: 'listTileMedium',
       request: AdRequest(),
       listener: NativeAdListener(
         // Called when an ad is successfully received.
         onAdLoaded: (Ad ad) {
           isloaded=true;
           var _add = ad as NativeAd;
           print("**** AD ***** ${_add.responseInfo}");
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
     );
     ad!.load();
   }
}

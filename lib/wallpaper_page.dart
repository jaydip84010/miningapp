import 'package:flutter/material.dart';
import 'package:miningapp/model.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({Key? key}) : super(key: key);

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  List<wallpaper> lst = [
    wallpaper(img: 'assets/images/wa1.jpg'),
    wallpaper(img: 'assets/images/wa2.webp'),
    wallpaper(img: 'assets/images/wa3.jpg'),
    wallpaper(img: 'assets/images/wa4.jpg'),
    wallpaper(img: 'assets/images/wa5.jpg'),
    wallpaper(img: 'assets/images/wa6.jpg'),
    wallpaper(img: 'assets/images/wa7.jpg'),
    wallpaper(img: 'assets/images/wa8.webp'),
  ];

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
                        'Wallpaper',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          wordSpacing: 1,
                        ),
                      ),
                    ),
                    Image.asset('assets/images/q4.gif', height: 35, width: 35),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 1.15,
                  width: MediaQuery.of(context).size.width/1.03,
                  child: GridView.builder(
                    itemCount: lst.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,width: 200,
                        child: ClipRRect(borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                          '${lst[index].img}',
                          fit: BoxFit.fill,
                        )),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

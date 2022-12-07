import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';

class ViewSplash extends GetView {
  const ViewSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setNavigationBarColor(
      const Color(0xff140f0b),
      animate: true,
    );
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // background
          Image.asset(
            'images/splash_screen.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),

          // foreground
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // safe area
                SafeArea(child: Container()),

                Container(
                  margin: const EdgeInsets.only(left: 24, top: 24),
                  child: Icon(
                    Icons.explore_rounded,
                    color: Colors.white.withOpacity(.64),
                  ),
                ),
                // title
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    top: 16,
                    right: 24,
                  ),
                  child: Text(
                    'It\'s a Big World',
                    style: TextStyle(
                      fontSize: Get.textTheme.headline6!.fontSize,
                      color: Colors.white.withOpacity(.64),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 8,
                  ),
                  child: Text(
                    'Out There,\nGo Explore',
                    style: TextStyle(
                      color: const Color(0xffe7c5ae),
                      fontWeight: FontWeight.bold,
                      fontSize: Get.textTheme.headline4!.fontSize,
                    ),
                  ),
                ),
                const Spacer(),

                // card
                Container(
                  margin: const EdgeInsets.all(24),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    color: Colors.white.withOpacity(.08),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: screenWidth - 48,
                      sigmaY: screenWidth - 48,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Explore the world here',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.theme.textTheme.headline5!.fontSize,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'The best travel app in the world in 2022. Answer of traveler to find their journey.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.64),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),

                          // button get started
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Get.offAllNamed('/'),
                                child: SizedBox(
                                  height: 48,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Get Started',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Icon(Icons.arrow_forward_rounded),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // button not now
                          Container(
                            margin: const EdgeInsets.only(top: 24),
                            child: InkWell(
                                child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                  color: Colors.white.withOpacity(.64),
                                  width: 1.32,
                                )),
                              ),
                              child: Text(
                                'Not now',
                                style: TextStyle(
                                  fontSize: Get.textTheme.bodyText1!.fontSize,
                                  color: Colors.white.withOpacity(.64),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

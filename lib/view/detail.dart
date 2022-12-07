import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:wisata_solo/components/blur_favorite_button.dart';
import 'package:wisata_solo/models/tourism.dart';

import '../components/blur_back_button.dart';

class ViewDetail extends GetView {
  const ViewDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setNavigationBarColor(
      Colors.white,
      animate: true,
    );
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);

    return Scaffold(
      body: _body,
    );
  }

  get _body {
    ModelTourism modelTourism = Get.arguments as ModelTourism;
    return Stack(
      children: [
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'image-${modelTourism.name!}',
                  child: Image.asset(
                    modelTourism.imageAsset!,
                    width: double.infinity,
                    height: (Get.height * 2 / 5),
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 24,
                  ),
                  child: Hero(
                    tag: 'name-${modelTourism.name!}',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        modelTourism.name!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: Get.textTheme.headline4!.fontSize,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 12,
                  ),
                  child: Row(children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Color(0xff1d4964),
                    ),
                    const SizedBox(width: 12),
                    Hero(
                      tag: 'location-${modelTourism.name!}',
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          modelTourism.location!,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 24,
                  ),
                  child: Text(
                    modelTourism.description!,
                    style: TextStyle(
                      fontSize: Get.textTheme.bodyText1!.fontSize,
                      color: Colors.black.withOpacity(.64),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),

                // rating
                Container(
                  margin: const EdgeInsets.all(24),
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    color: Colors.black.withOpacity(.72),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 24,
                        sigmaY: 24,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: Get.textTheme.headline5!.fontSize,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '4.3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Get.textTheme.subtitle1!.fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // more images
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 24,
                    bottom: 12,
                  ),
                  child: Text(
                    'More images',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Get.textTheme.headline6!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 1 / 4,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: index == 0 ? 24 : 8,
                          right: index == modelTourism.imageUrls!.length - 1
                              ? 24
                              : 0,
                        ),
                        child: Image.network(
                          modelTourism.imageUrls![index],
                          height: Get.height * 1 / 4,
                          width: Get.width * 2 / 3,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    itemCount: modelTourism.imageUrls!.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                // button book now
                Container(
                  margin: const EdgeInsets.all(24),
                  alignment: Alignment.center,
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(28),
                    ),
                  ),
                  child: Text(
                    'Book now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )),

        // app bar
        Column(
          children: [
            SafeArea(child: Container()),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BlurBackButton(
                    margin: EdgeInsets.only(left: 24),
                  ),
                  Hero(
                    tag: 'button-favorite-${modelTourism.name!}',
                    child: const BlurFavoriteButton(
                      margin: EdgeInsets.only(right: 24),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

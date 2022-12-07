import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:wisata_solo/components/blur_favorite_button.dart';
import 'package:wisata_solo/controllers/home.dart';
import 'package:wisata_solo/models/tourism.dart';

class ViewHome extends GetView<ControllerHome> {
  const ViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setNavigationBarColor(
      Colors.white,
      animate: true,
    );
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);

    return Scaffold(
      body: _body,
      backgroundColor: Colors.white,
    );
  }

  get _body {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // safe area
        SafeArea(child: Container()),

        Container(
          margin: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: 24,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                color: Color(0xff1d4964),
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.64),
                      fontWeight: FontWeight.normal,
                      fontSize: Get.textTheme.bodyText1!.fontSize,
                    ),
                  ),
                  Text(
                    'Central Java',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.textTheme.bodyText1!.fontSize,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        // title
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Text(
            'Where do you want to discover?',
            style: TextStyle(
              fontSize: Get.textTheme.headline5!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // search box
        InkWell(
          onTap: () => Get.offAllNamed('/splash'),
          child: Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.04),
              borderRadius: const BorderRadius.all(
                Radius.circular(48),
              ),
              // border: Border.all(
              //   color: Colors.black.withOpacity(.08),
              //   width: 1.32,
              // ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  color: Colors.black.withOpacity(.32),
                ),
                SizedBox(width: 24),
                Text(
                  'Search...',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.64),
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Tourist Attractions',
            style: TextStyle(
              fontSize: Get.textTheme.headline6!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              padEnds: true,
            ),
            items: controller.repositoryTourism
                .fetchAll()
                .map((ModelTourism modelTourism) {
              return _card(modelTourism);
            }).toList(),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Container _card(ModelTourism modelTourism) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.16), blurRadius: 8)
          ]),
      margin: const EdgeInsets.only(right: 24),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Get.toNamed(
            '/detail',
            arguments: modelTourism,
          ),
          child: Stack(
            children: [
              // background
              Hero(
                tag: 'image-${modelTourism.name!}',
                child: Image.asset(
                  modelTourism.imageAsset!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // foreground
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                            left: 24,
                            top: 24,
                          ),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.72),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 24,
                              sigmaY: 24,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    '4.3',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          )),
                      const Spacer(),
                      Hero(
                        tag: 'button-favorite-${modelTourism.name!}',
                        child: const BlurFavoriteButton(
                          margin: EdgeInsets.only(
                            right: 24,
                            top: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 24,
                    ),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      color: Colors.black.withOpacity(.72),
                    ),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 48,
                          sigmaY: 48,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.white.withOpacity(.64),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: 'name-${modelTourism.name!}',
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        modelTourism.name!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              Get.textTheme.bodyText1!.fontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Hero(
                                    tag: 'location-${modelTourism.name!}',
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        modelTourism.location!,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(.64),
                                          fontSize:
                                              Get.textTheme.caption!.fontSize,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

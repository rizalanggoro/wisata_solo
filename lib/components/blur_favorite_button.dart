import 'dart:ui';

import 'package:flutter/material.dart';

class BlurFavoriteButton extends StatelessWidget {
  final EdgeInsets? margin;

  const BlurFavoriteButton({
    Key? key,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttonSize = 48.0;

    return Container(
      margin: margin,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.72),
        borderRadius: BorderRadius.all(Radius.circular(buttonSize / 2)),
      ),
      child: SizedBox(
        height: 48,
        width: 48,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 24,
            sigmaY: 24,
          ),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Container(
                    height: buttonSize,
                    width: buttonSize,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                    )),
              )),
        ),
      ),
    );
  }
}

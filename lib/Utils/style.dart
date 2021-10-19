import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sixamtec/Utils/colors.dart';
import 'package:sixamtec/Utils/const.dart';

TextStyle greyTextMediumStyle() {
  return const TextStyle(
    fontSize: mediumFontSize,
    fontWeight: FontWeight.w400,
    color: greyTextColor,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.18,
    height: 1.5,
  );
}

Widget homeIcon = SvgPicture.asset('assets/images/home.svg');

TextStyle titleTextStyle() {
  return const TextStyle(
    fontSize: titleFontSize,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: blackTextColor,
    letterSpacing: 0.18,
    height: 1.5,
  );
}

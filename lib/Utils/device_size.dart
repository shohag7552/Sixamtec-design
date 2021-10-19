import 'package:flutter/material.dart';
import 'package:sixamtec/Enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  double devicewidth = 0;

  if (orientation == Orientation.landscape) {
    devicewidth = mediaQuery.size.height;
  } else {
    devicewidth = mediaQuery.size.width;
  }

  if (devicewidth > 950) {
    return DeviceScreenType.desktop;
  }
  if (devicewidth > 600) {
    return DeviceScreenType.tablet;
  }
  return DeviceScreenType.mobile;
}

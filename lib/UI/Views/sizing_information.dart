import 'package:flutter/cupertino.dart';
import 'package:sixamtec/Enums/device_screen_type.dart';

class SizingInformation {
  final Orientation? orientation;
  final DeviceScreenType? devicescreentype;
  final Size? screenSize;
  final Size? localwidgetsize;

  SizingInformation(
      {this.orientation,
      this.devicescreentype,
      this.screenSize,
      this.localwidgetsize});

  @override
  String toString() {
    return 'orientation: $orientation  DeviceType: $devicescreentype  screenSize:$screenSize  localwidgetsize: $localwidgetsize';
  }
}

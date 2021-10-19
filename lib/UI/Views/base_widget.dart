import 'package:flutter/material.dart';
import 'package:sixamtec/UI/Views/sizing_information.dart';
import 'package:sixamtec/Utils/device_size.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation)? builder;

  const BaseWidget({Key? key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          devicescreentype: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localwidgetsize:
              Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
        );
        return builder!(context, sizingInformation);
      },
    );
  }
}

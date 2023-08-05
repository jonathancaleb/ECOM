import 'package:am_ecom/util/dimensions.dart';
import 'package:am_ecom/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotAvailableWidget extends StatelessWidget {
  final double fontSize;
  final bool isStore;
  const NotAvailableWidget({Key? key, this.fontSize = 8, this.isStore = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            color: Colors.black.withOpacity(0.6)),
        child: Text(
          isStore ? 'closed_now'.tr : 'not_available_now_break'.tr,
          textAlign: TextAlign.center,
          style:
              robotoRegular.copyWith(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}

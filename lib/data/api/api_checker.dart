import 'package:am_ecom/controller/auth_controller.dart';
import 'package:am_ecom/controller/wishlist_controller.dart';
import 'package:am_ecom/helper/route_helper.dart';
import 'package:am_ecom/view/base/custom_snackbar.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) {
    if (response.statusCode == 401) {
      Get.find<AuthController>().clearSharedData();
      Get.find<WishListController>().removeWishes();
      Get.offAllNamed(GetPlatform.isWeb
          ? RouteHelper.getInitialRoute()
          : RouteHelper.getSignInRoute(RouteHelper.splash));
    } else {
      showCustomSnackBar(response.statusText, getXSnackBar: getXSnackBar);
    }
  }
}

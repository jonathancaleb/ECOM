import 'package:am_ecom/controller/store_controller.dart';
import 'package:am_ecom/controller/splash_controller.dart';
import 'package:am_ecom/helper/responsive_helper.dart';
import 'package:am_ecom/util/dimensions.dart';
import 'package:am_ecom/view/base/custom_app_bar.dart';
import 'package:am_ecom/view/base/footer_view.dart';
import 'package:am_ecom/view/base/menu_drawer.dart';
import 'package:am_ecom/view/base/no_data_screen.dart';
import 'package:am_ecom/view/screens/store/widget/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  final String? storeID;
  const ReviewScreen({Key? key, required this.storeID}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();

    Get.find<StoreController>().getStoreReviewList(widget.storeID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Get.find<SplashController>()
                  .configModel!
                  .moduleConfig!
                  .module!
                  .showRestaurantText!
              ? 'restaurant_reviews'.tr
              : 'store_reviews'.tr),
      endDrawer: const MenuDrawer(),
      endDrawerEnableOpenDragGesture: false,
      body: GetBuilder<StoreController>(builder: (storeController) {
        return storeController.storeReviewList != null
            ? storeController.storeReviewList!.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () async {
                      await storeController.getStoreReviewList(widget.storeID);
                    },
                    child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: FooterView(
                            child: SizedBox(
                                width: Dimensions.webMaxWidth,
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        ResponsiveHelper.isMobile(context)
                                            ? 1
                                            : 2,
                                    childAspectRatio: (1 / 0.2),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount:
                                      storeController.storeReviewList!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(
                                      Dimensions.paddingSizeSmall),
                                  itemBuilder: (context, index) {
                                    return ReviewWidget(
                                      review: storeController
                                          .storeReviewList![index],
                                      hasDivider: index !=
                                          storeController
                                                  .storeReviewList!.length -
                                              1,
                                    );
                                  },
                                )))),
                  )
                : Center(
                    child: NoDataScreen(
                        text: 'no_review_found'.tr, showFooter: true))
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

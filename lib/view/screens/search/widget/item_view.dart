import 'package:am_ecom/controller/search_controller.dart';
import 'package:am_ecom/util/dimensions.dart';
import 'package:am_ecom/view/base/footer_view.dart';
import 'package:am_ecom/view/base/item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemView extends StatelessWidget {
  final bool isItem;
  const ItemView({Key? key, required this.isItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SearchingController>(builder: (searchController) {
        return SingleChildScrollView(
          child: FooterView(
            child: SizedBox(
                width: Dimensions.webMaxWidth,
                child: ItemsView(
                  isStore: isItem,
                  items: searchController.searchItemList,
                  stores: searchController.searchStoreList,
                )),
          ),
        );
      }),
    );
  }
}

import 'package:emart_app/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var colorIndex = 0.obs;

  var subCat = [];

  getSubCatagories(title) async {
    subCat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decode = categoryModelFromJson(data);
    var s =
        decode.categories.where((element) => element.name == title).toList();
    for (var e in s[0].subcategory) {
      subCat.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex = index;
  }
}

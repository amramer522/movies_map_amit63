part of "cubit.dart";

class ProductsData
{
  late final List<ProductModel>list;

  ProductsData.fromJson(Map<String, dynamic> json){
    list = List.from(json["data"]??[]).map((e) => ProductModel.fromJson(e)).toList();
  }

}

class ProductModel {
  late final int categoryId, id;
  late final String title, description, image;
  late final num priceBefore, priceAfter, discount, amount;
  late  bool  isFavorite;
  late final bool isActive;
  late final UnitModel unit;
  late final List<ProductImage> images;

  void toggle(){
    isFavorite=!isFavorite;
  }


  ProductModel.fromJson(Map<String, dynamic> json) {
    categoryId = json["category_id"]??0;
    id = json["id"]??0;
    title = json["title"]??"";
    description = json["description"]??"";
    image = json["main_image"]??"";
    priceBefore = json["price_before_discount"]??0;
    priceAfter = json["price"]??0;
    discount = json["discount"]??0;
    amount = json["amount"]??0;
    isActive = json["is_active"] == 1;
    // isFavorite = id.isEven;
    isFavorite = json["is_favorite"]??false;
    unit = UnitModel.fromJson(json["unit"]??{});
    images = List.from(json["images"]??[]).map((e) => ProductImage.fromJson(e)).toList();
  }
}

class UnitModel {
  late final int id;
  late final String name, type;

  UnitModel.fromJson(Map<String, dynamic> json){
    id = json["id"]??0;
    name = json["name"]??"";
    type = json["type"]??"";
  }
}

class ProductImage {
  late final String  url;

  ProductImage.fromJson(Map<String, dynamic> json){
    url = json["url"]??"";
  }
}

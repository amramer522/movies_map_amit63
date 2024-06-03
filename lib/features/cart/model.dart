part of 'bloc.dart';

class CartData {
  late final List<ProductModel> list;
  late final num totalPriceBeforeDiscount,
      totalDiscount,
      totalPriceWithVat,
      deliveryCost,
      freeDeliveryPrice,
      minVipPrice,
      vipDiscountPercentage;
  late num vat;

  late final bool isVip;
  late final String vipMessage;


  double get totalBeforeDiscount{
    double result = 0;
    list.forEach((element) {
      result +=   element.priceBeforeDiscount * element.amount;
    });

    return result;
  }
  double get totalAfterDiscount{
    double result = 0;
    list.forEach((element) {
      result +=   element.price * element.amount;
    });

    return result;
  }


  String get totalDiscountCart {
    return (totalBeforeDiscount-totalAfterDiscount).toStringAsFixed(2);
  }



  CartData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => ProductModel.fromJson(e)).toList();
    totalPriceBeforeDiscount = json['total_price_before_discount']??0;
    totalDiscount = json['total_discount']??0;
    totalPriceWithVat = json['total_price_with_vat']??0;
    deliveryCost = json['delivery_cost']??0;
    freeDeliveryPrice = json['free_delivery_price']??0;
    vat = json['vat']??0;
    vat *=100;
    isVip = json['is_vip']==1;
    vipDiscountPercentage = json['vip_discount_percentage']??0;
    minVipPrice = json['min_vip_price']??0;
    vipMessage = json['vip_message']??"";
  }
}

class ProductModel {
  late final int id;
  late final String title,image;
  late final num priceBeforeDiscount,discount,price,remainingAmount;
  late num amount;

  void plus(){
    if(amount<remainingAmount)
      {
        amount++;
      }

  }
  void minus(){
    if(amount>1)
    {
      amount--;
    }
  }


  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    title = json['title']??"";
    image = "https://news.radioalgerie.dz/sites/default/data/2023-11/11841.jpg";
    // image = json['image']??"";
    amount = json['amount']??0;
    priceBeforeDiscount = json['price_before_discount']??0;
    discount = json['discount']??0;
    price = json['price']??0;
    remainingAmount = json['remaining_amount']??0;
  }
}

part of 'cubit.dart';

class SliderData {
  late final List<SliderModel> list;

  SliderData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data']??[]).map((e) => SliderModel.fromJson(e)).toList();
  }
}

class SliderModel {
  late final int id;
  late final String image;

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    image = json['media']??"";
  }
}

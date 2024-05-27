import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_amit63/core/dio_helper.dart';

part  'model.dart';
part  'states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  final DioHelper _dio;

  ProductsCubit(this._dio) : super(GetProductsLoadingState());


  Future<void> getData() async {
    final response = await _dio.get("products");

    if (response.isSuccess) {
      final list = ProductsData.fromJson(response.data).list;
      emit(GetProductsSuccessState(list: list));
    } else {
      emit(GetProductsFailedState(msg: response.message!));
    }
  }
}

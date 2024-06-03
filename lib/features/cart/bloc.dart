import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/dio_helper.dart';

part 'states.dart';

part 'events.dart';
part 'model.dart';

class CartBloc extends Bloc<CartEvents, CartStates> {
  final DioHelper _dio;

  CartBloc(this._dio) : super(GetCartLoadingState()) {
    on<GetCartEvent>(getData);
  }

  Future<void> getData(GetCartEvent event, Emitter<CartStates> emit) async {
    final response = await _dio.get("client/cart");

    if (response.isSuccess) {
      final model = CartData.fromJson(response.data);
      emit(GetCartSuccessState(model: model));
    } else {
      emit(GetCartFailedState(msg: response.message!));
    }
  }
}

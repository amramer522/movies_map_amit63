import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_amit63/core/helper_methods.dart';

import '../../core/dio_helper.dart';

part 'events.dart';

part 'states.dart';

class UpdateCartItemBloc extends Bloc<UpdateCartItemEvents, UpdateCartItemStates> {
  final DioHelper _dio;
  UpdateCartItemBloc(this._dio) : super(UpdateCartItemStates()) {
    on<UpdateCartItemEvent>(_sendData);
  }

  Future<void> _sendData(
    UpdateCartItemEvent event,
    Emitter<UpdateCartItemStates> emit,
  ) async {
    emit(UpdateCartItemLoadingState());

    final response = await _dio.send("client/cart/${event.id}",data: {
      "amount":event.isAdd?event.amount+1:event.amount-1,
      "_method":"PUT"
    });
    print("id :${event.id}");
    print("amount :${event.isAdd?event.amount+1:event.amount-1}");

    if(response.isSuccess)
      {
        showMessage("تم التعديل بنجاح");
        emit(UpdateCartItemSuccessState(id: event.id,isAdd: event.isAdd));
      }else
        {
          emit(UpdateCartItemFailedState(msg: response.message!));
        }


  }
}

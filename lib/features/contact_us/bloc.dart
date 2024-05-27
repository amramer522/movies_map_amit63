import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_amit63/core/dio_helper.dart';

part 'events.dart';
part 'states.dart';

class ContactUsBloc extends Bloc<ContactUsEvents, ContactUsStates> {
  final DioHelper _dio;

  ContactUsBloc(this._dio) : super(ContactUsStates()) {
    on<SendContactUsEvent>(_sendData);
  }

  final nameController = TextEditingController(text: "Amr");
  final phoneController = TextEditingController(text: "sfasfsfa");
  final titleController = TextEditingController(text: "dsdasdsa");
  final bodyController = TextEditingController(text: "sdadsdasd");

  Future<void> _sendData(
    SendContactUsEvent event,
    Emitter<ContactUsStates> emit,
  ) async {
    emit(SendContactUsLoadingState());
    final response = await _dio.send("contact", data: {
      "fullname": nameController.text,
      "phone": phoneController.text,
      "title": titleController.text,
      "content": bodyController.text,
    });
    if (response.isSuccess) {
      emit(SendContactUsSuccessState(msg: "Success"));
    } else {
      emit(SendContactUsFailedState(msg: response.message!));
    }
  }
}

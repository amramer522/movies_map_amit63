import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_amit63/core/dio_helper.dart';
import 'package:movies_amit63/views/terms/model.dart';
import 'package:movies_amit63/views/terms/states.dart';


class TermsCubit extends Cubit<TermsStates> {
  final DioHelper _dio;
  TermsCubit(this._dio) : super(GetTermsLoadingState());

  Future<void> getData() async {
    final response = await _dio.get("terms");
    if (response.isSuccess) {
      final model = TermsData.fromJson(response.data).model;
      emit(GetTermsSuccessState(model: model));
    } else {
      emit(GetTermsFailedState(msg: response.message!));
    }
  }
}

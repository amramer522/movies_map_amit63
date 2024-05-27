import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dio_helper.dart';
part 'model.dart';
part 'states.dart';
class CategoriesCubit extends Cubit<CategoriesStates> {
  final DioHelper _dio;

  CategoriesCubit(this._dio) : super(GetCategoriesLoadingState());

  Future<void> getData() async {
   final response = await _dio.get("categories");
    if (response.isSuccess) {
     final list = CategoriesData.fromJson(response.data).list;
      emit(GetCategoriesSuccessState(list: list));
    } else {
      emit(GetCategoriesFailedState(msg: response.message!));
    }
  }
}

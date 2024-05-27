

import 'package:get_it/get_it.dart';

import 'core/dio_helper.dart';
import 'features/contact_us/bloc.dart';
import 'views/counter/cubit.dart';
import 'views/login/cubit.dart';
import 'views/products/components/category_section/cubit.dart';
import 'views/products/components/products/cubit.dart';
import 'views/products/components/slider/cubit.dart';
import 'views/terms/cubit.dart';

void initServiceLocator()
{
  final container = GetIt.instance;

  container.registerSingleton(DioHelper());
  container.registerFactory(() => LoginCubit(GetIt.instance<DioHelper>()));
  container.registerFactory(() => ContactUsBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => TermsCubit(GetIt.instance<DioHelper>())..getData());
  container.registerFactory(() => CounterCubit());
  container.registerFactory(() => CategoriesCubit(GetIt.instance<DioHelper>())..getData());
  container.registerFactory(() => SliderCubit(GetIt.instance<DioHelper>())..getData());
  container.registerFactory(() => ProductsCubit(GetIt.instance<DioHelper>())..getData());


}

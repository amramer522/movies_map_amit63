part of "cubit.dart";
class ProductsStates{}

class GetProductsLoadingState extends ProductsStates{}
class GetProductsFailedState extends ProductsStates{
  final String msg;

  GetProductsFailedState({required this.msg});
}
class GetProductsSuccessState extends ProductsStates{
  final List<ProductModel> list;

  GetProductsSuccessState({required this.list});

}
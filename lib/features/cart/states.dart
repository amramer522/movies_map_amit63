part of 'bloc.dart';

class CartStates{}

class GetCartLoadingState extends CartStates{}
class GetCartSuccessState extends CartStates{
  final CartData model;

  GetCartSuccessState({required this.model});
}
class GetCartFailedState extends CartStates{
  final String msg;

  GetCartFailedState({required this.msg});
}
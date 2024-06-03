part of 'bloc.dart';

class UpdateCartItemEvents{}

class UpdateCartItemEvent extends UpdateCartItemEvents{
  final int id;
  final num amount;
  final bool isAdd;

  UpdateCartItemEvent({required this.isAdd ,required this.id, required this.amount});


}
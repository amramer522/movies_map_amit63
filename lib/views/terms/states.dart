import 'package:movies_amit63/views/terms/model.dart';

class TermsStates{}


class GetTermsLoadingState extends TermsStates{}
class GetTermsSuccessState extends TermsStates{
  final TermsModel model;

  GetTermsSuccessState({required this.model});

}
class GetTermsFailedState extends TermsStates{
  final String msg;

  GetTermsFailedState({required this.msg});

}
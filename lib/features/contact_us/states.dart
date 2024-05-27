part of 'bloc.dart';
class ContactUsStates{}

class SendContactUsLoadingState extends ContactUsStates{}
class SendContactUsSuccessState extends ContactUsStates{
  final String msg;

  SendContactUsSuccessState({required this.msg});
}
class SendContactUsFailedState extends ContactUsStates{
  final String msg;

  SendContactUsFailedState({required this.msg});

}
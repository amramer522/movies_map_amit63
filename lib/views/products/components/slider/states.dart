
part of 'cubit.dart';
class SliderStates{}

class GetSliderLoadingState extends SliderStates{}
class GetSliderFailedState extends SliderStates{
  final String msg;

  GetSliderFailedState({required this.msg});
}
class GetSliderSuccessState extends SliderStates{
  final List<SliderModel> list;

  GetSliderSuccessState({required this.list});

}
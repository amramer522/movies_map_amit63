
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_amit63/core/design/app_shimmer.dart';
import 'package:get_it/get_it.dart';

import 'cubit.dart';

part 'loading.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({super.key});

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  int currentIndex = 0;

  final cubit = GetIt.I<SliderCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is GetSliderFailedState) {
          return const Text("Failed");
        } else if (state is GetSliderSuccessState) {
          return Container(
            height: 232.h,
            margin:  EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 16.h),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.grey,
                    ),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 3),
                        onPageChanged: (index, reason) {
                          currentIndex = index;
                          setState(() {});
                        },
                      ),
                      itemBuilder: (context, index, realIndex) => Image.network(
                        state.list[index].image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      itemCount: state.list.length,
                    ),
                  ),
                ),
                 SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: EdgeInsetsDirectional.only(end: index != 4 ? 8.w : 0),
                            child: CircleAvatar(
                              radius: 6.r,
                              backgroundColor:
                                  const Color(0xff16A124).withOpacity(index == currentIndex ? 1 : .10),
                            ),
                          )),
                )
              ],
            ),
          );
        } else {
          return const _Loading();
        }
      },
    );
  }
}


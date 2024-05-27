import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_amit63/views/products/components/products/view.dart';
import 'package:movies_amit63/views/products/components/slider/view.dart';

import 'components/category_section/view.dart';
import 'components/slider/cubit.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final cubit = GetIt.I<SliderCubit>();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "منتجاتنا",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xff16A124),
          centerTitle: true,
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              const SliderSection(),
              SizedBox(height: 16.h),
              const CategorySection(),
              SizedBox(height: 16.h),
              const ProductsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

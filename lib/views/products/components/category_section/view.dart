import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_amit63/core/design/app_shimmer.dart';

import 'cubit.dart';
part 'loading.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final cubit = GetIt.I<CategoriesCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is GetCategoriesFailedState) {
          return Column(
            children: [
              Text(state.msg),
              FilledButton(
                  onPressed: () {
                    cubit.getData();
                  },
                  child: const Text("Try Again"))
            ],
          );
        } else if (state is GetCategoriesSuccessState) {
          if (state.list.isEmpty) {
            return const SizedBox.shrink();
          } else {
            return SizedBox(
              height: 128,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "الاقسام",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      state.list[index].image,
                                      height: 70,
                                      fit: BoxFit.cover,
                                      width: 70,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(state.list[index].name,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 24,
                              ),
                          itemCount: state.list.length))
                ],
              ),
            );
          }
        } else {
          return const _Loading();
        }
      },
    );
  }
}



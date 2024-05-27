import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_amit63/views/counter/cubit.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {

  final cubit = GetIt.I<CounterCubit>();



  @override
  Widget build(BuildContext context) {
    print("Hello");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    cubit.plus();
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) {
                    print("BlocBuilder1");
                    return Text(
                      "${cubit.count}",
                      style: const TextStyle(fontSize: 35),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    cubit.minus();
                  },
                  icon: const Icon(Icons.remove, size: 30),
                )
              ],
            ),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                print("BlocBuilder2");
                return Switch(
                  value: cubit.isOn,
                  onChanged: (value) {
                    cubit.toggleSwitch();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

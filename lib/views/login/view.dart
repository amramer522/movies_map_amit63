import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_amit63/views/login/cubit.dart';
import 'package:movies_amit63/views/login/states.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
{

  final cubit = GetIt.I<LoginCubit>();


  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: cubit.phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: cubit.passwordController,
                decoration: const InputDecoration(labelText: "Passwrod"),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  print("BlocBuilder");

                  if (state is LoginLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return FilledButton(
                      onPressed: () {
                        cubit.send(context);
                      },
                      child: const Text("Login"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

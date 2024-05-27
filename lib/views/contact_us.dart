import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_amit63/core/helper_methods.dart';

import '../features/contact_us/bloc.dart';



class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final bloc = GetIt.I<ContactUsBloc>();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: bloc.nameController,
                  decoration: const InputDecoration(labelText: "الإسم"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: bloc.phoneController,
                  decoration: const InputDecoration(labelText: "رقم الموبايل"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: bloc.titleController,
                  decoration: const InputDecoration(labelText: "العنوان"),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: bloc.bodyController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: "الموضوع"),
                ),
                const SizedBox(height: 16),
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is SendContactUsSuccessState) {
                      showMessage(state.msg,messageType: MessageType.success);
                    } else if (state is SendContactUsFailedState) {
                      showMessage(state.msg);
                    }
                  },
                  builder: (context, state) {
                    if (state is SendContactUsLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return FilledButton(
                          onPressed: () {
                            bloc.add(SendContactUsEvent());
                          },
                          child: const Text("إرسال"));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

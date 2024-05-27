import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_amit63/views/terms/cubit.dart';
import 'package:movies_amit63/views/terms/states.dart';

// Live Template (Snippets)
// File Template

class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  final cubit = GetIt.I<TermsCubit>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (state is GetTermsFailedState) {
              return Center(child: Text(state.msg));
            } else if (state is GetTermsSuccessState) {
              return HtmlWidget(
                  state.model.terms
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  const AppShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.green.withOpacity(.2),
      period: const Duration(seconds: 2),
      highlightColor: Colors.white,
      child: child,
    );
  }
}

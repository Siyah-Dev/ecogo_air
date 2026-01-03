import 'package:exogo/core/widgets/app_shimmer.dart';
import 'package:exogo/core/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';

class SearchShimmerList extends StatelessWidget {
  final int itemCount;
  final double height;

  const SearchShimmerList({super.key, this.height = 80, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (_, _) => AppShimmer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ShimmerBox(width: double.infinity, height: height),
        ),
      ),
    );
  }
}

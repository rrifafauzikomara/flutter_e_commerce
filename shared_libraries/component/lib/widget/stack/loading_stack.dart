import 'package:component/widget/progress_indicator/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingStack extends StatelessWidget {
  final bool isLoading;
  final Widget widget;

  const LoadingStack({Key? key, this.isLoading = false, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        if (isLoading) const Center(child: CustomCircularProgressIndicator()),
      ],
    );
  }
}

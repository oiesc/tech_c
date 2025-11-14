import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../utils/app_utils.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  final int dotCount = 3;
  int activeDot = 0;
  late final Timer _timer;

  late final List<Color> dotColors;

  @override
  void initState() {
    super.initState();
    dotColors = List.generate(dotCount, (_) => AppUtils.getRandomColor());
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(AppConstants.mediumAnimationDuration, (_) {
      if (!mounted) return;
      setState(() {
        activeDot = (activeDot + 1) % dotCount;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotCount,
        (index) => _CircleDot(
          painted: activeDot == index,
          paintColor: dotColors[index],
        ),
      ),
    );
  }
}

class _CircleDot extends StatelessWidget {
  final bool painted;
  final Color paintColor;

  const _CircleDot({
    required this.painted,
    required this.paintColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppConstants.mediumAnimationDuration,
      width: AppConstants.smallIconSize,
      height: AppConstants.smallIconSize,
      margin: const EdgeInsets.all(AppConstants.smallSpacing),
      decoration: BoxDecoration(
        color: painted ? paintColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: painted ? paintColor : Colors.transparent,
          width: 2,
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/home_store.dart';

mixin HomePageMixin<T extends StatefulWidget> on State<T> {
  HomeStore get homeStore => GetIt.I<HomeStore>();

  final circleDotNumber = 3;
  int paintedCircleDotIndex = 0;
  final animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    homeStore.loadData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateCircleDot();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void animateCircleDot() {
    Future.delayed(animationDuration, () {
      if (mounted) {
        setState(() {
          paintedCircleDotIndex = (paintedCircleDotIndex + 1) % circleDotNumber;
        });
        animateCircleDot();
      }
    });
  }

  Color getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}

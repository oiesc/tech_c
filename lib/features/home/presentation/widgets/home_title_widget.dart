import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../../../global/utils/app_utils.dart';

class HomeTitleWidget extends StatefulWidget {
  const HomeTitleWidget({super.key});

  @override
  State<HomeTitleWidget> createState() => _HomeTitleWidgetState();
}

class _HomeTitleWidgetState extends State<HomeTitleWidget> {
  late final Timer _timer;
  Color _currentColor = AppUtils.getRandomColor();

  @override
  void initState() {
    super.initState();
    _startColorAnimation();
  }

  void _startColorAnimation() {
    _timer = Timer.periodic(AppConstants.longAnimationDuration, (_) {
      if (!mounted) return;

      setState(() {
        _currentColor = AppUtils.getRandomColor();
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
    return AnimatedDefaultTextStyle(
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: _currentColor,
        fontWeight: FontWeight.bold,
      ),
      duration: AppConstants.longAnimationDuration,
      child: Text(
        AppLocalizations.of(context)!.homeWelcome,
        textAlign: TextAlign.center,
      ),
    );
  }
}

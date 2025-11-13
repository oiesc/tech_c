import 'package:flutter/widgets.dart';

import '../constants/app_constants.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  final bool shouldUseSafeArea;
  final bool shouldUsePadding;

  const ScaffoldBody({
    required this.child,
    this.shouldUseSafeArea = true,
    this.shouldUsePadding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (shouldUsePadding) {
      return Padding(
        padding: const EdgeInsets.all(AppConstants.mediumSpacing),
        child: shouldUseSafeArea ? SafeArea(child: child) : child,
      );
    }
    return shouldUseSafeArea ? SafeArea(child: child) : child;
  }
}

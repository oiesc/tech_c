import 'package:flutter/material.dart';

import '../../../../global/constants/app_constants.dart';

class ListViewHeader extends SliverPersistentHeaderDelegate {
  static const double _height = 60;
  @override
  final double minExtent;
  @override
  final double maxExtent;
  final int circleDotNumber;
  final int paintedCircleDotIndex;
  final Color Function() getRandomColor;

  ListViewHeader({
    required this.circleDotNumber,
    required this.paintedCircleDotIndex,
    required this.getRandomColor,
    this.minExtent = _height,
    this.maxExtent = _height,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: _height,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          if (overlapsContent)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          circleDotNumber,
          (index) => _CircleDot(
            painted: paintedCircleDotIndex == index,
            paintColor: getRandomColor(),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant ListViewHeader oldDelegate) {
    return oldDelegate.minExtent != minExtent ||
        oldDelegate.maxExtent != maxExtent ||
        oldDelegate.circleDotNumber != circleDotNumber ||
        oldDelegate.paintedCircleDotIndex != paintedCircleDotIndex;
  }
}

class _CircleDot extends StatelessWidget {
  final bool painted;
  final Color paintColor;
  const _CircleDot({required this.painted, required this.paintColor});

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

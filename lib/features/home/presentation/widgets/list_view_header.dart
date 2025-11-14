import 'package:flutter/material.dart';

class ListViewHeader extends SliverPersistentHeaderDelegate {
  static const double _height = 60;
  @override
  final double minExtent;
  @override
  final double maxExtent;

  ListViewHeader({
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
      child: SizedBox(),
    );
  }

  @override
  bool shouldRebuild(covariant ListViewHeader oldDelegate) {
    return oldDelegate.minExtent != minExtent || oldDelegate.maxExtent != maxExtent;
  }
}

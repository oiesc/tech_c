import 'package:flutter/widgets.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;

  const ScaffoldBody({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: child);
  }
}

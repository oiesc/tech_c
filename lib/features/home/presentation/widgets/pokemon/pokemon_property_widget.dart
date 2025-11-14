import 'package:flutter/material.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    required this.name,
    required this.value,
    this.textAlign = TextAlign.center,
    this.showNameFirst = false,
    super.key,
  });

  final String name;
  final String value;
  final TextAlign? textAlign;
  final bool showNameFirst;

  @override
  Widget build(BuildContext context) {
    final nameSpan = TextSpan(
      text: showNameFirst ? '$name\n' : name,
      style: Theme.of(context).textTheme.bodyMedium,
    );

    final valueSpan = TextSpan(
      text: showNameFirst ? value : '$value\n',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );

    return Text.rich(
      TextSpan(
        children: showNameFirst ? [nameSpan, valueSpan] : [valueSpan, nameSpan],
      ),
      textAlign: textAlign,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../global/constants/app_constants.dart';
import '../../../utils/home_utils.dart';

class PokemonTypeWidget extends StatelessWidget {
  final List<String> types;
  const PokemonTypeWidget({required this.types, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppConstants.smallSpacing,
      children: [
        ...types.map(
          (type) => Chip(
            side: BorderSide.none,
            backgroundColor: HomeUtils.getChipColor(type),
            label: Text(
              type,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: HomeUtils.getChipTextColor(type),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

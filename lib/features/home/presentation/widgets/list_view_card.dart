import 'package:flutter/material.dart';

import '../../../../global/constants/app_constants.dart';
import '../../domain/models/pokemon_model.dart';
import '../../utils/home_utils.dart';

class ListViewCard extends StatelessWidget {
  final PokemonModel pokemon;
  const ListViewCard({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.mediumSpacing),
        child: Column(
          spacing: AppConstants.smallSpacing,
          children: [
            _HeaderWidget(pokemon: pokemon),
            Image.network(
              pokemon.img,
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            Text(
              pokemon.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _PropertyWidget(
                  name: 'Height',
                  value: pokemon.height,
                ),
                _PropertyWidget(
                  name: 'Weight',
                  value: pokemon.weight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PropertyWidget extends StatelessWidget {
  const _PropertyWidget({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$value\n',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppConstants.smallSpacing,
      children: [
        Text(
          '#${pokemon.id.toString().padLeft(3, '0')}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        ...pokemon.type.map(
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

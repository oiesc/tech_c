import 'package:flutter/material.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/design_system/design_system.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../domain/models/pokemon_model.dart';
import 'pokemon/pokemon_property_widget.dart';
import 'pokemon/pokemon_type_widget.dart';

class ListViewCard extends StatelessWidget {
  final PokemonModel pokemon;
  final Function(PokemonModel pokemon) openItemDetails;
  const ListViewCard({required this.pokemon, required this.openItemDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => openItemDetails(pokemon),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.mediumSpacing),
          child: Column(
            spacing: AppConstants.smallSpacing,
            children: [
              _HeaderWidget(pokemon: pokemon),
              ImageWidget.network(pokemon.img),
              Text(
                pokemon.name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PropertyWidget(name: AppLocalizations.of(context)!.pokemonHeight, value: pokemon.height),
                  PropertyWidget(name: AppLocalizations.of(context)!.pokemonWeight, value: pokemon.weight),
                ],
              ),
            ],
          ),
        ),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '#${pokemon.id.toString().padLeft(3, '0')}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(child: PokemonTypeWidget(types: pokemon.type)),
      ],
    );
  }
}

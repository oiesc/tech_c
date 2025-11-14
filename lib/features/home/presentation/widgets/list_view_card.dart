import 'package:flutter/material.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../domain/models/pokemon_model.dart';
import 'list_view_card_detail.dart';
import 'pokemon/pokemon_property_widget.dart';
import 'pokemon/pokemon_type_widget.dart';

class ListViewCard extends StatelessWidget {
  final PokemonModel pokemon;
  const ListViewCard({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            context: context,
            builder: (context) => ListViewCardDetail(pokemon: pokemon),
          );
        },
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
      children: [
        Text(
          '#${pokemon.id.toString().padLeft(3, '0')}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        PokemonTypeWidget(types: pokemon.type),
      ],
    );
  }
}

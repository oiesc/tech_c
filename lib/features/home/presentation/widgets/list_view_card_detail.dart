import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../domain/models/pokemon_model.dart';
import 'pokemon/pokemon_property_widget.dart';
import 'pokemon/pokemon_type_widget.dart';

class ListViewCardDetail extends StatelessWidget {
  final PokemonModel pokemon;
  const ListViewCardDetail({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppConstants.mediumSpacing),
        child: Stack(
          children: [
            Column(
              children: [
                const _SpacingWidget(),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: pokemon.name,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: ' #${pokemon.id.toString().padLeft(3, '0')}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Image.network(
                    pokemon.img,
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SpacingWidget(),
                        Text(
                          pokemon.type.length > 1
                              ? AppLocalizations.of(context)!.pokemonTypes
                              : AppLocalizations.of(context)!.pokemonType,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PokemonTypeWidget(types: pokemon.type),
                        const _SpacingWidget(),
                        Row(
                          children: [
                            Expanded(
                              child: PropertyWidget(
                                showNameFirst: true,
                                name: AppLocalizations.of(context)!.pokemonHeight,
                                value: pokemon.height,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: PropertyWidget(
                                showNameFirst: true,
                                name: AppLocalizations.of(context)!.pokemonWeight,
                                value: pokemon.weight,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        const _SpacingWidget(),
                        Text.rich(
                          TextSpan(
                            text: '${AppLocalizations.of(context)!.pokemonCandy} ',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: pokemon.candy,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: '\n${AppLocalizations.of(context)!.pokemonCandyCount}',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: pokemon.candyCount.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        _SpacingWidget(),
                        if (pokemon.multipliers.isNotEmpty) ...[
                          Text(
                            AppLocalizations.of(context)!.pokemonMultipliers,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PokemonTypeWidget(types: pokemon.multipliers.map((e) => e.toString()).toList()),
                          _SpacingWidget(),
                        ],
                        Text(
                          pokemon.weaknesses.length > 1
                              ? AppLocalizations.of(context)!.pokemonWeaknesses
                              : AppLocalizations.of(context)!.pokemonWeakness,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PokemonTypeWidget(types: pokemon.weaknesses),
                        _SpacingWidget(),
                        Text(
                          AppLocalizations.of(context)!.pokemonInformations,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.pokemonEgg,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' ${pokemon.egg}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: '\n${AppLocalizations.of(context)!.pokemonSpawnChance}',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' ${pokemon.spawnChance}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: '\n${AppLocalizations.of(context)!.pokemonAvgSpawns}',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' ${pokemon.avgSpawns}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: '\n${AppLocalizations.of(context)!.pokemonSpawnTime}',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' ${pokemon.spawnTime}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        if (pokemon.prevEvolution.isNotEmpty)
                          _EvolutionWidget(
                            description: AppLocalizations.of(context)!.pokemonPreviousEvolution,
                            names: pokemon.prevEvolution.map((e) => e.formattedName).toList(),
                          ),
                        if (pokemon.nextEvolution.isNotEmpty)
                          _EvolutionWidget(
                            description: AppLocalizations.of(context)!.pokemonNextEvolution,
                            names: pokemon.nextEvolution.map((e) => e.formattedName).toList(),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.close)),
            ),
          ],
        ),
      ),
    );
  }
}

class _EvolutionWidget extends StatelessWidget {
  final String description;
  final List<String> names;
  const _EvolutionWidget({
    required this.description,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppConstants.smallSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SpacingWidget(),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          spacing: AppConstants.smallSpacing,
          runSpacing: AppConstants.smallSpacing,
          children: [
            ...names.map(
              (e) => Chip(label: Text(e)),
            ),
          ],
        ),
      ],
    );
  }
}

class _SpacingWidget extends StatelessWidget {
  const _SpacingWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppConstants.mediumSpacing);
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../global/constants/app_constants.dart';
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
                          pokemon.type.length > 1 ? 'Types:' : 'Type:',
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
                                name: 'Height',
                                value: pokemon.height,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: PropertyWidget(
                                showNameFirst: true,
                                name: 'Weight',
                                value: pokemon.weight,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        const _SpacingWidget(),
                        Text.rich(
                          TextSpan(
                            text: 'Candy:\n',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: pokemon.candy,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: '\nCandy Count: ',
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
                            'Multipliers:',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PokemonTypeWidget(types: pokemon.multipliers.map((e) => e.toString()).toList()),
                          _SpacingWidget(),
                        ],
                        Text(
                          pokemon.weaknesses.length > 1 ? 'Weaknesses:' : 'Weakness:',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PokemonTypeWidget(types: pokemon.weaknesses),
                        _SpacingWidget(),
                        Text(
                          'Informations',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Egg:',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' ${pokemon.egg}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: '\nSpawn Chance:',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' ${pokemon.spawnChance}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: '\nAvg Spawns:',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' ${pokemon.avgSpawns}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: '\nSpawn Time:',
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
                            description: 'Previous Evolution',
                            names: pokemon.prevEvolution.map((e) => e.formattedName).toList(),
                          ),
                        if (pokemon.nextEvolution.isNotEmpty)
                          _EvolutionWidget(
                            description: 'Next Evolution',
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

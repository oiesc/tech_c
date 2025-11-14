import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../global/app_core/app_core.dart';
import '../../../../global/constants/app_constants.dart';
import '../../../../global/design_system/app_bar_widget.dart';
import '../../../../global/design_system/scaffold_body.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../../../global/router/route_paths.dart';
import '../../../../global/utils/app_utils.dart';
import '../../domain/models/pokemon_model.dart';
import '../mixins/home_page_mixin.dart';
import '../stores/home_store.dart';
import '../widgets/list_view_header.dart';

/// Home page of the application
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showLeading: false,
        title: AnimatedDefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: getRandomColor(),
            fontWeight: FontWeight.bold,
          ),
          duration: animationDuration,
          child: Text(
            AppLocalizations.of(context)!.homeWelcome,
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(RoutePaths.settings),
          ),
        ],
      ),
      body: ScaffoldBody(
        child: ValueStoreBuilder<HomeStore, List<PokemonModel>>(
          store: homeStore,
          builder: (context, state) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ListViewHeader(
                    circleDotNumber: circleDotNumber,
                    paintedCircleDotIndex: paintedCircleDotIndex,
                    getRandomColor: getRandomColor,
                  ),
                ),
                SliverList.list(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: AppConstants.largeSpacing,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.homeListTitle,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                if (state is LoadingState)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator(color: getRandomColor())),
                  ),
                if (state is SuccessState<List<PokemonModel>>)
                  SliverList.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      debugPrint('Building list item at index: $index');
                      final pokemon = state.data[index];
                      return ListTile(
                        title: Text(pokemon.name),
                        subtitle: Text('Type: ${pokemon.type.join(', ')}'),
                        leading: CircleAvatar(
                          backgroundColor: getRandomColor(),
                          child: Text(pokemon.id.toString()),
                        ),
                      );
                    },
                  ),
                if (state is ErrorState)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        AppFailureMessage.get((state as ErrorState).error.code),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

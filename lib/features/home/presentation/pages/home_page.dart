import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../global/app_core/app_core.dart';
import '../../../../global/constants/app_constants.dart';
import '../../../../global/design_system/app_bar_widget.dart';
import '../../../../global/design_system/loading_widget.dart';
import '../../../../global/design_system/scaffold_body.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../../../global/router/route_paths.dart';
import '../../../../global/utils/app_utils.dart';
import '../../domain/models/home_data_model.dart';
import '../mixins/home_page_mixin.dart';
import '../stores/home_store.dart';
import '../widgets/home_title_widget.dart';
import '../widgets/list_view_card.dart';
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
        title: const HomeTitleWidget(),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(RoutePaths.settings),
          ),
        ],
      ),
      body: ScaffoldBody(
        child: ValueStoreBuilder<HomeStore, HomeDataModel>(
          store: homeStore,
          builder: (context, state) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ListViewHeader(
                    homeStore: homeStore,
                    controller: searchController,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    onFilterPressed: onFilterPressed,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppConstants.mediumSpacing),
                    child: Text(
                      AppLocalizations.of(context)!.homeListTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (state is LoadingState)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: LoadingWidget(),
                  ),
                if (state is SuccessState<HomeDataModel> && state.data.filteredPokemons.isNotEmpty)
                  SliverList.separated(
                    itemCount: state.data.filteredPokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = state.data.filteredPokemons[index];
                      return ListViewCard(pokemon: pokemon);
                    },
                    separatorBuilder: (_, _) {
                      return const SizedBox(height: AppConstants.mediumSpacing);
                    },
                  ),
                if (state is SuccessState<HomeDataModel> && state.data.filteredPokemons.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.homeNoResultsFound(searchController.text),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
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

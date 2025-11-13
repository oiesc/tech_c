import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/design_system/app_bar_widget.dart';
import '../../../../global/design_system/scaffold_body.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../../../global/router/route_paths.dart';
import '../mixins/home_page_mixin.dart';
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
        title: Text(AppLocalizations.of(context)!.navHome),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(RoutePaths.settings),
          ),
        ],
      ),
      body: ScaffoldBody(
        child: CustomScrollView(
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
                    AnimatedDefaultTextStyle(
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
                    Text(
                      AppLocalizations.of(context)!.homeListTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../global/constants/app_constants.dart';
import '../../../../global/l10n/app_localizations.dart';
import '../../../../global/router/route_paths.dart';
import '../mixins/home_page_mixin.dart';

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
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.navHome,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(RoutePaths.settings),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppConstants.mediumSpacing),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppConstants.largeSpacing,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    circleDotNumber,
                    (index) => _CircleDot(
                      painted: index == paintedCircleDotIndex,
                      paintColor: getRandomColor(),
                    ),
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context)!.homeWelcome,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleDot extends StatelessWidget {
  final bool painted;
  final Color paintColor;
  const _CircleDot({required this.painted, required this.paintColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppConstants.mediumAnimationDuration,
      width: AppConstants.smallIconSize,
      height: AppConstants.smallIconSize,
      margin: const EdgeInsets.all(AppConstants.smallSpacing),
      decoration: BoxDecoration(
        color: painted ? paintColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: painted ? paintColor : Colors.transparent,
          width: 2,
        ),
      ),
    );
  }
}

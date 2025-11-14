import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../global/app_core/failures/app_failure.dart';
import '../global/app_core/store/store_imports.dart';
import '../global/constants/app_constants.dart';
import '../global/l10n/app_localizations.dart';
import '../global/router/app_router.dart';
import '../global/settings/app_settings_store.dart';
import '../global/themes/app_theme.dart';
import '../global/themes/app_theme_mode.dart';

/// Main application widget
class App extends StatelessWidget {
  const App({
    required this.settingsStore,
    super.key,
  });

  final AppSettingsStore settingsStore;

  @override
  Widget build(BuildContext context) {
    return ValueStoreBuilder<AppSettingsStore, AppSettings>(
      store: settingsStore,
      builder: (context, state) {
        return MaterialApp.router(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,

          routerConfig: AppRouter.router,

          locale: state.foldSuccess(
            success: (settings) => settings.locale,
            orElse: () => const Locale('en'),
          ),
          supportedLocales: const [
            Locale('en'),
            Locale('pt'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // Theme - use defaults when not loaded
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.foldSuccess(
            success: (settings) => settings.appThemeMode.themeMode,
            orElse: () => ThemeMode.system,
          ),

          builder: (context, child) {
            return state.when(
              idle: () => _buildLoadingOverlay(child),
              loading: () => _buildLoadingOverlay(child),
              success: (settings) => child ?? const SizedBox(),
              error: (error) => _buildErrorOverlay(context, error),
            );
          },
        );
      },
    );
  }

  Widget _buildLoadingOverlay(Widget? child) {
    return Scaffold(
      body: Stack(
        children: [
          if (child != null) child,
          Container(
            color: Colors.black54,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorOverlay(BuildContext context, AppGenericFailure error) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.largeSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: AppConstants.hugeIconSize,
                color: Colors.red,
              ),
              const SizedBox(height: AppConstants.largeSpacing),
              Text(
                AppLocalizations.of(context)!.appErrorInitializing,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.mediumSpacing),
              Text(
                error.message,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.extraLargeSpacing),
              ElevatedButton.icon(
                onPressed: () async {
                  await settingsStore.initialize();
                },
                icon: const Icon(Icons.refresh),
                label: Text(AppLocalizations.of(context)!.appTryAgain),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

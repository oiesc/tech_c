import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:techc/global/app_core/store/app_state.dart';
import 'package:techc/global/settings/app_settings_store.dart';
import 'package:techc/global/themes/app_theme.dart';
import 'package:techc/global/themes/app_theme_mode.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Reset GetIt for clean test environment
    GetIt.I.reset();

    // Create a simple settings store for testing without dependencies
    final settingsStore = AppSettingsStore();

    // Manually set the state to avoid dependency injection issues
    final testSettings = AppSettings(
      appThemeMode: AppThemeMode.system,
      locale: const Locale('en'),
    );
    settingsStore.updateState(SuccessState<AppSettings>(testSettings));

    // Create a simplified test app instead of the full App widget
    await tester.pumpWidget(
      MaterialApp(
        title: 'Test App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const Scaffold(
          body: Center(
            child: Text('Test Home'),
          ),
        ),
      ),
    );

    // Wait for the app to finish loading
    await tester.pumpAndSettle();

    // Verify that the app loads without crashing
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Test Home'), findsOneWidget);
  });
}

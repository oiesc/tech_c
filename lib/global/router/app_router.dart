import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_core/failures/navigation_service.dart';
import '../modules/module_manager.dart';
import 'route_paths.dart';

/// Application router configuration using GoRouter
class AppRouter {
  static late GoRouter _router;

  /// Initialize router with modules
  static void initialize() {
    final moduleManager = ModuleManager();

    _router = GoRouter(
      navigatorKey: NavigationService.navigatorKey,
      initialLocation: RoutePaths.home,
      debugLogDiagnostics: true,
      routes: [
        ...moduleManager.getAllRoutes(),
        // Add global routes here if needed
      ],
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Page not found: ${state.uri}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go(RoutePaths.home),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static GoRouter get router => _router;
}

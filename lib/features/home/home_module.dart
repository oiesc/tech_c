import 'package:go_router/go_router.dart';

import '../../global/modules/base_module.dart';
import '../../global/router/route_paths.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends BaseModule {
  HomeModule(super.getIt);

  @override
  void registerDependencies() {}

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: RoutePaths.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    // Add more home-related routes here
    // GoRoute(
    //   path: '/home/details',
    //   name: 'home-details',
    //   builder: (context, state) => const HomeDetailsPage(),
    // ),
  ];
}

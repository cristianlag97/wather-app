import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';
import 'app_router_utils.dart';
import 'screen/not_found_page.dart';

final router = GoRouter(
  routes: [
    //! General
    GoRoute(
      path: PAGES.home.screenPath,
      name: PAGES.home.screenName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: PAGES.config.screenPath,
      name: PAGES.config.screenName,
      builder: (context, state) => const ConfigScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

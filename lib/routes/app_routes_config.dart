
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/cart/ui/cart.dart';
import '../features/home/ui/home.dart';
import '../features/wishlist/ui/wishlist.dart';
import 'app_routes_constants.dart';

///routes config file
class AppRouteConfig {
  ///goroute paramete to access navigation
  GoRouter goRouter = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRouteConstants.home,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const MaterialPage<dynamic>(child: Home()),
    ),
    GoRoute(
      path: '/wishlist',
      name: AppRouteConstants.wishlist,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const MaterialPage<dynamic>(child: Wishlist()),
    ),
    GoRoute(
      path: '/cart',
      name: AppRouteConstants.cart,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const MaterialPage<dynamic>(child: Cart()),
    )

  ]);
}

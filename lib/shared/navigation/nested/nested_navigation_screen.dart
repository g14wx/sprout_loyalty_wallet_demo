import 'package:flutter/material.dart';
import 'package:loyalty_wallet/router/constants/app_routes.dart';

class NestedScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey;
  final Function _onGenerateRoute;
  const NestedScreen({super.key, required GlobalKey<NavigatorState> navigatorKey, required Function onGenerateRoute})
      : _navigatorKey = navigatorKey,
        _onGenerateRoute = onGenerateRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        initialRoute: AppRoutes.root,
        onGenerateRoute: (routeSettings) => _onGenerateRoute(routeSettings),
      ),
    );
  }
}

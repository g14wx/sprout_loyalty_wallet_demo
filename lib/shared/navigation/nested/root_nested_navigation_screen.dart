import 'package:flutter/material.dart';
import 'package:loyalty_wallet/router/constants/app_routes.dart';

class RootNestedScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey;
  final Function _onGenerateRoute;
  final Future<bool> Function(BuildContext context) onExitPageNestedNavigation;
  const RootNestedScreen(
      {super.key,
      required GlobalKey<NavigatorState> navigatorKey,
      required Function onGenerateRoute,
      required this.onExitPageNestedNavigation})
      : _navigatorKey = navigatorKey,
        _onGenerateRoute = onGenerateRoute;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint("Wants to pop");
        /* we use onWillPop, due to that when you try to get back in a nested navigator, for example in dashboard page, and you press the back button of the device
          this put the app in the foreground, and doesn't not get back in the nested navigator*/
        final navigator = _navigatorKey.currentState!;
        if (navigator.canPop()) {
          navigator.pop();
          // we return false here to not get to the foreground, and just pop in the nested navigator
          return false;
        } else {
          return await onExitPageNestedNavigation(context);
        }
      },
      child: Scaffold(
        body: Navigator(
          key: _navigatorKey,
          initialRoute: AppRoutes.root,
          onGenerateRoute: (routeSettings) => _onGenerateRoute(routeSettings),
        ),
      ),
    );
  }
}

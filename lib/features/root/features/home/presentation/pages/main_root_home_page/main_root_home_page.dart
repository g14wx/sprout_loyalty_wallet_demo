import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loyalty_wallet/router/app_router.dart';
import 'package:loyalty_wallet/router/providers/navigator_keys_provider.dart';
import 'package:loyalty_wallet/shared/hooks/use_app_translations.dart';
import 'package:loyalty_wallet/shared/navigation/nested/nested_navigation_functions_mixin.dart';
import 'package:loyalty_wallet/shared/navigation/nested/nested_navigation_screen.dart';
import 'package:provider/provider.dart' as original_provider;
import 'package:google_fonts/google_fonts.dart';
part 'main_root_home_page_functions.dart';

class MainRootHomePage extends HookConsumerWidget with NestedNavigationFunctionsMixin {
  const MainRootHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = useAppTranslation(context)!;
    final List<Widget> nestedPages = [
      NestedScreen(
          navigatorKey: original_provider.Provider.of<NavigatorKeysProvider>(listen: false, context).navigationHome,
          onGenerateRoute: AppRouter.onGenerateRouteRootHomeLandingPage),
      NestedScreen(
          navigatorKey:
              original_provider.Provider.of<NavigatorKeysProvider>(listen: false, context).navigationHomePoints,
          onGenerateRoute: AppRouter.onGenerateRouteRootHomePoints),
      NestedScreen(
          navigatorKey:
              original_provider.Provider.of<NavigatorKeysProvider>(listen: false, context).navigationHomeSettings,
          onGenerateRoute: AppRouter.onGenerateRouteRootHomeSettings),
    ];
    return original_provider.Consumer<NavigatorKeysProvider>(
      builder: (context, navigatorKeysProvider, child) => WillPopScope(
          onWillPop: () async {
            /* we use onWillPop, due to that when you try to get back in a nested navigator, for example in dashboard page, and you press the back button of the device
          this put the app in the foreground, and doesn't not get back in the nested navigator*/
            final navigator = navigatorKeysProvider.currentNavigationKey.currentState!;
            if (navigator.canPop()) {
              navigator.pop();
              // we return false here to not get to the foreground, and just pop in the nested navigator
              return false;
            }
            // only when we are on home we can pop
            if (navigatorKeysProvider.selectedIndexDrawer == 0) {
              final result = await closeConfirmationDialogBuilders(context,
                  title: localizations.closeApp,
                  description: localizations.closeAppDescription,
                  confirmationButtonTitle: localizations.yes,
                  denyButtonTitle: localizations.no);
              return result as bool;
            }
            // otherwise go back to home
            navigatorKeysProvider.setSelectedIndexDrawer(0);
            return false;
          },
          child: Scaffold(
            body: IndexedStack(
              index: navigatorKeysProvider.selectedIndexDrawer,
              children: nestedPages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor:
                  _getBackgroundColorBottomNavigationBar(navigatorKeysProvider.selectedIndexDrawer, context),
              selectedLabelStyle: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: localizations.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.control_point_duplicate),
                  label: localizations.points,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: localizations.settings,
                ),
              ],
              currentIndex: navigatorKeysProvider.selectedIndexDrawer,
              selectedItemColor: Colors.white,
              onTap: (value) => onItemTapped(value, context),
            ),
          )),
    );
  }
}

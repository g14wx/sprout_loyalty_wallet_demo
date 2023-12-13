import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_wallet/features/root/features/home/features/home_landing/presentation/entry_root_home_landing_page.dart';
import 'package:loyalty_wallet/features/root/features/home/features/home_points/presentation/entry_home_points_page.dart';
import 'package:loyalty_wallet/features/root/features/home/features/home_settings/presentation/entry_home_settings_page.dart';
import 'package:loyalty_wallet/features/root/features/home/presentation/entry_root_home_page.dart';
import 'package:loyalty_wallet/features/root/presentation/BLoC/fetch_store_bloc/fetch_store_bloc.dart';
import 'package:loyalty_wallet/features/root/presentation/entry_root_page.dart';
import 'package:loyalty_wallet/router/constants/app_routes.dart';
import 'package:loyalty_wallet/services/service_locator/service_locator_setup.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => getIt<FetchStoreBloc>(),
                )
              ],
              child: const EntryRootPage(),
            );
          },
          transitionDuration: const Duration(seconds: 3),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            /* const begin = Offset(0.0, 1.0);
            const end = Offset.zero; */
            const curve = Curves.ease;

            /*var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));*/
            var tweenFade = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

            /*return SlideTransition(
              position: animation.drive(tween),
              child: child,
            ); */
            return FadeTransition(
              opacity: animation.drive(tweenFade),
              child: child,
            );
          },
        );
      case AppRoutes.rootHome:
        return MaterialPageRoute(builder: (_) {
          return const EntryRootHomePage();
        });

      case AppRoutes.rootPromotional:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Container();
          },
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            /* const begin = Offset(0.0, 1.0);
            const end = Offset.zero; */
            const curve = Curves.easeIn;

            /*var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));*/
            var tweenFade = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

            /*return SlideTransition(
              position: animation.drive(tween),
              child: child,
            ); */
            return FadeTransition(
              opacity: animation.drive(tweenFade),
              child: child,
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Text('not found on main routes');
          },
        );
    }
  }

  static Route onGenerateRouteRootHomeLandingPage(RouteSettings route) {
    switch (route.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (context) {
            return const EntryRootHomeLandingPage();
          },
        );

      case AppRoutes.homeLandingProducts:
        return MaterialPageRoute(
          builder: (context) {
            return const Center(
              child: Text("from the products of the home landing page"),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Text('not found on landing page routes home');
          },
        );
    }
  }

  static Route onGenerateRouteRootHomeSettings(RouteSettings route) {
    switch (route.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (context) {
            return const EntryHomeSettingsPage();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Text('not found on settings routes');
          },
        );
    }
  }

  static Route onGenerateRouteRootHomePoints(RouteSettings route) {
    switch (route.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (context) {
            return const EntryHomePointsPage();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('not found on point routes'),
              ),
            );
          },
        );
    }
  }

  static Route onGenerateRouteRootPromotional(RouteSettings route) {
    switch (route.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (context) {
            return Container();
          },
        );

      case AppRoutes.rootPromotionalSeason:
        return MaterialPageRoute(
          builder: (context) {
            return Container();
          },
        );

      case AppRoutes.rootPromotionalDiary:
        return MaterialPageRoute(
          builder: (context) {
            return Container();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text('not found on promotional routes'),
              ),
            );
          },
        );
    }
  }
}

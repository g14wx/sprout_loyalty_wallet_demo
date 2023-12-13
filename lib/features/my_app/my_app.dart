import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_wallet/global/providers/app_settings_provider/app_settings_provider.dart';
import 'package:loyalty_wallet/router/app_router.dart';
import 'package:loyalty_wallet/router/providers/navigator_keys_provider.dart';
import 'package:loyalty_wallet/services/service_locator/service_locator_setup.dart';
import 'package:loyalty_wallet/themes/protocols/i_color_schema.dart';
import 'package:loyalty_wallet/themes/protocols/i_custom_colors_container.dart';
import 'package:provider/provider.dart' as original_provider;
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dynamic_color/dynamic_color.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return original_provider.MultiProvider(
      providers: [
        original_provider.ListenableProvider(create: (_) => getIt<NavigatorKeysProvider>()),
        original_provider.ListenableProvider(create: (_) => getIt<AppSettingsProvider>()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme(
        displayLarge: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.poppins(fontSize: 24),
        displaySmall: GoogleFonts.poppins(fontSize: 22),
        titleLarge: GoogleFonts.poppins(
          fontSize: 20,
        ),
        titleMedium: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        titleSmall: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        bodyLarge: GoogleFonts.poppins(fontSize: 14),
        bodyMedium: GoogleFonts.poppins(fontSize: 12),
        bodySmall: GoogleFonts.poppins(fontSize: 10),
        labelLarge: GoogleFonts.poppins(fontSize: 12),
        labelMedium: GoogleFonts.poppins(fontSize: 10),
        labelSmall: GoogleFonts.poppins(fontSize: 9));

    return original_provider.Consumer<NavigatorKeysProvider>(
      builder: (context, navigatorKeysProvider, child) {
        return original_provider.Consumer<AppSettingsProvider>(
          builder: (context, appSettingsProvider, child) {
            return DynamicColorBuilder(
              builder: (lightDynamic, darkDynamic) {
                ColorScheme lightScheme;
                ColorScheme darkScheme;
                ThemeExtension lightCustomColors;
                ThemeExtension darkCustomColors;
                if (lightDynamic != null && darkDynamic != null) {
                  lightScheme = lightDynamic.harmonized();
                  lightCustomColors = getIt<ICustomColorsContainer>().lightCustomColors.harmonized(lightScheme);

                  // Repeat for the dark color scheme.
                  darkScheme = darkDynamic.harmonized();
                  darkCustomColors = getIt<ICustomColorsContainer>().darkCustomColors.harmonized(darkScheme);
                } else {
                  // Otherwise, use fallback schemes.
                  lightScheme = getIt<IColorSchema>().lightColorScheme;
                  lightCustomColors = getIt<ICustomColorsContainer>().lightCustomColors.harmonized(lightScheme);
                  darkScheme = getIt<IColorSchema>().darkColorScheme;
                  darkCustomColors = getIt<ICustomColorsContainer>().darkCustomColors.harmonized(darkScheme);
                }

                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  navigatorKey: navigatorKeysProvider.navigationDefault,
                  builder: (context, widget) => ResponsiveBreakpoints.builder(breakpoints: const [
                    Breakpoint(start: 0, end: 450, name: MOBILE),
                    Breakpoint(start: 451, end: 600, name: TABLET),
                    Breakpoint(start: 6001, end: 1024, name: DESKTOP),
                    Breakpoint(start: 1025, end: double.infinity, name: '4K'),
                  ], child: widget!),
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  theme: ThemeData(
                      useMaterial3: true,
                      colorScheme: getIt<IColorSchema>().lightColorScheme,
                      extensions: [lightCustomColors],
                      textTheme: textTheme),
                  darkTheme: ThemeData(
                      useMaterial3: true,
                      colorScheme: getIt<IColorSchema>().darkColorScheme,
                      extensions: [darkCustomColors],
                      textTheme: textTheme),
                  onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
                  locale: Locale(appSettingsProvider.language),
                  themeMode: appSettingsProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
                );
              },
            );
          },
        );
      },
    );
  }
}

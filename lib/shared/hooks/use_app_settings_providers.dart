import 'package:flutter/material.dart';
// providers
// packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loyalty_wallet/global/providers/app_settings_provider/app_settings_provider.dart';
import 'package:provider/provider.dart';

AppSettingsProvider useAppSettingsProviders(BuildContext context) {
  final appSettingsProviders = useMemoized(() => Provider.of<AppSettingsProvider>(context),
      [Provider.of<AppSettingsProvider>(context).isDarkTheme, Provider.of<AppSettingsProvider>(context).language]);
  return appSettingsProviders;
}

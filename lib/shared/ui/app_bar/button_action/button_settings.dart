import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loyalty_wallet/global/providers/app_settings_provider/app_settings_provider.dart';
import 'package:loyalty_wallet/shared/hooks/use_app_settings_providers.dart';
import 'package:loyalty_wallet/shared/hooks/use_app_translations.dart';
import 'package:loyalty_wallet/shared/ui/app_bar/button_action/models/settings_items/settings_items.dart';

class ButtonSettings extends HookConsumerWidget {
  const ButtonSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations translations = useAppTranslation(context)!;
    final AppSettingsProvider appSettingsProvider = useAppSettingsProviders(context);
    return PopupMenuButton<SettingsItems>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      icon: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor, borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: const Center(
            child: Icon(
          Icons.settings,
          color: Colors.white,
        )),
      ),
      onSelected: (SettingsItems item) {
        item.map(
          changeLanguage: (value) {
            appSettingsProvider.changeLanguage(value: appSettingsProvider.language == 'en' ? 'es' : 'en');
          },
          changeTheme: (value) {
            appSettingsProvider.changeTheme(value: !appSettingsProvider.isDarkTheme);
          },
        );
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SettingsItems>>[
        PopupMenuItem<SettingsItems>(
          value: const SettingsItems.changeLanguage(),
          child: Text(
              "${translations.changeLanguageTo}: ${appSettingsProvider.language == "en" ? translations.spanish : translations.english}"),
        ),
        PopupMenuItem<SettingsItems>(
          value: const SettingsItems.changeTheme(),
          child: Text(
              "${translations.changeThemeTo}: ${appSettingsProvider.isDarkTheme ? translations.light : translations.dark}"),
        ),
      ],
    );
  }
}

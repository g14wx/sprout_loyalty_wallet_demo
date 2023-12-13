import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loyalty_wallet/shared/hooks/use_app_translations.dart';
import 'package:loyalty_wallet/shared/ui/app_bar/button_action/button_settings.dart';

class MainRootHomeSettingsPage extends HookConsumerWidget {
  const MainRootHomeSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translations = useAppTranslation(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.settings),
        actions: const [ButtonSettings()],
      ),
    );
  }
}

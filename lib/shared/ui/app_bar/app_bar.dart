import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loyalty_wallet/constants/config/global_app_constants.dart';
import 'package:loyalty_wallet/global/providers/app_settings_provider/app_settings_provider.dart';
import 'package:loyalty_wallet/shared/hooks/use_app_settings_providers.dart';

// ignore: must_be_immutable
class BaseAppBar extends HookWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;
  List<Widget>? widgets;
  Widget? leading;
  var appBarHeight = useState(0);
  var appBarColor = useState(Colors.transparent);
  var batteryLow = useState(false);
  var internetDisconnected = useState(false);
  bool alreadyNotified = false;
  bool? authorizedToGetLostOrders = false;

  /// you can add more fields that meet your needs

  BaseAppBar(
      {super.key, required this.title, required this.appBar, this.widgets, this.leading, this.authorizedToGetLostOrders});

  @override
  Widget build(BuildContext context) {
    final AppSettingsProvider appSettingsProvider = useAppSettingsProviders(context);
    return AppBar(
      toolbarHeight: 300,
      backgroundColor: appBarColor.value,
      title: title,
      actions: [
        IconButton(
            onPressed: () {
              appSettingsProvider.changeTheme(value: !appSettingsProvider.isDarkTheme);
            },
            icon: Icon(appSettingsProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode)),
        IconButton(
            onPressed: () {
              appSettingsProvider.changeLanguage(
                  value: appSettingsProvider.language == GlobalAppConstants.languageEn
                      ? GlobalAppConstants.languageEs
                      : GlobalAppConstants.languageEn);
            },
            icon: const Icon(Icons.translate)),
        ...?widgets
      ],
      leading: leading,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height + appBarHeight.value);
}

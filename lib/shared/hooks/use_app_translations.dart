import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations? useAppTranslation(BuildContext context) {
  final localizations =
      useMemoized<AppLocalizations?>(() => AppLocalizations.of(context), [AppLocalizations.of(context)]);
  return localizations;
}

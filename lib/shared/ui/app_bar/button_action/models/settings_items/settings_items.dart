import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_items.freezed.dart';

@freezed
class SettingsItems with _$SettingsItems {
  const factory SettingsItems.changeLanguage() = _ChangeLanguage;
  const factory SettingsItems.changeTheme() = _ChangeTheme;
}

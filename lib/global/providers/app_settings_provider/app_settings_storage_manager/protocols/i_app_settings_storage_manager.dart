abstract class IAppSettingsStorageManager {
  Future<bool> saveLanguageState(String language);
  Future<bool> saveThemeState(String theme);
  Future<String?> getLanguageState();
  Future<String?> getThemeState();
}

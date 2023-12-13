import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:loyalty_wallet/constants/env/env.dart';
import 'package:loyalty_wallet/constants/stores/stores.dart';
import 'package:loyalty_wallet/themes/protocols/i_color_schema.dart';

@Injectable(as: IColorSchema, env: [
  "${Env.production}_${Stores.storeOneName}",
  "${Env.staging}_${Stores.storeOneName}",
  "${Env.local}_${Stores.storeOneName}",
  "${Env.test}_${Stores.storeOneName}"
])
class ColorSchemaStoreOne implements IColorSchema {
  @override
  ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF3D5AA9),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDBE1FF),
    onPrimaryContainer: Color(0xFF00174A),
    secondary: Color(0xFF585E72),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFDDE1F9),
    onSecondaryContainer: Color(0xFF151B2C),
    tertiary: Color(0xFFBF0914),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFDAD6),
    onTertiaryContainer: Color(0xFF410002),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFEFBFF),
    onBackground: Color(0xFF1B1B1F),
    surface: Color(0xFFFEFBFF),
    onSurface: Color(0xFF1B1B1F),
    surfaceVariant: Color(0xFFE2E2EC),
    onSurfaceVariant: Color(0xFF45464F),
    outline: Color(0xFF757680),
    onInverseSurface: Color(0xFFF2F0F4),
    inverseSurface: Color(0xFF303034),
    inversePrimary: Color(0xFFB4C5FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF3D5AA9),
    outlineVariant: Color(0xFFC5C6D0),
    scrim: Color(0xFF000000),
  );

  @override
  ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFB4C5FF),
    onPrimary: Color(0xFF002A77),
    primaryContainer: Color(0xFF224290),
    onPrimaryContainer: Color(0xFFDBE1FF),
    secondary: Color(0xFFC1C6DD),
    onSecondary: Color(0xFF2A3042),
    secondaryContainer: Color(0xFF414659),
    onSecondaryContainer: Color(0xFFDDE1F9),
    tertiary: Color(0xFFFFB4AB),
    onTertiary: Color(0xFF690005),
    tertiaryContainer: Color(0xFF93000B),
    onTertiaryContainer: Color(0xFFFFDAD6),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1B1B1F),
    onBackground: Color(0xFFE4E2E6),
    surface: Color(0xFF1B1B1F),
    onSurface: Color(0xFFE4E2E6),
    surfaceVariant: Color(0xFF45464F),
    onSurfaceVariant: Color(0xFFC5C6D0),
    outline: Color(0xFF8F909A),
    onInverseSurface: Color(0xFF1B1B1F),
    inverseSurface: Color(0xFFE4E2E6),
    inversePrimary: Color(0xFF3D5AA9),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFB4C5FF),
    outlineVariant: Color(0xFF45464F),
    scrim: Color(0xFF000000),
  );
}

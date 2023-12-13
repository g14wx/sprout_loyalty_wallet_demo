import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:loyalty_wallet/constants/env/env.dart';
import 'package:loyalty_wallet/constants/stores/stores.dart';
import 'package:loyalty_wallet/themes/protocols/i_custom_colors.dart';
import 'package:loyalty_wallet/themes/protocols/i_custom_colors_container.dart';

@Injectable(as: ICustomColorsContainer, env: [
  "${Env.production}_${Stores.storeOneName}",
  "${Env.staging}_${Stores.storeOneName}",
  "${Env.local}_${Stores.storeOneName}",
  "${Env.test}_${Stores.storeOneName}"
])
class CustomColorsContainerStoreOne implements ICustomColorsContainer {
  @override
  Color quaternary = const Color(0xFF00459B);
  @override
  Color quinary = const Color(0xFFC30A56);
  @override
  Color setarian = const Color(0xFF652000);

  @override
  ICustomColors lightCustomColors = const CustomColors(
    sourceQuaternary: Color(0xFF00459B),
    quaternary: Color(0xFF295BB2),
    onQuaternary: Color(0xFFFFFFFF),
    quaternaryContainer: Color(0xFFD8E2FF),
    onQuaternaryContainer: Color(0xFF001A43),
    sourceQuinary: Color(0xFFC30A56),
    quinary: Color(0xFFBC0051),
    onQuinary: Color(0xFFFFFFFF),
    quinaryContainer: Color(0xFFFFD9DF),
    onQuinaryContainer: Color(0xFF3F0017),
    sourceSetarian: Color(0xFF652000),
    setarian: Color(0xFF9A4521),
    onSetarian: Color(0xFFFFFFFF),
    setarianContainer: Color(0xFFFFDBCE),
    onSetarianContainer: Color(0xFF370E00),
  );

  @override
  ICustomColors darkCustomColors = const CustomColors(
    sourceQuaternary: Color(0xFF00459B),
    quaternary: Color(0xFFAEC6FF),
    onQuaternary: Color(0xFF002E6B),
    quaternaryContainer: Color(0xFF004397),
    onQuaternaryContainer: Color(0xFFD8E2FF),
    sourceQuinary: Color(0xFFC30A56),
    quinary: Color(0xFFFFB1C0),
    onQuinary: Color(0xFF660029),
    quinaryContainer: Color(0xFF90003D),
    onQuinaryContainer: Color(0xFFFFD9DF),
    sourceSetarian: Color(0xFF652000),
    setarian: Color(0xFFFFB599),
    onSetarian: Color(0xFF5A1C00),
    setarianContainer: Color(0xFF7B2F0B),
    onSetarianContainer: Color(0xFFFFDBCE),
  );
}

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> implements ICustomColors {
  const CustomColors({
    required this.sourceQuaternary,
    required this.quaternary,
    required this.onQuaternary,
    required this.quaternaryContainer,
    required this.onQuaternaryContainer,
    required this.sourceQuinary,
    required this.quinary,
    required this.onQuinary,
    required this.quinaryContainer,
    required this.onQuinaryContainer,
    required this.sourceSetarian,
    required this.setarian,
    required this.onSetarian,
    required this.setarianContainer,
    required this.onSetarianContainer,
  });

  final Color? sourceQuaternary;
  final Color? quaternary;
  final Color? onQuaternary;
  final Color? quaternaryContainer;
  final Color? onQuaternaryContainer;
  final Color? sourceQuinary;
  final Color? quinary;
  final Color? onQuinary;
  final Color? quinaryContainer;
  final Color? onQuinaryContainer;
  final Color? sourceSetarian;
  final Color? setarian;
  final Color? onSetarian;
  final Color? setarianContainer;
  final Color? onSetarianContainer;

  @override
  CustomColors copyWith({
    Color? sourceQuaternary,
    Color? quaternary,
    Color? onQuaternary,
    Color? quaternaryContainer,
    Color? onQuaternaryContainer,
    Color? sourceQuinary,
    Color? quinary,
    Color? onQuinary,
    Color? quinaryContainer,
    Color? onQuinaryContainer,
    Color? sourceSetarian,
    Color? setarian,
    Color? onSetarian,
    Color? setarianContainer,
    Color? onSetarianContainer,
  }) {
    return CustomColors(
      sourceQuaternary: sourceQuaternary ?? this.sourceQuaternary,
      quaternary: quaternary ?? this.quaternary,
      onQuaternary: onQuaternary ?? this.onQuaternary,
      quaternaryContainer: quaternaryContainer ?? this.quaternaryContainer,
      onQuaternaryContainer: onQuaternaryContainer ?? this.onQuaternaryContainer,
      sourceQuinary: sourceQuinary ?? this.sourceQuinary,
      quinary: quinary ?? this.quinary,
      onQuinary: onQuinary ?? this.onQuinary,
      quinaryContainer: quinaryContainer ?? this.quinaryContainer,
      onQuinaryContainer: onQuinaryContainer ?? this.onQuinaryContainer,
      sourceSetarian: sourceSetarian ?? this.sourceSetarian,
      setarian: setarian ?? this.setarian,
      onSetarian: onSetarian ?? this.onSetarian,
      setarianContainer: setarianContainer ?? this.setarianContainer,
      onSetarianContainer: onSetarianContainer ?? this.onSetarianContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceQuaternary: Color.lerp(sourceQuaternary, other.sourceQuaternary, t),
      quaternary: Color.lerp(quaternary, other.quaternary, t),
      onQuaternary: Color.lerp(onQuaternary, other.onQuaternary, t),
      quaternaryContainer: Color.lerp(quaternaryContainer, other.quaternaryContainer, t),
      onQuaternaryContainer: Color.lerp(onQuaternaryContainer, other.onQuaternaryContainer, t),
      sourceQuinary: Color.lerp(sourceQuinary, other.sourceQuinary, t),
      quinary: Color.lerp(quinary, other.quinary, t),
      onQuinary: Color.lerp(onQuinary, other.onQuinary, t),
      quinaryContainer: Color.lerp(quinaryContainer, other.quinaryContainer, t),
      onQuinaryContainer: Color.lerp(onQuinaryContainer, other.onQuinaryContainer, t),
      sourceSetarian: Color.lerp(sourceSetarian, other.sourceSetarian, t),
      setarian: Color.lerp(setarian, other.setarian, t),
      onSetarian: Color.lerp(onSetarian, other.onSetarian, t),
      setarianContainer: Color.lerp(setarianContainer, other.setarianContainer, t),
      onSetarianContainer: Color.lerp(onSetarianContainer, other.onSetarianContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  @override
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}

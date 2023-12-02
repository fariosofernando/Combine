import 'package:flutter/material.dart';

import '../logics/parse_proprerties.dart';

Widget buildText(Iterator<String> iterator) {
  Map proprerties = extractProperties(iterator);

  return Text(
    proprerties['text'],
    style: TextStyle(
      inherit: proprerties.containsKey('inherit') ? parseBool(proprerties['inherit']) : true,
      color: proprerties.containsKey('color') ? parseColor(proprerties['color']) : null,
      // Color? backgroundColor,
      fontSize: proprerties.containsKey('fontSize') ? parseDouble(proprerties['fontSize']) : null,
      // FontWeight? fontWeight,
      // FontStyle? fontStyle,
      // double? letterSpacing,
      // double? wordSpacing,
      // TextBaseline? textBaseline,
      // double? height,
      // TextLeadingDistribution? leadingDistribution,
      // Locale? locale,
      // Paint? foreground,
      // Paint? background,
      // List<Shadow>? shadows,
      // List<FontFeature>? fontFeatures,
      // List<FontVariation>? fontVariations,
      // TextDecoration? decoration,
      // Color? decorationColor,
      // TextDecorationStyle? decorationStyle,
      // double? decorationThickness,
      // String? debugLabel,
      // String? fontFamily,
      // List<String>? fontFamilyFallback,
      // String? package,
      overflow: proprerties.containsKey('overflow') ? parseTextOverflow(proprerties['overflow']) : null,
    ),
    textAlign: proprerties.containsKey('textAlign') ? parseTextAlign(proprerties['textAlign']) : null,
    overflow: proprerties.containsKey('overflow') ? parseTextOverflow(proprerties['overflow']) : null,
    maxLines: proprerties.containsKey('maxLines') ? parseInt(proprerties['maxLines']) : null,
  );
}

bool parseBool(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
  }

  return false;
}

Color parseColor(String color) {
  try {
    return Color(int.parse(color, radix: 16) | 0xFF000000);
  } catch (e) {
    return Colors.black87;
  }
}

double parseDouble(String value) {
  try {
    return double.parse(value);
  } catch (e) {
    return 14;
  }
}

int parseInt(String value) {
  try {
    return int.parse(value);
  } catch (e) {
    return 1;
  }
}

TextOverflow parseTextOverflow(String overflow) {
  switch (overflow.toLowerCase()) {
    case 'clip':
      return TextOverflow.clip;
    case 'fade':
      return TextOverflow.fade;
    case 'ellipsis':
      return TextOverflow.ellipsis;
    default:
      return TextOverflow.clip;
  }
}

TextStyle parseTextStyle(Map<String, dynamic> properties) {
  return TextStyle(
    color: parseColor(properties['color']),
    fontSize: parseDouble(properties['fontSize']),
  );
}

TextAlign parseTextAlign(String textAlign) {
  switch (textAlign.toLowerCase()) {
    case 'left':
      return TextAlign.left;
    case 'right':
      return TextAlign.right;
    case 'center':
      return TextAlign.center;
    case 'justify':
      return TextAlign.justify;
    default:
      return TextAlign.center;
  }
}

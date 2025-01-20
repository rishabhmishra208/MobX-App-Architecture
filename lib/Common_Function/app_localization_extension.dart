import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations get localization {
    return AppLocalizations.of(this)!;
  }
}

extension Localization on State<StatefulWidget> {
  AppLocalizations get localization {
    return AppLocalizations.of(context)!;
  }
}

extension StringExtensions on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  bool get isNotNullOrEmpty {
    return this != null && this!.isNotEmpty;
  }
}

extension StringExtension on String {
  bool toBoolean() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    } else {
      return false;
    }
  }

  // Convert string to int
  int? toInt() {
    return int.tryParse(this); // Returns null if the conversion fails
  }

  // Convert string to double
  double? toDouble() {
    return double.tryParse(this); // Returns null if the conversion fails
  }

  // Convert string to bool
  bool? toBool() {
    String lowerCaseValue = toLowerCase();
    if (lowerCaseValue == 'true') return true;
    if (lowerCaseValue == 'false') return false;
    return null; // Return null if the conversion fails
  }

  // This function is user for Captital first latter of String...
  String toTitleCase(List<String> specialChars) {
    if (isEmpty) return this;

    // Create a pattern from the list of special characters
    String pattern = specialChars.map((char) => RegExp.escape(char)).join('|');

    // Replace all occurrences of special characters with spaces
    return replaceAll(RegExp('($pattern)'), ' ')
        .split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : word)
        .join(' ');
  }
}

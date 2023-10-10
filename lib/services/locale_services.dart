
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocaleServices{
  static Future<bool> checkIfUserIsInIran(BuildContext context) async {
    // Check language preference
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'fa') {
      print('User prefers Persian language');
      return true;
    }

    // Initialize timezone data
    tz.initializeTimeZones();

    // Check timezone
    String currentTimeZone = tz.local.name;
    print('Current timezone: $currentTimeZone');
    if (currentTimeZone.contains('Tehran') || currentTimeZone.contains('Iran')) {
      print('User is possibly in Iran based on timezone');
      return true;
    }

    return false;
  }
}
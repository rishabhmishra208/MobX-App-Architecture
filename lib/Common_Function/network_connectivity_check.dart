import 'dart:io';

import 'package:flutter/foundation.dart';

Future<bool> hasNetwork() async {
  String url = kIsWeb ? 'www.google.com' : 'google.com';

  if (!kIsWeb) {
    try {
      final result = await InternetAddress.lookup(url); // google.com
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  } else {
    return true;
  }
}

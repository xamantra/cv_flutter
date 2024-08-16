import 'dart:convert';

import 'package:cv_flutter/data/cv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void logData() {
  if (kDebugMode) {
    final json = cv.toMap();

    Clipboard.setData(ClipboardData(text: jsonEncode(json)));
  }
}

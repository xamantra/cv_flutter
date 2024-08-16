import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

bool get isDark {
  var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  return brightness == Brightness.dark;
}

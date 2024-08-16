import 'package:cv_flutter/cv.dart';
import 'package:cv_flutter/data/cv.dart';
import 'package:cv_flutter/theme/themes.dart';
import 'package:cv_flutter/utils/is_night.dart';
import 'package:cv_flutter/utils/log_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logData();
    return MaterialApp(
      title: 'Charlou',
      theme: ThemeData(
        scaffoldBackgroundColor: isDark ? darkTheme.mainBackground : lightTheme.mainBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: isDark ? darkTheme.accent : lightTheme.accent,
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
        extensions: [
          isDark ? darkTheme : lightTheme,
        ],
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: CVPage(
        cv: cv,
      ),
    );
  }
}

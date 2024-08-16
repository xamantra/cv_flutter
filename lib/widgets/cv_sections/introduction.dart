import 'package:cv_flutter/data/model.dart';
import 'package:cv_flutter/theme/themes.dart';
import 'package:flutter/material.dart';

class CVIntroduction extends StatelessWidget {
  const CVIntroduction({
    super.key,
    required this.cv,
  });

  final CVData cv;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        cv.introduction,
        style: Theme.of(context).textStylePrimary.copyWith(
          fontSize: 13,
        ),
      ),
    );
  }
}

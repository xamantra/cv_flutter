import 'package:collection/collection.dart';
import 'package:cv_flutter/data/model.dart';
import 'package:cv_flutter/theme/themes.dart';
import 'package:cv_flutter/widgets/cv_sections/widgets/experience_item.dart';
import 'package:flutter/material.dart';

class CVExperienceSection extends StatelessWidget {
  const CVExperienceSection({
    super.key,
    required this.cv,
  });

  final CVData cv;

  // sort by newest
  List<CVExperience> get exp => cv.experience..sort((a, b) => b.started.compareTo(a.started));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experience",
            style: Theme.of(context).textStyleSecondary.copyWith(
                  fontSize: 12,
                ),
          ),
          SizedBox(height: 8),
          ...exp.mapIndexed((i, e) {
            return ExperienceItemWidget(experience: e);
          }).toList(),
        ],
      ),
    );
  }
}

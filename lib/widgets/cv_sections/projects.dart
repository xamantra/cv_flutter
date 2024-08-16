// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:cv_flutter/theme/themes.dart';
import 'package:cv_flutter/widgets/cv_sections/widgets/project_item.dart';
import 'package:flutter/material.dart';

import 'package:cv_flutter/data/model.dart';

class CVProjectsSection extends StatelessWidget {
  const CVProjectsSection({
    Key? key,
    required this.cv,
  }) : super(key: key);

  final CVData cv;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: Theme.of(context).textStyleSecondary.copyWith(
                  fontSize: 12,
                ),
          ),
          SizedBox(height: 12),
          ...cv.projects.mapIndexed(
            (index, project) {
              return CVProjectItem(
                project: project,
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}

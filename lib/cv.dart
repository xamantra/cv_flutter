import 'package:cv_flutter/data/model.dart';
import 'package:cv_flutter/theme/themes.dart';
import 'package:cv_flutter/widgets/cv_sections/experience.dart';
import 'package:cv_flutter/widgets/cv_sections/header.dart';
import 'package:cv_flutter/widgets/cv_sections/introduction.dart';
import 'package:cv_flutter/widgets/cv_sections/projects.dart';
import 'package:cv_flutter/widgets/cv_sections/tags_section.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CVPage extends StatelessWidget {
  const CVPage({
    super.key,
    required this.cv,
  });

  final CVData cv;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            screen.width >= 794
                ? Row(
                    children: [
                      Spacer(),
                      SizedBox(width: 18),
                      SizedBox(
                        width: 758,
                        child: Column(
                          children: [
                            SizedBox(height: 32),
                            CVHeaderSection(cv: cv),
                            SizedBox(height: 14),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      CVIntroduction(cv: cv),
                                      SizedBox(height: 12),
                                      CVExperienceSection(cv: cv),
                                      CVTagsSection(
                                        title: "Skills",
                                        tags: cv.skillTags,
                                      ),
                                      SizedBox(height: 24),
                                      CVTagsSection(
                                        title: "Interests",
                                        tags: cv.interestTags,
                                      ),
                                      SizedBox(height: 24),
                                      CVTagsSection(
                                        title: "Hobbies",
                                        tags: cv.hobbyTags,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Opacity(
                                        opacity: 0.0,
                                        child: CVIntroduction(cv: cv),
                                      ),
                                      SizedBox(height: 12),
                                      CVProjectsSection(cv: cv),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                      SizedBox(width: 18),
                      Spacer(),
                    ],
                  )
                : Row(
                    children: [
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 24),
                            CVHeaderSection(cv: cv),
                            SizedBox(height: 18),
                            CVIntroduction(cv: cv),
                            SizedBox(height: 24),
                            CVExperienceSection(cv: cv),
                            CVTagsSection(
                              title: "Skills",
                              tags: cv.skillTags,
                            ),
                            SizedBox(height: 24),
                            CVTagsSection(
                              title: "Interests",
                              tags: cv.interestTags,
                            ),
                            SizedBox(height: 24),
                            CVTagsSection(
                              title: "Hobbies",
                              tags: cv.hobbyTags,
                            ),
                            SizedBox(height: 24),
                            CVProjectsSection(cv: cv),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
            SizedBox(height: 32),
            Text(
              "© ${DateFormat("y").format(DateTime.now())} Charlou Aredidon, All rights reserved. This website is made with Flutter.",
              style: Theme.of(context).textStyleSecondary.copyWith(
                    fontSize: 12,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

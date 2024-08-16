import 'package:cv_flutter/data/model.dart';
import 'package:cv_flutter/theme/themes.dart';
import 'package:cv_flutter/widgets/chip.dart';
import 'package:flutter/material.dart';

class ExperienceItemWidget extends StatelessWidget {
  const ExperienceItemWidget({super.key, required this.experience});

  final CVExperience experience;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                experience.company,
                style: theme.textStylePrimary.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 8),
              Tooltip(
                message: experience.howLong,
                child: ChipWidget(
                  color: theme.custom.primaryFont.withOpacity(0.65),
                  child: Text(
                    "${experience.formatStarted("MMM y")} - ${experience.formatEnded("MMM y")}",
                    style: TextStyle(
                      fontSize: 10,
                      color: theme.custom.mainBackground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            experience.role,
            style: theme.textStyleAccent.modify(
              opacity: 0.75,
              fontSize: 12,
            ),
          ),
          ...experience.bulletList.map((bulletText) {
            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "- $bulletText",
                      style: theme.textStylePrimary.modify(
                        opacity: 0.8,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

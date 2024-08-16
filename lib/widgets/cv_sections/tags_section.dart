import 'package:cv_flutter/theme/themes.dart';
import 'package:flutter/material.dart';

class CVTagsSection extends StatelessWidget {
  const CVTagsSection({
    super.key,
    required this.title,
    required this.tags,
  });

  final String title;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textStyleSecondary.copyWith(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      color: theme.custom.accent.withOpacity(0.65),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      e,
                      style: theme.textStylePrimary.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

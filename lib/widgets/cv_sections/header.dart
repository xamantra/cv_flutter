// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cv_flutter/theme/themes.dart';
import 'package:flutter/material.dart';

import 'package:cv_flutter/data/model.dart';

class CVHeaderSection extends StatelessWidget {
  const CVHeaderSection({
    Key? key,
    required this.cv,
  }) : super(key: key);
  final CVData cv;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context).size;
    return Row(
      children: [
        if (screen.width >= 530)
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: cv.avatar,
              height: 96,
              width: 96,
              fit: BoxFit.cover,
            ),
          ),
        SizedBox(width: screen.width >= 530 ? 12 : 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cv.name,
                style: theme.textStylePrimary.copyWith(
                  fontSize: 24,
                ),
              ),
              Text(
                cv.title,
                style: theme.textStyleSecondary.copyWith(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              cv.email,
              style: theme.textStyleAccent,
            ),
            const SizedBox(height: 4),
            Text(
              "${cv.contactNumber} (${cv.contactType})",
              style: theme.textStyleAccent.modify(
                opacity: 0.9,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

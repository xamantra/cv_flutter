// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:cv_flutter/theme/themes.dart';
import 'package:cv_flutter/widgets/chip.dart';
import 'package:flutter/material.dart';

import 'package:cv_flutter/data/model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CVProjectItem extends StatelessWidget {
  const CVProjectItem({
    Key? key,
    required this.project,
  }) : super(key: key);

  final CVProject project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.custom.cardBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  project.name,
                  style: theme.textStylePrimary.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              ...project.links.entries.map((e) {
                return _LinkButton(
                  type: e.key,
                  link: e.value,
                );
              }),
            ],
          ),
          Text(
            project.summary,
            style: theme.textStylePrimary.modify(
              fontSize: 13,
              opacity: 0.75,
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 4,
            children: project.tags.map((e) {
              return ChipWidget(
                color: theme.custom.mainBackground,
                child: Text(
                  e,
                  style: theme.textStyleAccent.copyWith(
                    fontSize: 10,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({
    required this.type,
    required this.link,
  });

  final PlatformType type;
  final String link;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        window.open(link, 'new tab');
      },
      icon: switch (type) {
        PlatformType.Android => Tooltip(
            message: "Google Play",
            child: Icon(
              FontAwesomeIcons.android,
              size: 18,
            ),
          ),
        PlatformType.iOS => Tooltip(
            message: "iOS Appstore",
            child: Icon(
              FontAwesomeIcons.appStoreIos,
              size: 18,
            ),
          ),
        PlatformType.Web => Tooltip(
            message: "Web",
            child: Icon(
              Icons.web,
              size: 18,
            ),
          ),
      },
    );
  }
}

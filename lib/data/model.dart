// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class CVData {
  const CVData({
    required this.avatar,
    required this.name,
    required this.title,
    required this.introduction,
    required this.email,
    required this.contactNumber,
    required this.contactType,
    required this.experience,
    required this.skillTags,
    required this.interestTags,
    required this.hobbyTags,
    required this.projects,
  });

  final String avatar;
  final String name;
  final String title;
  final String introduction;
  final String email;
  final String contactNumber;
  final String contactType;
  final List<String> skillTags;
  final List<String> interestTags;
  final List<String> hobbyTags;

  final List<CVExperience> experience;
  final List<CVProject> projects;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar': avatar,
      'name': name,
      'title': title,
      'introduction': introduction,
      'email': email,
      'contactNumber': contactNumber,
      'contactType': contactType,
      'skillTags': skillTags,
      'interestTags': interestTags,
      'hobbyTags': hobbyTags,
      'experience': experience.map((x) => x.toMap()).toList(),
      'projects': projects.map((x) => x.toMap()).toList(),
    };
  }

  factory CVData.fromMap(Map<String, dynamic> map) {
    return CVData(
      avatar: map['avatar'] as String,
      name: map['name'] as String,
      title: map['title'] as String,
      introduction: map['introduction'] as String,
      email: map['email'] as String,
      contactNumber: map['contactNumber'] as String,
      contactType: map['contactType'] as String,
      skillTags: List<String>.from((map['skillTags'] as List).map((x) => x.toString())),
      interestTags: List<String>.from((map['interestTags'] as List).map((x) => x.toString())),
      hobbyTags: List<String>.from((map['hobbyTags'] as List).map((x) => x.toString())),
      experience: List<CVExperience>.from(
        (map['experience'] as List).map<CVExperience>(
          (x) => CVExperience.fromMap(x as Map<String, dynamic>),
        ),
      ),
      projects: List<CVProject>.from(
        (map['projects'] as List).map<CVProject>(
          (x) => CVProject.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CVData.fromJson(String source) => CVData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CVExperience {
  const CVExperience({
    required this.company,
    required this.role,
    required this.bulletList,
    required this.started,
    required this.ended,
  });

  final String company;
  final String role;
  final List<String> bulletList;
  final DateTime started;
  final DateTime ended;

  bool get isCurrentlyWorking => ended.year == 0;
  String get howLong {
    final e = isCurrentlyWorking ? DateTime.now() : ended;
    final days = e.difference(started).inDays;
    final months = days ~/ 30;
    final years = months ~/ 12;
    final monthRemainder = months % 12;

    final isYearPlural = years > 1;
    final isMonthPlural = monthRemainder > 1;

    if (years == 0) return "$monthRemainder month${isMonthPlural ? 's' : ''}";
    return '$years year${isYearPlural ? "s" : ""} ${monthRemainder != 0 ? "$monthRemainder month${isMonthPlural ? 's' : ''}" : ""}'.trim();
  }

  String formatStarted(String format) {
    return DateFormat(format).format(started);
  }

  String formatEnded(String format) {
    if (isCurrentlyWorking) return "Present";
    return DateFormat(format).format(ended);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'company': company,
      'role': role,
      'bulletList': bulletList,
      'started': started.millisecondsSinceEpoch,
      'ended': ended.millisecondsSinceEpoch,
    };
  }

  factory CVExperience.fromMap(Map<String, dynamic> map) {
    return CVExperience(
      company: map['company'] as String,
      role: map['role'] as String,
      bulletList: List<String>.from((map['bulletList'] as List).map((x) => x.toString())),
      started: DateTime.fromMillisecondsSinceEpoch(map['started'] as int),
      ended: DateTime.fromMillisecondsSinceEpoch(map['ended'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CVExperience.fromJson(String source) => CVExperience.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CVProject {
  final String name;
  final String summary;
  final List<String> tags;
  final Map<PlatformType, String> links;

  CVProject({
    required this.name,
    required this.summary,
    required this.tags,
    required this.links,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'summary': summary,
      'tags': tags,
      'links': links.map((key, value) => MapEntry(key.name, value)),
    };
  }

  factory CVProject.fromMap(Map<String, dynamic> map) {
    return CVProject(
      name: map['name'] as String,
      summary: map['summary'] as String,
      tags: List<String>.from((map['tags'] as List).map((x) => x.toString())),
      links: Map<PlatformType, String>.from((map['links'] as Map).map((k, v) => MapEntry(PlatformType.values.firstWhere((e) => e.name == k), v as String))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CVProject.fromJson(String source) => CVProject.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum PlatformType {
  Android,
  iOS,
  Web,
}

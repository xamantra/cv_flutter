import 'package:flutter_test/flutter_test.dart';
import 'package:cv_flutter/data/model.dart';

void main() {
  group('CVData', () {
    test('toMap and fromMap should work correctly', () {
      final experience = CVExperience(
        company: 'Test Company',
        role: 'Developer',
        bulletList: ['Did something', 'Did another thing'],
        started: DateTime(2020, 1, 1),
        ended: DateTime(2021, 1, 1),
      );

      final project = CVProject(
        name: 'Test Project',
        summary: 'A test project',
        tags: ['flutter', 'dart'],
        links: {PlatformType.Web: 'https://example.com'},
      );

      final cvData = CVData(
        avatar: 'avatar.png',
        name: 'John Doe',
        title: 'Software Engineer',
        introduction: 'Hello!',
        email: 'john@example.com',
        contactNumber: '1234567890',
        contactType: 'mobile',
        skillTags: ['Dart', 'Flutter'],
        interestTags: ['AI', 'ML'],
        hobbyTags: ['Reading', 'Gaming'],
        experience: [experience],
        projects: [project],
      );

      final map = cvData.toMap();
      final fromMap = CVData.fromMap(map);

      expect(fromMap.avatar, cvData.avatar);
      expect(fromMap.name, cvData.name);
      expect(fromMap.title, cvData.title);
      expect(fromMap.introduction, cvData.introduction);
      expect(fromMap.email, cvData.email);
      expect(fromMap.contactNumber, cvData.contactNumber);
      expect(fromMap.contactType, cvData.contactType);
      expect(fromMap.skillTags, cvData.skillTags);
      expect(fromMap.interestTags, cvData.interestTags);
      expect(fromMap.hobbyTags, cvData.hobbyTags);
      expect(fromMap.experience.first.company, experience.company);
      expect(fromMap.projects.first.name, project.name);
    });

    test('toJson and fromJson should work correctly', () {
      final experience = CVExperience(
        company: 'Test Company',
        role: 'Developer',
        bulletList: ['Did something'],
        started: DateTime(2020, 1, 1),
        ended: DateTime(2021, 1, 1),
      );

      final project = CVProject(
        name: 'Test Project',
        summary: 'A test project',
        tags: ['flutter'],
        links: {PlatformType.Android: 'https://play.google.com'},
      );

      final cvData = CVData(
        avatar: 'avatar.png',
        name: 'Jane Doe',
        title: 'Engineer',
        introduction: 'Hi!',
        email: 'jane@example.com',
        contactNumber: '0987654321',
        contactType: 'email',
        skillTags: ['Dart'],
        interestTags: ['Robotics'],
        hobbyTags: ['Chess'],
        experience: [experience],
        projects: [project],
      );

      final json = cvData.toJson();
      final fromJson = CVData.fromJson(json);

      expect(fromJson.name, cvData.name);
      expect(fromJson.projects.first.links[PlatformType.Android], 'https://play.google.com');
    });
  });
}

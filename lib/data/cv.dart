import 'package:cv_flutter/data/model.dart';

final cv = CVData(
  avatar: "https://i.imgur.com/FOqHgnu.png",
  name: "Charlou Aredidon",
  title: "Flutter App Developer",
  introduction: "Hello there! I've been a flutter developer for 5 years now. Having a wide variety of experience ranging from flutter to backend technologies. I'm from the Philippines.",
  email: "mail@charlou.dev",
  contactNumber: "+63 9391985951",
  contactType: "Phone",
  skillTags: [
    "Dart",
    "Flutter",
    "Nodejs",
    "Google Cloud",
    "Firebase",
    "Android",
    "Web",
    "iOS",
  ],
  interestTags: [
    "AI Research",
    "Startups",
    "Data Analytics",
  ],
  hobbyTags: [
    "Video Games",
    "Twitch",
    "Netflix",
  ],
  experience: [
    CVExperience(
      company: "POSBANG",
      role: "Flutter Full-Stack Developer",
      bulletList: [
        "Apps for Human Resource",
        "Learn and develop apps with Flutter",
        "Maintain existing (legacy) projects written in Java",
        "API development and maintenance on PHP backend codebase",
      ],
      started: DateTime(2019, 5),
      ended: DateTime(2022, 5),
    ),
    CVExperience(
      company: "Beaconforce",
      role: "Flutter Developer",
      bulletList: [
        "App for Employee Analytics",
        "Mobile and Web app development with Flutter",
        "CI/CD management for release automation",
        "Backend debugging with Google Cloud Functions",
      ],
      started: DateTime(2021, 7),
      ended: DateTime(2023, 5),
    ),
    CVExperience(
      company: "Petagon",
      role: "Flutter Full-Stack Developer",
      bulletList: [
        "App for Pets",
        "Mobile and Web app development with Flutter",
        "Backend development with Google Cloud Functions",
      ],
      started: DateTime(2022, 11),
      ended: DateTime(2024, 1),
    ),
    CVExperience(
      company: "BeyondBrain",
      role: "Flutter Developer",
      bulletList: [
        "App for Travel",
        "Mobile development with Flutter",
      ],
      started: DateTime(2024, 2),
      ended: DateTime(0), // year=0 means currently working
    ),
  ],
  projects: [
    CVProject(
      name: "Lumi Travel",
      summary: "Travel planning app with AI.",
      tags: [
        "Android",
        "iOS",
        "Firebase",
        "Analytics",
      ],
      links: {
        PlatformType.Android: "https://play.google.com/store/apps/details?id=com.zipptrip.lumi",
        PlatformType.iOS: "https://apps.apple.com/us/app/lumi-ai-trip-planner/id6478133479",
      },
    ),
    CVProject(
      name: "Petagon",
      summary: "Apps for managing pet documents, pet attractions and vet access.",
      tags: [
        "Android",
        "iOS",
        "Firebase",
        "Analytics",
        "Nodejs",
      ],
      links: {
        PlatformType.Android: "https://play.google.com/store/apps/details?id=com.petagon.app&pli=1",
        PlatformType.iOS: "https://apps.apple.com/ph/app/petagon-pet-care-simplified/id6443600472",
      },
    ),
    CVProject(
      name: "My Timesheets",
      summary: "Human Resource management app for companies.",
      tags: [
        "Android",
        "iOS",
        "PHP",
      ],
      links: {
        PlatformType.Android: "https://play.google.com/store/apps/details?id=com.wittymanager.my_timesheet",
        PlatformType.iOS: "https://apps.apple.com/us/app/my-timesheet-witty/id1475219085",
      },
    ),
    CVProject(
      name: "Beaconforce",
      summary: "Employee Analytics and Statistics using AI.",
      tags: [
        "Android",
        "iOS",
        "Firebase",
        "Nodejs",
        "CI/CD",
      ],
      links: {
        PlatformType.Android: "https://play.google.com/store/apps/details?id=com.crassusmh.beaconforce",
        PlatformType.iOS: "https://apps.apple.com/ph/app/beaconforce/id1408124689",
      },
    ),
    CVProject(
      name: "Beaconforce Admin",
      summary: "Admin Dashboard for Beaconforce. Can't provide a link because this is an internal app.",
      tags: [
        "Flutter Web",
        "Firebase",
        "Nodejs",
        "CI/CD",
      ],
      links: {},
    ),
    CVProject(
      name: "Quantz",
      summary: "A hobby project. Push Notification service for anime episodes and news.",
      tags: [
        "Android",
        "Firebase",
        "Nodejs",
        "CI/CD",
      ],
      links: {
        PlatformType.Android: "https://play.google.com/store/apps/details?id=dev.xamantra.quantz",
      },
    ),
  ],
);

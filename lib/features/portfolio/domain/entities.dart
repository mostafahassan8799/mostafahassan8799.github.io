/// Pure Dart entities: no Flutter imports, so the domain layer stays testable
/// and independent of the UI.
library;

class Profile {
  const Profile({
    required this.name,
    required this.role,
    required this.company,
    required this.location,
    required this.headline,
    required this.summary,
    required this.email,
    required this.linkedInUrl,
    required this.gitHubUrl,
    required this.cvPath,
    required this.stats,
    required this.projects,
    required this.jobs,
    required this.caseStudies,
    required this.skills,
    required this.education,
  });

  final String name;
  final String role;
  final String company;
  final String location;
  final String headline;
  final String summary;
  final String email;
  final String linkedInUrl;
  final String gitHubUrl;
  final String cvPath;
  final List<Stat> stats;
  final List<Project> projects;
  final List<Job> jobs;
  final List<CaseStudy> caseStudies;
  final List<SkillGroup> skills;
  final String education;
}

class Stat {
  const Stat(this.value, this.label);

  final String value;
  final String label;
}

class StoreLink {
  const StoreLink(this.label, this.url);

  final String label;
  final String url;
}

class Project {
  const Project({
    required this.name,
    required this.category,
    required this.initials,
    required this.gradient,
    required this.metrics,
    required this.highlights,
    required this.stack,
    this.links = const [],
    this.featured = false,
  });

  final String name;
  final String category;
  final String initials;

  /// ARGB values, converted to colors in the presentation layer.
  final List<int> gradient;
  final List<String> metrics;
  final List<String> highlights;
  final List<String> stack;
  final List<StoreLink> links;
  final bool featured;
}

class Job {
  const Job({
    required this.title,
    required this.company,
    required this.period,
    required this.location,
    required this.bullets,
  });

  final String title;
  final String company;
  final String period;
  final String location;
  final List<String> bullets;
}

class CaseStudy {
  const CaseStudy({
    required this.headline,
    required this.title,
    required this.paragraphs,
  });

  final String headline;
  final String title;
  final List<String> paragraphs;
}

class SkillGroup {
  const SkillGroup(this.title, this.items);

  final String title;
  final List<String> items;
}

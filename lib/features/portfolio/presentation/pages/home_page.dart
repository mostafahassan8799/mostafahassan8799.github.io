import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/portfolio_repository.dart';
import '../widgets/case_studies_section.dart';
import '../widgets/common.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _sections = [
    'Apps',
    'Experience',
    'Case studies',
    'Skills',
    'Contact',
  ];

  final _keys = {
    'top': GlobalKey(),
    for (final s in _sections) s: GlobalKey(),
  };

  void _scrollTo(String section) {
    final ctx = _keys[section]?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.read<PortfolioRepository>().getProfile();

    return Scaffold(
      appBar: NavBar(
        name: profile.name,
        title: profile.title,
        sections: _sections,
        onNavigate: _scrollTo,
      ),
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(key: _keys['top'], profile: profile),
              SectionShell(
                key: _keys['Apps'],
                eyebrow: 'shipped apps',
                title: 'Apps in the hands of real users',
                child: ProjectsGrid(projects: profile.projects),
              ),
              SectionShell(
                key: _keys['Experience'],
                eyebrow: 'experience',
                title: "Where I've worked",
                tinted: true,
                child: ExperienceTimeline(jobs: profile.jobs),
              ),
              SectionShell(
                key: _keys['Case studies'],
                eyebrow: 'case studies',
                title: 'How I solve production problems',
                child: CaseStudiesGrid(caseStudies: profile.caseStudies),
              ),
              SectionShell(
                key: _keys['Skills'],
                eyebrow: 'toolkit',
                title: 'Skills',
                tinted: true,
                child: SkillsGrid(
                  skills: profile.skills,
                  education: profile.education,
                ),
              ),
              ContactSection(key: _keys['Contact'], profile: profile),
              Footer(name: profile.name),
            ],
          ),
        ),
      ),
    );
  }
}

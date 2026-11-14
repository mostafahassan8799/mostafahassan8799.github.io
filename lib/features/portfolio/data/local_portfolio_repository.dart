import '../domain/entities.dart';
import '../domain/portfolio_repository.dart';

class LocalPortfolioRepository implements PortfolioRepository {
  const LocalPortfolioRepository();

  @override
  Profile getProfile() => _profile;
}

const _profile = Profile(
  name: 'Mostafa Hassan',
  role: 'Senior Flutter Developer',
  company: 'MisMar',
  location: 'Cairo, Egypt',
  headline: 'I build Flutter apps that\nship, scale, and stay stable.',
  summary:
      '4+ years shipping production apps on iOS, Android, and Huawei '
      'AppGallery. I specialize in real-time features (live tracking, '
      'WebSockets, background location), wallets & payments, and '
      'maintainable codebases with Bloc/Cubit, Provider, and Clean '
      'Architecture.',
  email: 'mostafahassan8799@gmail.com',
  linkedInUrl: 'https://www.linkedin.com/in/mostafahassan8799/',
  gitHubUrl: 'https://github.com/mostafahassan8799',
  cvPath: 'Mostafa_Hassan_Flutter_Developer_CV.pdf',
  stats: [
    Stat('4+', 'years in production Flutter'),
    Stat('6', 'published apps'),
    Stat('100K+', 'downloads on MisMar'),
    Stat('17', 'production crashes fixed'),
  ],
  projects: [
    Project(
      name: 'MisMar: Automotive Services',
      category: 'Car maintenance marketplace · Saudi Arabia',
      initials: 'M',
      gradient: [0xFFE11D2E, 0xFF7F1D1D],
      featured: true,
      metrics: ['100K+ downloads', '4.1★ · 16K ratings', '11 crashes fixed'],
      highlights: [
        'Connects car owners in KSA with certified workshops.',
        'Built the Bogi Points Wallet, Car Selling services, and the Ramadan '
            'Game coupon feature.',
        'Dio-based API layer, push notifications, and background services.',
      ],
      stack: ['Flutter', 'Provider', 'Dio', 'FCM', 'Background Services'],
      links: [
        StoreLink(
          'Google Play',
          'https://play.google.com/store/search?q=MisMar&c=apps',
        ),
        StoreLink('App Store', 'https://apps.apple.com/sa/search?term=MisMar'),
      ],
    ),
    Project(
      name: 'MisMar Ops',
      category: 'Real-time operations app',
      initials: 'Op',
      gradient: [0xFFF97316, 0xFFB91C1C],
      metrics: ['1K+ downloads', '4.6★ · 29 reviews', '6 crashes fixed'],
      highlights: [
        'Coordinates workshops, towing, spare parts, and clients.',
        'Socket-based tracking and background services.',
      ],
      stack: ['WebSockets', 'Provider', 'FCM'],
    ),
    Project(
      name: 'Light & Fast Drivers',
      category: 'Delivery driver app',
      initials: 'L',
      gradient: [0xFF22C55E, 0xFF15803D],
      metrics: ['Led end-to-end', 'Live on Google Play'],
      highlights: [
        'Real-time delivery tracking on OpenStreetMap.',
        'Background location and socket-based live tracking.',
      ],
      stack: ['Cubit', 'OpenStreetMap', 'WebSockets'],
    ),
    Project(
      name: 'Light & Fast Stores',
      category: 'Store & order management',
      initials: 'S',
      gradient: [0xFF16A34A, 0xFF065F46],
      metrics: ['Led end-to-end', 'Live on Google Play'],
      highlights: [
        'Incoming orders with real-time tracking.',
        'Clean Architecture with a modular feature-based structure.',
      ],
      stack: ['Cubit', 'Clean Arch', 'REST', 'FCM'],
    ),
    Project(
      name: 'Krafttopia Shop',
      category: 'E-commerce seller app',
      initials: 'K',
      gradient: [0xFFA855F7, 0xFF6D28D9],
      metrics: ['3 stores', 'Play · App Store · AppGallery'],
      highlights: [
        'TikTok-style short-video feed with a custom camera UI.',
        'Huawei Petal Maps + Firebase, shipped via CI/CD.',
      ],
      stack: ['Firebase', 'Petal Maps', 'CI/CD'],
    ),
    Project(
      name: 'Ershaad',
      category: 'Telehealth / therapy platform',
      initials: 'E',
      gradient: [0xFF0EA5E9, 0xFF0369A1],
      metrics: ['Video & voice calls', 'Live on Google Play'],
      highlights: [
        'Doctor-patient calls with Agora; payments with Fawaterk.',
        'Appointments, patient records, and treatment plans.',
      ],
      stack: ['Agora', 'Fawaterk', 'FCM'],
    ),
  ],
  jobs: [
    Job(
      title: 'Senior Flutter Developer',
      company: 'MisMar',
      period: '03/2025 — Present',
      location: 'Riyadh (Remote)',
      bullets: [
        'Built the Bogi Points Wallet, Car Selling services, and multi-step '
            'service workflows (Flutter, Provider, Dio).',
        'Resolved 17 Sentry-flagged production crashes across MisMar and '
            'MisMar Ops.',
        'Contributed to MisMar Ops with socket-based tracking and background '
            'services.',
        'Code reviews on team PRs; worked with backend, product, and design on '
            'API contracts.',
      ],
    ),
    Job(
      title: 'Flutter Developer',
      company: 'Dynamic Business Solution',
      period: '07/2024 — 02/2025',
      location: 'Cairo',
      bullets: [
        'Led two delivery apps (Stores + Drivers) from architecture to '
            'production release.',
        'Real-time tracking with WebSockets and OpenStreetMap; Cubit + Clean '
            'Architecture.',
      ],
    ),
    Job(
      title: 'Flutter Developer',
      company: 'Dinamo',
      period: '03/2024 — 01/2025',
      location: 'Part-time · Remote',
      bullets: [
        'Ride-hailing driver app: live location, ride matching, in-app '
            'navigation, and payments.',
      ],
    ),
    Job(
      title: 'Flutter Developer',
      company: 'Flowtech',
      period: '02/2023 — 06/2024',
      location: 'Alexandria',
      bullets: [
        'Krafttopia Shop seller app: short-video feed, Petal Maps, Firebase; '
            'CI/CD to 3 stores.',
      ],
    ),
  ],
  caseStudies: [
    CaseStudy(
      headline: '17',
      title: 'Production crashes fixed with Sentry',
      paragraphs: [
        'Across MisMar (11) and MisMar Ops (6), I traced and fixed crashes '
            'coming from a few recurring root causes: null-safety gaps, '
            'resource leaks, lifecycle errors, and unhandled API failures.',
        'Examples: null order IDs, FocusNode leaks, an animation provider used '
            'after dispose(), a live-location crash, and an unhandled Dio '
            'badResponse.',
        'Result: more stable releases, and fixes that targeted the cause, not '
            'one-off patches.',
      ],
    ),
    CaseStudy(
      headline: 'pts → SAR',
      title: 'Designing the Bogi Points Wallet',
      paragraphs: [
        'Users earn percentage-based points on services and redeem them at '
            'checkout as Riyal-equivalent value.',
        'The hard parts were partial redemption, keeping the balance '
            'consistent between wallet and checkout, and handling backend '
            'failures mid-payment, so the user never sees a wrong total.',
        'Result: a loyalty feature that drives repeat bookings in a 100K+ '
            'download app.',
      ],
    ),
  ],
  skills: [
    SkillGroup('Core', ['Dart', 'Flutter', 'Java (Android)']),
    SkillGroup(
      'State & Architecture',
      ['Bloc/Cubit', 'Provider', 'Clean Architecture', 'SOLID'],
    ),
    SkillGroup(
      'Networking & Real-time',
      ['REST', 'Dio', 'WebSockets', 'Background Services'],
    ),
    SkillGroup('Firebase', ['Auth', 'FCM', 'Analytics']),
    SkillGroup('Maps & Location', ['Google Maps', 'Petal Maps', 'OpenStreetMap']),
    SkillGroup('Payments & Calls', ['Stripe', 'PayMob', 'Fawaterk', 'Agora']),
    SkillGroup(
      'Delivery',
      ['Git', 'CI/CD', 'Play / App Store / AppGallery', 'Sentry'],
    ),
    SkillGroup('AI-Assisted Dev', ['Claude Code', 'Cursor', 'Figma AI']),
  ],
  education:
      'B.Sc. Computers & AI, Benha University (2017–2021) · Udemy: Flutter & '
      'Dart, Complete Dart · Udacity Android Track · Mahara-Tech (ITI)',
);

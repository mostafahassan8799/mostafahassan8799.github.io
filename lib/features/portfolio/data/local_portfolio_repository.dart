import '../domain/entities.dart';
import '../domain/portfolio_repository.dart';

class LocalPortfolioRepository implements PortfolioRepository {
  const LocalPortfolioRepository();

  @override
  Profile getProfile() => _profile;
}

const _profile = Profile(
  name: 'Mostafa Hassan',
  title: 'Senior Mobile Engineer',
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
  photoAsset: 'assets/images/profile.jpg',
  coverAsset: 'assets/images/cover.jpg',
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
      iconUrl: 'https://play-lh.googleusercontent.com/EeWiABto_IriBpd6x2aZvT6gTNWKrwHIAINq2zotGNj77gfPmzJGq_zV6hOC_ZdEmcIPNuFL0oL8H9iaPYstRw=w192-h192',
      screenshots: [
        'https://play-lh.googleusercontent.com/UfKXnj8B367ipuZ8eIR76KHkP6TuLAy89_hp3VCTy-N-vrGHeV1cHjjEMiPiGnWmZZjSYXtW85cpO1hmBokp=h480',
        'https://play-lh.googleusercontent.com/vf_lFGkqtHJjGsv2XzzaRu5JESyoKIteMQkHua_Z3SsKa9kC4sYZwrStrbRySaj5woQaUDh5nUH39kKXd54J2g=h480',
        'https://play-lh.googleusercontent.com/2ro3QEwolhDcbhPlBVUJawuK9ifJaDcMoGYBSU9shA4Dq0J3KPIKAYR5OcEzrQakjmiJHIBxDOAahYmv1CYb2w=h480',
        'https://play-lh.googleusercontent.com/363kxiOXjNnl3dF45Gncn5dUdO0aMOeN19zjKEQMWVvSddIdyXWErzXqKfprZEz6CyJ0nxKQR6sRTJrL_EoV0g=h480',
      ],
      links: [
        StoreLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=sa.com.carx',
        ),
        StoreLink(
          'App Store',
          'https://apps.apple.com/sa/app/mismar-%D9%85%D8%B3%D9%85%D8%A7%D8%B1/id1493302809',
        ),
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
      iconUrl: 'https://play-lh.googleusercontent.com/jor_tH3nRno2ui9HrHVF75hoz7l9vxIsi_pRFDBzQ1FaQEDxUNoadcMmF8dLM7JOYlTI51OH9upPdeUq7rqNiW4=w192-h192',
      screenshots: [
        'https://play-lh.googleusercontent.com/9s_kP-8438GgjGoAQawnJQ-JESAM0kw9-W-0BVAr49ozgzyViEAea-64jBtoYSQ-CRZ_Bnjy7UmQSAmzMIJju5c=h480',
        'https://play-lh.googleusercontent.com/7gJyJAYyAXLLr5RVTkpfSECT-RqjtUlBQUkh40FmpuBhcsmyS3EdSKq3ZlQy6GjrTCvLBEb-7IlBUQkJyWUUu7U=h480',
        'https://play-lh.googleusercontent.com/1UsrERVkUBy86Mbq4ouQs3e_08bOxHi8LSknXwrQ-MaWe2f9zlNBnSPb_tgO2zFn4QV9mcShPBGOqUvI9tiOPA=h480',
      ],
      links: [
        StoreLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.mismarapp.opsapp',
        ),
        StoreLink(
          'App Store',
          'https://apps.apple.com/sa/app/mismar-ops/id6461161680',
        ),
      ],
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
      iconUrl: 'https://play-lh.googleusercontent.com/Tl9KRdbKGfZCrgzizRjjGNvpBK4NjrKc75pruz6eG-Uw4jpAbQnp7ZJbm2JdR349mycm5EAXSGJhB4aWBmET=w192-h192',
      screenshots: [
        'https://play-lh.googleusercontent.com/ohF8uw2YMRgyBvRwcv7J2pv2m_Z-txerB6DVHfk9bwtxDbhedQ8wBDC4QRCT2UAvqGtH1Gjx348CSfpw9odQYw=h480',
        'https://play-lh.googleusercontent.com/IwHmACZwwCxYrLw6WGIDvOSQu-FYDz2XFZgl_4bvT9UDqRReHXQIvjfDzgcdFmqGefNtb4EuspQhEtUpqm0c=h480',
        'https://play-lh.googleusercontent.com/ibONlmf4W3V1FcSs6f52ZH_nSDNgbP2z_1FHN1-owuVajy-6LVCJLDlu3Tjg5-lcLbBo6RPlABFOIyZ-UiYz=h480',
      ],
      links: [
        StoreLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.LightDriver.Egypt',
        ),
      ],
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
      iconUrl: 'https://play-lh.googleusercontent.com/aWuxzOFti1g1VbMbcuqQtI0QBZDce8Ar5Azoi4k9wYxM_Khsb-yOeI0TdDgYZNxkMpeJqg1rY2VIhd_c8tVjQxc=w192-h192',
      screenshots: [
        'https://play-lh.googleusercontent.com/U_ap2hK6kJZfxxS1NUmXThsPI7ekhrKuW8U97cJtg8_5ST2vftdX9Na7RwgppY8m0E5CkeTISUWSlNRK_0wDpkc=h480',
        'https://play-lh.googleusercontent.com/8PhOoOmfFGiuLGvlQ74xxjNs-E5QL2QPeA4Ix4NEEz6jIMa_yjimMJ07zkSI3p0S41n2S2QiqBUS8KHYmb1rbQ=h480',
        'https://play-lh.googleusercontent.com/i-K7HCnm_p7-49MnuYra3AgVumu5hd5oOuB3VFGtI3tL5Vdss30alSHbG4y9hpcbw8_zknZzq77rrREMcOUGpA=h480',
      ],
      links: [
        StoreLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.LightStore.Egypt',
        ),
      ],
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
      iconUrl: 'https://play-lh.googleusercontent.com/EDYnZ2IV1lu_nrIyaY_3vjD6yr9FYq4ALiQvAOq8zPbDPmdL76MFOPiKSpOZSeryw6yHSIe2yYEEX2rmMHVSOA=w192-h192',
      screenshots: [
        'https://play-lh.googleusercontent.com/YyuPDGr3XjHVcT6LT-qzpLSIEUw_XE0mF-iwWxRsOxfkt8MC1EXwn3mnBmCKFSmpn3auIOJUmFnqdbnkeP0U=h480',
        'https://play-lh.googleusercontent.com/jAA38c9fEbRcshts_5ls_RMai-X6HSEkAlE6m24wiBMjj_oHZB6A6jSr1OZXD-4X-n7pPZxME6ivHJ3qdj37gg=h480',
        'https://play-lh.googleusercontent.com/r63mwAx5t_2jFlxuIlDza7OoElRJGct_38pBa1njQO5wtGWI7xBS5sELf6qtmQO71h028AhEX1_gviwEXden7w=h480',
      ],
      links: [
        StoreLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.hayaatak.ershaad.specialist',
        ),
      ],
    ),
    Project(
      name: 'Dinamo',
      category: 'Ride-hailing app · Egypt',
      initials: 'D',
      gradient: [0xFFFACC15, 0xFFCA8A04],
      metrics: ['50K+ downloads', 'Live tracking', 'Wallet payments'],
      highlights: [
        'Real-time location tracking, ride matching, and in-app navigation.',
        'Google Maps routing, ride history, payments, and push notifications.',
      ],
      stack: ['Google Maps', 'Real-time', 'FCM'],
      iconUrl: 'https://play-lh.googleusercontent.com/azfJz4l6P6iVfZpjABibsn7F5IH8Sq95xUwoRIlsuP-NuEKoF4DdTy84H9lsxoq2prOoJBrdB6GgMgy4lOk91Q=w192-h192',
      screenshots: [
        'https://play-lh.googleusercontent.com/O3JLfbXZt1BfzgJ8JS6Qtb-W-7rqSUEuYT_oheH8UeM88KhhAmr59g6xbe6R0hb-6NPr8ORqsaznijVLfLdVT7w=h480',
        'https://play-lh.googleusercontent.com/XpzP31Prq6V9Obf7_6S98hKxX8PDPMlkZXHwTRN6vUWUki7osEXNNyWQLSitJObALb1vObUyDYmBs7mY0r9q2-Q=h480',
        'https://play-lh.googleusercontent.com/0f2c5b3HyBVOuQAjdTPuSLTPU9nofd_Xa_5me3CxfsqmL-a-g8PqHwGzpU3jTPFuzX942wLUBOllAeZeuASU=h480',
      ],
      links: [
        StoreLink(
          'Google Play',
          'https://play.google.com/store/apps/details?id=com.starbugs.wasalni_rider',
        ),
      ],
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

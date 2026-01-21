import 'package:flutter/material.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/main.dart'; // handlePieNavTap
import 'package:pie_study/widgets/pie_footer.dart'; // ✅ Footer import
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:pie_study/widgets/global_floating_button.dart';

class PieStudyAboutPage extends StatelessWidget {
  const PieStudyAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      // 🔹 Mobile / tablet: right side drawer for nav
      endDrawer: Drawer(
        child: PieNavDrawer(
          activeId: 'about',
          onItemTap: (id) {
            Navigator.pop(context); // drawer close
            handlePieNavTap(context, id); // global navigation
          },
        ),
      ),

      appBar: AppBar(
        leading: const BackButton(color: Colors.black87),
        backgroundColor: Colors.white.withOpacity(0.96),
        elevation: 0.5,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black12,
        titleSpacing: 0,
        toolbarHeight: 68,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: PieTopNav(
            onItemTap: (id) => handlePieNavTap(context, id),
            activeId: 'about',
            onEnrollTap: () {
              showDialog(
                context: context,
                builder: (ctx) => const EnrollmentFormDialog(),
              );
            },
            ctaLabel: 'FAQ',
            onCtaTap: () => handlePieNavTap(context, 'faq'),
          ),
        ),
        actions: [
          // 🔹 Sirf small screen par menu icon
          if (!isWide)
            Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.black87),
                onPressed: () => Scaffold.of(ctx).openEndDrawer(),
              ),
            ),
        ],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 1200
              ? 1200.0
              : constraints.maxWidth;

          // ✅ ScrollView ke andar Column: content + full-width footer
          return SingleChildScrollView(
            child: Column(
              children: [
                // Centered content with maxWidth
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _HeroSection(),
                          SizedBox(height: 40),
                          _MissionSection(),
                          SizedBox(height: 32),
                          _VisionSection(),
                          SizedBox(height: 32),
                          _ValuesSection(),
                          SizedBox(height: 32),
                          _ApproachSection(),
                          SizedBox(height: 32),
                          _WhyChooseSection(),
                          SizedBox(height: 40),
                          _ShapingFutureSection(),
                          SizedBox(height: 40),
                          _TeamSection(),
                          SizedBox(height: 40),
                          _BottomCtaSection(),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),

                // Footer full screen width (no ConstrainedBox)
                PieFooter(
                  // ✅ 4 Programs → specific detail pages
                  onProgramTap: (id) {
                    switch (id) {
                      case 'managers':
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const AgenticManagersDetailPage(),
                          ),
                        );
                        break;

                      case 'developers':
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const AgenticDevelopersDetailPage(),
                          ),
                        );
                        break;

                      case 'ds_intern':
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DataScienceInternshipDetailPage(),
                          ),
                        );
                        break;

                      case 'ds_foundation':
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                const DataScienceFoundationDetailPage(),
                          ),
                        );
                        break;
                    }
                  },

                  // ✅ About Us link
                  onAboutTap: () {
                    handlePieNavTap(context, 'about');
                  },

                  // ✅ Our Verticals → B2G (vertical mapping main.dart me hai)
                  onVerticalsTap: () {
                    handlePieNavTap(context, 'verticals');
                  },

                  // ✅ Terms & Conditions
                  onBlogTap: () {
                    handlePieNavTap(context, 'tnc');
                  },

                  // ✅ FAQ
                  onFaqTap: () {
                    handlePieNavTap(context, 'faq');
                  },

                  // ✅ optional: email/phone future ke liye
                  onEmailTap: () {
                    // TODO: email launcher
                  },
                  onPhoneTap: () {
                    // TODO: phone dialer
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* ============================================================
 * 1. HERO SECTION
 * ==========================================================*/

// class _HeroSection extends StatelessWidget {
//   const _HeroSection();

//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width >= 800;

//     const left = _HeroText();
//     const right = _HeroImageCard();

//     if (isWide) {
//       return Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(child: left),
//           const SizedBox(width: 32),
//           Expanded(child: right),
//         ],
//       );
//     } else {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           left,
//           SizedBox(height: 24),
//           right,
//         ],
//       );
//     }
//   }
// }

// class _HeroText extends StatelessWidget {
//   const _HeroText();

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: 520),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Shaping the Future of AI\nProfessionals',
//             style: TextStyle(
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w800,
//               fontSize: 26,
//               height: 1.3,
//               color: Color(0xFF111827),
//             ),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Piestudy is dedicated to providing world-class AI education. '
//             'Discover our mission, our vision, and the expert team committed to your success.',
//             style: TextStyle(
//               fontFamily: 'Inter',
//               fontSize: 13.5,
//               height: 1.7,
//               color: Color(0xFF4B5563),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF16A34A),
//               foregroundColor: Colors.white,
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(999),
//               ),
//               elevation: 0,
//             ),
//             child: const Text(
//               'Explore Our Courses',
//               style: TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w600,
//                 fontSize: 13,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _HeroImageCard extends StatelessWidget {
//   const _HeroImageCard();

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 4 / 3,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(14),
//           gradient: const LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF020617),
//               Color(0xFF020617),
//             ],
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: Color.fromRGBO(15, 23, 42, 0.25),
//               blurRadius: 26,
//               offset: Offset(0, 14),
//             ),
//           ],
//         ),
//         child: Center(
//           // image ke place par same feel ka icon
//           child: Icon(
//             Icons.hub_rounded,
//             size: 110,
//             color: const Color(0xFF34D399),
//           ),
//         ),
//       ),
//     );
//   }
// }

/**----------MAILCHIMP FUNCTION-------------- */
const String mailchimpUrl = 'https://mailchi.mp/ad52932183fa/piestudy';

Future<void> _openMailchimp(BuildContext context) async {
  final uri = Uri.parse(mailchimpUrl);
  if (kIsWeb) {
    // open in same tab on web
    await launchUrl(uri, webOnlyWindowName: '_self');
    return;
  }

  // native: open external browser
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Unable to open signup page.')),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 800;

    return isWide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: _HeroText()),
              SizedBox(width: 32),
              Expanded(child: _HeroImageCard()),
            ],
          )
        : const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_HeroText(), SizedBox(height: 24), _HeroImageCard()],
          );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 800;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shaping the Future of AI\nProfessionals',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: isWide ? FontWeight.w900 : FontWeight.w800,
              fontSize: isWide ? 40 : 28,
              height: 1.2,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'StudyGrids is dedicated to providing world-class AI education. '
            'Discover our mission, vision and the expert team committed to your success.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: isWide ? 16 : 14,
              height: 1.65,
              color: const Color(0xFF4B5563),
            ),
          ),
          const SizedBox(height: 22),
          ElevatedButton(
            // onPressed: () {},
            onPressed: () => handlePieNavTap(context, 'programs'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF16A34A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Explore Our Courses',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroImageCard extends StatelessWidget {
  const _HeroImageCard();

  // tumhari uploaded branding image ka internal path
  static const String imagePath = 'lib/assets/images/foundation.jpeg';

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(14);

    return AspectRatio(
      aspectRatio: 4 / 3,
      child: ClipRRect(
        borderRadius: border,
        child: Image.asset(
          'lib/assets/images/foundation.jpeg', // <-- tum apni asset image yaha rakho
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: border,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF020617), Color(0xFF020617)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(15, 23, 42, 0.25),
                    blurRadius: 26,
                    offset: Offset(0, 14),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.hub_rounded,
                  size: 110,
                  color: Color(0xFF34D399),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/* ============================================================
 * 2. LEARN FROM BEST
 * ==========================================================*/

class _MissionSection extends StatelessWidget {
  const _MissionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Mission',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 20),
        _MissionCard(
          icon: Icons.build_circle_outlined,
          title: 'Build Practical AI Capability',
          description:
              'We focus on transforming AI knowledge into real-world capability. Our programs are designed to go beyond theory, enabling learners and organizations to confidently apply AI technologies to solve business, operational, and societal challenges.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.groups_outlined,
          title: 'Enable Workforce & Institutional Readiness',
          description:
              'We support enterprises, professionals, and public institutions in building future-ready skills. Our structured training pathways help organizations upskill teams, accelerate digital transformation, and create sustainable AI adoption models.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.trending_up,
          title: 'Deliver Measurable Impact',
          description:
              'Every program we deliver is outcome-oriented. We prioritize hands-on learning, real use cases, and applied projects to ensure measurable improvement in productivity, innovation, and decision-making.',
        ),
      ],
    );
  }
}

class _MissionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _MissionCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: AppColors.blue),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    height: 1.6,
                    color: Color(0xFF4B5563),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisionSection extends StatelessWidget {
  const _VisionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Vision',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 20),
        _MissionCard(
          icon: Icons.school_outlined,
          title: 'Advance AI Literacy at Scale',
          description:
              'We envision a world where AI literacy is foundational across industries, roles, and governance systems. Our goal is to make AI understanding and application accessible, scalable, and relevant for diverse audiences.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.handshake_outlined,
          title: 'Be a Trusted AI Enablement Partner',
          description:
              'We aim to be a long-term partner for organizations and governments seeking to build AI-driven capabilities. Through continuous innovation and ecosystem alignment, we strive to remain at the forefront of AI education and enablement.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.verified_user_outlined,
          title: 'Shape Responsible AI Adoption',
          description:
              'Our vision includes fostering ethical, transparent, and responsible AI usage. We believe AI should enhance human potential, strengthen institutions, and support inclusive economic growth.',
        ),
      ],
    );
  }
}

class _ValuesSection extends StatelessWidget {
  const _ValuesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Values',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 20),
        _MissionCard(
          icon: Icons.emoji_events_outlined,
          title: 'Outcome-Driven Excellence',
          description:
              'We believe success is defined by real outcomes, not just certifications. Quality, relevance, and practical value guide how we design and deliver every training program.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.security_outlined,
          title: 'Integrity & Responsible Innovation',
          description:
              'We uphold strong ethical standards in AI education. Responsible AI practices, data awareness, and transparency are embedded into our learning approach and institutional partnerships.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.people_outline,
          title: 'Collaboration & Continuous Learning',
          description:
              'We value collaboration with learners, organizations, industry experts, and public stakeholders. Continuous learning, adaptability, and innovation ensure our programs evolve with the rapidly changing AI landscape.',
        ),
      ],
    );
  }
}

class _ApproachSection extends StatelessWidget {
  const _ApproachSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Approach',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 20),
        _MissionCard(
          icon: Icons.business_center_outlined,
          title: 'Industry-Aligned & Use-Case Driven',
          description:
              'Our training programs are designed around real industry and governance use cases. We align learning outcomes with current AI applications, organizational needs, and policy considerations to ensure relevance across business and public sectors.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.psychology_outlined,
          title: 'Structured, Hands-On Learning',
          description:
              'We follow a structured learning framework that combines foundational concepts with hands-on labs, projects, and case studies. This ensures learners move from understanding AI to applying it confidently in real-world environments.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.balance_outlined,
          title: 'Responsible & Scalable AI Adoption',
          description:
              'We embed ethical AI principles, data governance, and responsible usage into every program. Our approach supports scalable AI adoption while ensuring compliance, transparency, and long-term sustainability.',
        ),
      ],
    );
  }
}

class _WhyChooseSection extends StatelessWidget {
  const _WhyChooseSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Why Choose Us',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 20),
        _MissionCard(
          icon: Icons.rocket_launch_outlined,
          title: 'End-to-End AI Capability Building',
          description:
              'We support the entire AI learning journey—from awareness and foundational training to advanced applications and deployment readiness. This enables individuals, teams, and institutions to build complete, future-ready AI capabilities.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.tune_outlined,
          title: 'Flexible Delivery for Diverse Audiences',
          description:
              'Our programs are designed to serve individuals, enterprises, and government institutions alike. We offer flexible delivery models, customized curricula, and role-based learning paths to meet diverse learning and operational needs.',
        ),
        const SizedBox(height: 16),
        _MissionCard(
          icon: Icons.check_circle_outline,
          title: 'Proven, Outcome-Oriented Methodology',
          description:
              'We focus on measurable outcomes, not just content delivery. Through applied projects, assessments, and real-world problem-solving, our learners gain skills that translate directly into performance, productivity, and impact.',
        ),
      ],
    );
  }
}

class _ShapingFutureSection extends StatelessWidget {
  const _ShapingFutureSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.blue, AppColors.blue.withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shaping the Future of AI Professionals',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          _ShapingCard(
            icon: Icons.foundation_outlined,
            title: 'Building Strong AI Foundations',
            description:
                'We equip learners with a deep understanding of core AI concepts, data fundamentals, and modern architectures. By grounding professionals in both theory and practical context, we ensure they can adapt to evolving technologies rather than chasing short-term trends.',
          ),
          const SizedBox(height: 16),
          _ShapingCard(
            icon: Icons.work_outline,
            title: 'Developing Industry-Ready Skills',
            description:
                'Our programs focus on real-world application, problem-solving, and deployment readiness. Learners work on hands-on projects, case studies, and industry-aligned scenarios that reflect actual business and governance challenges—preparing them to contribute from day one.',
          ),
          const SizedBox(height: 16),
          _ShapingCard(
            icon: Icons.stars_outlined,
            title: 'Preparing for Responsible Leadership in AI',
            description:
                'Beyond technical skills, we emphasize ethical AI, governance, and responsible decision-making. We prepare AI professionals not just to build systems, but to lead AI initiatives with accountability, transparency, and societal impact in mind.',
          ),
        ],
      ),
    );
  }
}

class _ShapingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ShapingCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 28, color: AppColors.orange),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TeamSection extends StatelessWidget {
  const _TeamSection();

  @override
  Widget build(BuildContext context) {
    final team = [
      ('Anand Fadte', 'Founder, CTO', 'Anand.jpg'),
      ('Shivraj K', 'Co Founder and Marketing Director', 'Shivraj.jpg'),
      ('Latha Ram', 'PMO Head', 'Latha.jpg'),
      ('Bhargavi Kulkarni', 'Product Manager', 'bhar.jpg'),
      ('Saurav Shinde', 'AI Researcher', 'Saurav.jpg'),
    ];

    final trainers = [
      ('Anand Fadte', 'Lead Trainer', 'Anand.jpg'),
      ('Shivraj K', 'Lead Trainer', 'Shivraj.jpg'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meet Our Team',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 32) / 3
                : constraints.maxWidth;

            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                for (final member in team)
                  SizedBox(
                    width: cardWidth,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.blue.withOpacity(0.1),
                            backgroundImage: AssetImage(
                              'lib/assets/staff/${member.$3}',
                            ),
                            onBackgroundImageError: (_, __) {},
                            child: member.$3.isEmpty
                                ? Icon(
                                    Icons.person,
                                    size: 40,
                                    color: AppColors.blue,
                                  )
                                : null,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            member.$1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            member.$2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: AppColors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 32),
        const Text(
          'Training Team',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 600;
            final cardWidth = isWide
                ? (constraints.maxWidth - 16) / 2
                : constraints.maxWidth;

            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                for (final trainer in trainers)
                  SizedBox(
                    width: cardWidth,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.orange.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.orange.withOpacity(0.2),
                            backgroundImage: AssetImage(
                              'lib/assets/staff/${trainer.$3}',
                            ),
                            onBackgroundImageError: (_, __) {},
                            child: trainer.$3.isEmpty
                                ? Icon(
                                    Icons.person,
                                    size: 30,
                                    color: AppColors.orange,
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trainer.$1,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  trainer.$2,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _LearnFromBestSection extends StatelessWidget {
  const _LearnFromBestSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
      decoration: BoxDecoration(
        color: const Color(0xFFF1FBF5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.school_rounded, size: 32, color: Color(0xFF16A34A)),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Learn from the Best in the Industry',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF111827),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Our programs are delivered by CTOs and CIOs with deep technical and industry expertise. '
                  'Gain invaluable insights and mentorship from leaders who have shaped the technology landscape.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    height: 1.7,
                    color: Color(0xFF4B5563),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ============================================================
 * 3. COMPANY ETHOS (MISSION / VISION / VALUES)
 * ==========================================================*/

class _CompanyEthosSection extends StatelessWidget {
  const _CompanyEthosSection();

  @override
  Widget build(BuildContext context) {
    final cards = [
      (
        Icons.spa_rounded,
        'Our Mission',
        'To empower the next generation of AI leaders with practical, cutting-edge skills and real-world knowledge.',
      ),
      (
        Icons.remove_red_eye_rounded,
        'Our Vision',
        'To create a future where AI technology is accessible, understood, and ethically applied to solve global challenges.',
      ),
      (
        Icons.star_rounded,
        'Our Values',
        'We are committed to innovation, excellence in education, and building a supportive, collaborative community.',
      ),
    ];

    return Column(
      children: [
        const Text(
          'Our Company Ethos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'We are driven by a set of core principles that guide every aspect of our educational programs and community.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 32) / 3
                : constraints.maxWidth;

            return Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                for (final c in cards)
                  SizedBox(
                    width: cardWidth,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(15, 23, 42, 0.04),
                            blurRadius: 16,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            c.$1 as IconData,
                            size: 22,
                            color: const Color(0xFF16A34A),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            c.$2 as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            c.$3 as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              height: 1.6,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

/* ============================================================
 * 4. EXPERT TRAINERS
 * ==========================================================*/

class _ExpertTrainersSection extends StatelessWidget {
  const _ExpertTrainersSection();

  @override
  Widget build(BuildContext context) {
    final trainers = [
      (
        'Dr. Anaya Sharma',
        'Lead AI Instructor',
        'With a PhD in AI from Stanford, Dr. Sharma specialises in neural networks and deep learning, bringing over six years of academic and industry experience.',
      ),
      (
        'Ben Carter',
        'Data Science Specialist',
        'Ben is a data science expert who translates complex datasets into actionable insights. He has led projects for several Fortune 500 companies.',
      ),
      (
        'Chloe Davis',
        'Machine Learning Engineer',
        'Chloe’s expertise is in reinforcement learning and natural language processing. She is passionate about building reliable systems that learn and adapt.',
      ),
      (
        'Marcus Rodriguez',
        'Senior AI Strategist',
        'Marcus has 10+ years of experience in AI strategy and analytics, helping organisations leverage technology for strategic growth.',
      ),
    ];

    return Column(
      children: [
        const Text(
          'Meet Our Expert Trainers',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Our instructors are industry veterans and academic pioneers, dedicated to your growth and success in the field of AI.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 26),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 36) / 4
                : constraints.maxWidth;

            return Wrap(
              spacing: 12,
              runSpacing: 18,
              alignment: WrapAlignment.center,
              children: [
                for (final t in trainers)
                  SizedBox(
                    width: cardWidth,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 46,
                          backgroundColor: const Color(0xFFE6F1FF),
                          child: Icon(
                            Icons.person_rounded,
                            size: 46,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          t.$1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          t.$2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color(0xFF16A34A),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t.$3,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12.5,
                            height: 1.6,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

/* ============================================================
 * 5. HEAR FROM OUR STUDENTS
 * ==========================================================*/

class _StudentsSection extends StatelessWidget {
  const _StudentsSection();

  @override
  Widget build(BuildContext context) {
    final testimonials = [
      (
        '“The hands-on projects and mentorship from industry experts were invaluable. I landed my dream job as an AI Engineer just a month after graduating. StudyGrids truly bridges the gap between theory and real-world application.”',
        'Alex Chen',
        'AI Engineer at TechCorp',
      ),
      (
        '“I was looking to pivot my career into data science, and StudyGrids provided the perfect launchpad. The curriculum is incredibly relevant, and the instructors are not just teachers but true mentors.”',
        'Sarah Jones',
        'Data Scientist at Innovate Inc.',
      ),
      (
        '“The community at StudyGrids is amazing. I collaborated with talented peers from diverse backgrounds, which enriched my learning experience immensely. The network I built here is priceless.”',
        'Mike Williams',
        'Machine Learning Specialist',
      ),
    ];

    return Column(
      children: [
        const Text(
          'Hear From Our Students',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Discover the impact of our programs through the experiences of our graduates.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 26),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 36) / 3
                : constraints.maxWidth;

            return Column(
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final t in testimonials)
                      SizedBox(
                        width: cardWidth,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(15, 23, 42, 0.05),
                                blurRadius: 16,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.format_quote_rounded,
                                size: 26,
                                color: Color(0xFF16A34A),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                t.$1,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 13,
                                  height: 1.6,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Color(0xFFE6F1FF),
                                    child: Icon(
                                      Icons.person_rounded,
                                      size: 18,
                                      color: Color(0xFF374151),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          t.$2,
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 13,
                                            color: Color(0xFF111827),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          t.$3,
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 11.5,
                                            color: Color(0xFFEF4444),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 18),
                // static dots like slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF16A34A),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

/* ============================================================
 * 6. BOTTOM CTA (GREEN + ORANGE BUTTONS)
 * ==========================================================*/

class _BottomCtaSection extends StatelessWidget {
  const _BottomCtaSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 34),
      decoration: const BoxDecoration(color: Color(0xFFF1FBF5)),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 860),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(15, 23, 42, 0.06),
                  blurRadius: 18,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Ready to Start Your AI Journey?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Join the next generation of AI innovators. Explore our comprehensive '
                  'courses and find the perfect path for your career goals.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    height: 1.6,
                    color: Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      // onPressed: () {},
                      onPressed: () => handlePieNavTap(context, 'programs'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16A34A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Explore Programs',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      // onPressed: () {},
                      onPressed: () => _openMailchimp(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF97316),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ============================================================
 * 7. SIMPLE FOOTER (logo + links)
 * ==========================================================*/

class _AboutFooterSection extends StatelessWidget {
  const _AboutFooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9FAFB),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 700;

          final logoRow = Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.hexagon_rounded, size: 18, color: Color(0xFF16A34A)),
              SizedBox(width: 6),
              Text(
                'StudyGrids',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: Color(0xFF16A34A),
                ),
              ),
            ],
          );

          final linksRow = Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _FooterLink(label: 'About'),
              SizedBox(width: 16),
              _FooterLink(label: 'Courses'),
              SizedBox(width: 16),
              _FooterLink(label: 'Contact'),
              SizedBox(width: 16),
              _FooterLink(label: 'Privacy Policy'),
            ],
          );

          final copyright = Text(
            '© 2025 StudyGrids. All rights reserved.',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 11.5,
              color: Color(0xFF9CA3AF),
            ),
          );

          if (isWide) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [logoRow, linksRow],
                ),
                const SizedBox(height: 10),
                Align(alignment: Alignment.centerLeft, child: copyright),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                logoRow,
                const SizedBox(height: 10),
                linksRow,
                const SizedBox(height: 10),
                copyright,
              ],
            );
          }
        },
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  const _FooterLink({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 11.5,
        color: Color(0xFF6B7280),
      ),
    );
  }
}

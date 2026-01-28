import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/brand_title.dart';
import 'package:pie_study/main.dart';
import 'package:pie_study/widgets/global_floating_button.dart';
import 'package:pie_study/widgets/pie_footer.dart';
import 'package:url_launcher/url_launcher.dart'; // handlePieNavTap


const String mailchimpUrl = 'https://mailchi.mp/ad52932183fa/piestudy';

class AgenticManagersDetailPage extends StatelessWidget {
  const AgenticManagersDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    const pageBg = Color(0xFFF5F7FB);
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: pageBg,

      endDrawer: isWide
          ? null
          : Drawer(
              child: SafeArea(
                child: PieNavDrawer(
                  activeId: 'programs',
                  onItemTap: (id) {
                    Navigator.pop(context);
                    handlePieNavTap(context, id);
                  },
                ),
              ),
            ),

      appBar: AppBar(
        leading: const BackButton(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0.4,
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        toolbarHeight: 68,

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: isWide
              ? PieTopNav(
                  onItemTap: (id) => handlePieNavTap(context, id),
                  activeId: 'programs',
                  ctaLabel: 'FAQ',
                  onCtaTap: () => handlePieNavTap(context, 'faq'),
                )
              : const Align(
                  alignment: Alignment.centerLeft,
                  child: BrandTitle(),
                ),
        ),

        actions: [
          if (!isWide)
            Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.black87),
                onPressed: () => Scaffold.of(ctx).openEndDrawer(),
              ),
            ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ⭐ CONTENT CENTERED WITH MAX WIDTH
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1180),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HeroSection(),
                      SizedBox(height: 32),
                      _StatsRow(),
                      SizedBox(height: 40),
                      _AudienceSection(),
                      SizedBox(height: 40),
                      _LearningSection(),
                      SizedBox(height: 40),
                      _CurriculumSection(),
                      SizedBox(height: 40),
                      _OutcomeSection(),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),

            ///  FOOTER ALWAYS FULL WIDTH (LEFT → RIGHT COMPLETE)
            PieFooter(
              onProgramTap: (id) {
                switch (id) {
                  case 'managers':
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const AgenticManagersDetailPage()),
                    );
                    break;

                  case 'developers':
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => const AgenticDevelopersDetailPage()),
                    );
                    break;

                  case 'ds_intern':
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => DataScienceInternshipDetailPage()),
                    );
                    break;

                  case 'ds_foundation':
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) =>
                              const DataScienceFoundationDetailPage()),
                    );
                    break;
                }
              },
              onAboutTap: () => handlePieNavTap(context, 'about'),
              onVerticalsTap: () => handlePieNavTap(context, 'verticals'),
              onBlogTap: () => handlePieNavTap(context, 'tnc'),
              onFaqTap: () => handlePieNavTap(context, 'faq'),
              onEmailTap: () {},
              onPhoneTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}




/* ================= HERO SECTION ================= */

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    if (isWide) {
      // Laptop / desktop layout
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _HeroText()),
          const Spacer(flex: 2),
        ],
      );
    }

    // Mobile / tablet layout
    return _HeroText();
  }
}

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



    void _openEnrollmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => const EnrollmentFormDialog(),
    );
  }

class _HeroText extends StatelessWidget {
  const _HeroText();

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 500;

    return Column(
      crossAxisAlignment:
          isNarrow ? CrossAxisAlignment.start : CrossAxisAlignment.start,
      children: [
        const Text(
          'Lead with AI.\nTransform your business with\nagentic automation.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800, // 🔥 bold
            fontSize: 32,
            height: 1.15,
            letterSpacing: -0.5,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: const Text(
            'A comprehensive 26-hour program designed for managers and leaders '
            'to master Agentic AI and drive business innovation.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              height: 1.6,
              color: Color(0xFF6B7280),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            ElevatedButton(
              // onPressed: () {},
                
                onPressed: () => _openEnrollmentDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navy,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Enroll Now',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
            // OutlinedButton(
            //   onPressed: () {},
            //   style: OutlinedButton.styleFrom(
            //     foregroundColor: const Color(0xFF111827),
            //     side: const BorderSide(color: Color(0xFFD1D5DB)),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(999),
            //     ),
            //   ),
            //   child: const Text(
            //     'Download Syllabus',
            //     style: TextStyle(
            //       fontFamily: 'Inter',
            //       fontWeight: FontWeight.w600,
            //       fontSize: 13,
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

/* ================= STATS ROW ================= */

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    final stats = [
      ('Duration', '26 Hours'),
      ('Format', 'Online'),
      ('Skill Level', 'Beginner'),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 800;
        final cardWidth = isWide
            ? (constraints.maxWidth - 40) / stats.length
            : constraints.maxWidth;

        return Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [
            for (var s in stats)
              SizedBox(
                width: cardWidth,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.$1,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        s.$2,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/* ================= WHO SHOULD ATTEND ================= */

class _AudienceSection extends StatelessWidget {
  const _AudienceSection();

  @override
  Widget build(BuildContext context) {
    final people = [
      (
        Icons.manage_accounts_outlined,
        'Managers',
        'Oversee teams and want to integrate AI for efficiency.'
      ),
      (
        Icons.groups_outlined,
        'Team Leaders',
        'Guide project execution and need to leverage automation.'
      ),
      (
        Icons.business_center_outlined,
        'Business Owners',
        'Aim to innovate and scale their business with AI.'
      ),
      (
        Icons.extension_outlined,
        'Non-technical Professionals',
        'Seek to understand and apply AI without a coding background.'
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Who Should Attend',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 18),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth =
                isWide ? (constraints.maxWidth - 45) / 4 : constraints.maxWidth;

            return Wrap(
              alignment: WrapAlignment.center,
              spacing: 15,
              runSpacing: 16,
              children: [
                for (var p in people)
                  SizedBox(
                    width: cardWidth,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            p.$1,
                            size: 32,
                            color: AppColors.accent,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            p.$2,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            p.$3,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.5,
                              height: 1.5,
                              color: Color(0xFF6B7280),
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

/* ================= WHAT YOU WILL LEARN ================= */

class _LearningSection extends StatelessWidget {
  const _LearningSection();

  @override
  Widget build(BuildContext context) {
    final points = [
      'Master the fundamentals of AI, Large Language Models (LLMs), and multi-agent systems.',
      'Design and implement AI-driven business workflows to streamline operations.',
      'Automate entire departments by leveraging agentic automation principles.',
      'Develop advanced prompt engineering techniques to optimize AI performance.',
      'Gain hands-on experience with leading-edge Agentic AI tools and platforms.',
      'Create and deploy custom business AI agents to solve specific organizational challenges.',
    ];

    final isWide = MediaQuery.of(context).size.width >= 900;

    if (isWide) {
      // Row layout on big screens
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _LearningList(points: points)),
          const SizedBox(width: 24),
          const Expanded(child: _LearningVisual()),
        ],
      );
    }

    // Column layout on small screens
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LearningList(points: points),
        const SizedBox(height: 20),
        const _LearningVisual(),
      ],
    );
  }
}

class _LearningList extends StatelessWidget {
  final List<String> points;
  const _LearningList({required this.points});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What You Will Learn',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: points
              .map(
                (p) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        size: 18,
                        color: Color(0xFFFF8B3D),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          p,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13.5,
                            height: 1.6,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

/// Right side visual: no image dependency, only icon + gradient
class _LearningVisual extends StatelessWidget {
  const _LearningVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0B1828),
            Color(0xFF102A43),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.hub_outlined,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}

/* ================= CURRICULUM ================= */

class _CurriculumSection extends StatelessWidget {
  const _CurriculumSection();

  @override
  Widget build(BuildContext context) {
    final modules = [
      {
        'title': 'Module 1: AI Fundamentals',
        'desc':
            'Understand how AI works, types of AI systems, basics of machine learning, and why AI is transforming business operations globally.'
      },
      {
        'title': 'Module 2: LLM Concepts + Agentic Systems',
        'desc':
            'Deep dive into Large Language Models, embeddings, vector databases, and how autonomous agentic workflows function in real scenarios.'
      },
      {
        'title': 'Module 3: Prompt Optimization',
        'desc':
            'Learn prompt engineering, structured prompting, chain-of-thought, RAG prompting, and methods to achieve consistent outputs.'
      },
      {
        'title': 'Module 4: Automation Tools',
        'desc':
            'Hands-on with Zapier, Make.com, OpenAI API, workflow automation, API chaining, and building AI-powered business automations.'
      },
      {
        'title': 'Module 5: Business Use-Case Design',
        'desc':
            'Translate real business problems into AI solutions, design ROI-driven use cases, and build production-ready automation pipelines.'
      },
      {
        'title': 'Module 6: Capstone Project',
        'desc':
            'Build and deploy a full agentic automation system that solves a real business challenge using LLMs + automation tools.'
      },
    ];


    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Curriculum Breakdown',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color(0xFF111827),
            ),
          ),

          /// Reduced heading → modules spacing
          const SizedBox(height: 12),

          Container(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              children: [
                for (final m in modules)
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: ExpansionTile(
                      iconColor: Colors.blue,
                      collapsedIconColor: const Color(0xFF9CA3AF),

                      /// Title spacing → tight (no vertical extra padding)
                      tilePadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),

                      /// Description spacing → almost zero
                      childrenPadding:
                          const EdgeInsets.fromLTRB(16, 2, 16, 6),

                      title: Text(
                        m['title']!,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF111827),
                        ),
                      ),

                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            m['desc']!,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              height: 1.32,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      ],
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


/* ================= OUTCOME (FOOTER STYLE) ================= */

class _OutcomeSection extends StatelessWidget {
  const _OutcomeSection();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 800;

    return Center(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 960),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        decoration: BoxDecoration(
          color: const Color(0xFF0B2441),
          borderRadius: BorderRadius.circular(24),
        ),
        child: isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(child: _OutcomeText()),
                  SizedBox(width: 24),
                  _OutcomeButton(),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  _OutcomeText(),
                  SizedBox(height: 18),
                  _OutcomeButton(),
                ],
              ),
      ),
    );
  }
}

class _OutcomeText extends StatelessWidget {
  const _OutcomeText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Program Outcome',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 650,
          child: Text(
            'Upon completion, you will be equipped to build sophisticated AI-powered workflows, '
            'drive significant productivity improvements, and confidently lead your organization’s AI transformation.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13.5,
              height: 1.7,
              color: Color(0xFFE5E7EB),
            ),
          ),
        ),
      ],
    );
  }
}

class _OutcomeButton extends StatelessWidget {
  const _OutcomeButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // onPressed: () {}
    onPressed: () => _openEnrollmentDialog(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF8B3D),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        elevation: 0,
      ),
      child: const Text(
        'Become an AI Leader',
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          fontSize: 13,
        ),
      ),
    );
  }
}

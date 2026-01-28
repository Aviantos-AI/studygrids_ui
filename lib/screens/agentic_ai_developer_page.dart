import 'package:flutter/material.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/widgets/brand_title.dart';


import 'package:pie_study/main.dart'; // handlePieNavTap
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/global_floating_button.dart';
import 'package:pie_study/widgets/pie_footer.dart';
import 'package:url_launcher/url_launcher.dart';

class AgenticDevelopersDetailPage extends StatelessWidget {
  const AgenticDevelopersDetailPage({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // -------- CENTERED MAIN CONTENT (constrained width) --------
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxWidth =
                      constraints.maxWidth > 1180 ? 1180.0 : constraints.maxWidth;

                  return ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _HeroSection(),
                          SizedBox(height: 40),
                          _WhoShouldAttendSection(),
                          SizedBox(height: 40),
                          _LearningSection(),
                          SizedBox(height: 44),
                          _CurriculumSection(),
                          SizedBox(height: 52),
                          _OutcomeSection(),
                          SizedBox(height: 32),
                          // NOTE: removed _FooterStrip — replaced by PieFooter (full-width) below
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // -------- FULL-WIDTH FOOTER (will span left -> right) --------
            // Placed outside the ConstrainedBox so it covers full screen width
            PieFooter(
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
                        builder: (_) => const DataScienceFoundationDetailPage(),
                      ),
                    );
                    break;
                }
              },
              onAboutTap: () => handlePieNavTap(context, 'about'),
              onVerticalsTap: () => handlePieNavTap(context, 'verticals'),
              onBlogTap: () => handlePieNavTap(context, 'tnc'),
              onFaqTap: () => handlePieNavTap(context, 'faq'),
              onEmailTap: () {
                // TODO: add mail launcher if needed
              },
              onPhoneTap: () {
                // TODO: add phone dialer if needed
              },
            ),

            // optional bottom spacing so footer has breathing room on very small screens
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
const String mailchimpUrl = 'https://mailchi.mp/ad52932183fa/piestudy';
    void _launchMailchimpUrl(BuildContext context) async {
    final Uri uri = Uri.parse(mailchimpUrl);

    // **REAL CODE LOGIC (requires url_launcher package):**
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Error handling if the URL cannot be launched (Fail-Safe Logic)
      // Note: For actual usage, you need to ensure ScaffoldMessenger is available.
      // Canvas / Mock environment के लिए एक SnackBar दिखा रहे हैं
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: URL launch failed. Please check the URL or try another method. URL: $mailchimpUrl'),
          duration: const Duration(seconds: 5),
        ),
      );
      print('URL launch failed for $mailchimpUrl');
    } else {
       // Launch successful (Canvas में यह SnackBar दिख सकता है, लेकिन असली Flutter app में यह ब्राउज़र खोल देगा)
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('URL Launcher: $mailchimpUrl को सफलतापूर्वक लॉन्च किया गया।'),
          duration: const Duration(seconds: 3),
        ),
      );
      print('Attempting to launch URL: $mailchimpUrl');
    }
  }


    void _openEnrollmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => const EnrollmentFormDialog(),
    );
  }

/* ================= HERO SECTION ================= */

class _HeroSection extends StatelessWidget {
  const _HeroSection();




  @override
  Widget build(BuildContext context) {
    const devGreen = Color(0xFF00C08A);
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Flex(
      direction: isWide ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LEFT CONTENT
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'AGENTIC AI – SOFTWARE DEVELOPERS (26 HOURS)',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  letterSpacing: 1.6,
                  color: devGreen,
                ),
              ),
              const SizedBox(height: 12),
              // const Text(
              //   'Build AI Agents,\nAutomations, and\nRAG Systems from\nScratch.',
              //   style: TextStyle(
              //     fontFamily: 'Inter',
              //     fontWeight: FontWeight.w900,
              //     fontSize: 38,
              //     height: 1.08,
              //     letterSpacing: -0.2,
              //     color: Color(0xFF071827),
              //   ),
              // ),
              const Text(
  'Build AI Agents,\nAutomations, and\nRAG Systems from\nScratch.',
  style: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w900,
    fontSize: 42, // +4px gives thick look
    height: 1.05,
    letterSpacing: -0.8, // tight spacing increases thickness feel
    color: Color(0xFF071827),
  ),
),

              const SizedBox(height: 18),
              const SizedBox(
                width: 480,
                child: Text(
                  'A comprehensive 26-hour program for developers to master Agentic AI.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
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
                    
                     onPressed: () => _openEnrollmentDialog(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: devGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      elevation: 0,
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
                  OutlinedButton(
                    // onPressed: () {},
                     onPressed: () => _openEnrollmentDialog(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF111827),
                      side: const BorderSide(color: Color(0xFF00C08A)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    child: const Text(
                      'Become an AI Leader',
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

        const SizedBox(width: 32, height: 32),

        // RIGHT VISUAL CARD
        // Expanded(
        //   flex: 3,
        //   child: Container(
        //     height: isWide ? 260 : 220,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(24),
        //       gradient: const LinearGradient(
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //         colors: [
        //           Color(0xFF061824),
        //           Color(0xFF062840),
        //         ],
        //       ),
        //     ),
        //     child: Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         Container(
        //           width: 170,
        //           height: 170,
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             gradient: RadialGradient(
        //               colors: [
        //                 const Color(0xFF00C08A).withOpacity(0.18),
        //                 Colors.transparent,
        //               ],
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 130,
        //           height: 130,
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             border: Border.all(
        //               color: const Color(0xFF00C08A).withOpacity(0.4),
        //               width: 1.5,
        //             ),
        //           ),
        //           child: const Icon(
        //             Icons.auto_awesome_motion_rounded,
        //             size: 56,
        //             color: Color(0xFF00C08A),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

      Expanded(
          flex: 3,
          child: SizedBox(
            height: isWide ? 260 : 220,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                // yahan apna banner path rakho
                'lib/assets/images/agentic_ai.jpeg',
                fit: BoxFit.cover,
                // agar image load nahi hoti to yeh fallback chalega
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF061824),
                          Color(0xFF062840),
                        ],
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                devGreen.withOpacity(0.18),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: devGreen.withOpacity(0.4),
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.auto_awesome_motion_rounded,
                            size: 56,
                            color: devGreen,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      
      ],
    );
  }
}

/* ================= WHO SHOULD ATTEND ================= */

class _WhoShouldAttendSection extends StatelessWidget {
  const _WhoShouldAttendSection();

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        Icons.code_rounded,
        'Software Developers',
        'Expand your skillset with advanced AI agent capabilities.'
      ),
      (
        Icons.developer_mode_rounded,
        'Python Developers',
        'Leverage your Python expertise to build intelligent systems.'
      ),
      (
        Icons.storage_rounded,
        'Data Engineers',
        'Integrate powerful AI and automation into your data pipelines.'
      ),
      (
        Icons.science_rounded,
        'Tech Enthusiasts',
        'Dive deep into the practical application of cutting-edge AI.'
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
        const SizedBox(height: 22),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 48) / 4
                : constraints.maxWidth;

            return Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                for (var p in items)
                  SizedBox(
                    width: cardWidth,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border:
                            Border.all(color: const Color(0xFFE5E7EB), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5FBF5),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Icon(
                              p.$1,
                              size: 18,
                              color: const Color(0xFF00C08A),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            p.$2,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            p.$3,
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
      (
        Icons.architecture_rounded,
        'Agentic Architectures',
        'Design and implement robust systems for autonomous agents.'
      ),
      (
        Icons.code_rounded,
        'LLM Calls & Tooling',
        'Master the art of interacting with LLMs and integrating external tools.'
      ),
      (
        Icons.groups_3_rounded,
        'Multi-agent Coordination',
        'Build complex systems where multiple AI agents collaborate to solve problems.'
      ),
      (
        Icons.hub_rounded,
        'RAG Pipelines',
        'Construct advanced Retrieval-Augmented Generation systems from the ground up.'
      ),
      (
        Icons.api_rounded,
        'API-based AI Microservices',
        'Develop and deploy scalable, independent AI services.'
      ),
      (
        Icons.rocket_launch_rounded,
        'Agent Deployment',
        'Learn best practices for deploying AI agents into real-world environments.'
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        const SizedBox(height: 22),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 40) / 3
                : constraints.maxWidth;

            return Wrap(
              spacing: 20,
              runSpacing: 18,
              alignment: WrapAlignment.center,
              children: [
                for (var p in points)
                  SizedBox(
                    width: cardWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5FBF5),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Icon(
                            p.$1,
                            size: 18,
                            color: const Color(0xFF00C08A),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.$2,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.5,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                p.$3,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12.5,
                                  height: 1.5,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                            ],
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

/* ================= CURRICULUM ================= */

class _CurriculumSection extends StatelessWidget {
  const _CurriculumSection();

  @override
  Widget build(BuildContext context) {
    final modules = [
      (
        'Module 1: LLM Internals & Tokenization',
        'Dive deep into foundational concepts of Large Language Models, understanding how they process and represent text.'
      ),
      (
        'Module 2: Agent Frameworks',
        'Explore popular agentic frameworks like LangChain and LlamaIndex. Learn to structure your agents for real tasks.'
      ),
      (
        'Module 3: End-to-End RAG Architecture',
        'Build a complete Retrieval-Augmented Generation pipeline including data ingestion, chunking, indexing and querying.'
      ),
      (
        'Module 4: Automation APIs + n8n',
        'Integrate external APIs and low-code automation tools like n8n to build powerful agent workflows.'
      ),
      (
        'Module 5: Vector DBs',
        'Get hands-on with leading vector databases such as Pinecone, Chroma or Weaviate, and learn best practices.'
      ),
      (
        'Module 6: Full-stack AI Agent Project',
        'Apply everything in a comprehensive capstone project – design, build and deploy a full agentic AI system.'
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Curriculum',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800, // more bold
            fontSize: 22, // bigger heading
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 22),
        Center(
  child: Container(
    constraints: const BoxConstraints(maxWidth: 860),
    child: Column(
      children: [
        for (final m in modules)
          _CurriculumTile(title: m.$1, description: m.$2)
      ],
    ),
  ),
),
        // Container(
        //   constraints: const BoxConstraints(
        //     maxWidth: 860, // slightly wider, centered
        //   ),
        //   child: Column(
        //     children: [
        //       for (final m in modules)
        //         _CurriculumTile(
        //           title: m.$1,
        //           description: m.$2,
        //         ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class _CurriculumTile extends StatelessWidget {
  final String title;
  final String description;

  const _CurriculumTile({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: const Color(0xFF6B7280),
          collapsedIconColor: const Color(0xFF9CA3AF),
          tilePadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          childrenPadding:
              const EdgeInsets.fromLTRB(18, 0, 18, 14),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700, // bolder
              fontSize: 16.5, // slightly bigger
              color: Color(0xFF111827),
            ),
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                description,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12.5,
                  height: 1.6,
                  color: Color(0xFF4B5563),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= OUTCOME SECTION ================= */

class _OutcomeSection extends StatelessWidget {
  const _OutcomeSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 1100, // wider on desktop
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 34),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF05192B),
              Color(0xFF062B47),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your Outcome',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 20, // bigger heading
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const SizedBox(
              width: 720, // more width for desktop
              child: Text(
                'Build enterprise-grade AI agents and deploy them to real environments, transforming your capabilities '
                'as a developer and innovator in the AI space.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16.5,
                  height: 1.7,
                  color: Color(0xFFE5E7EB),
                ),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              // onPressed: () {},
            //  onPressed: () => _launchMailchimpUrl(context),
              onPressed: () => _openEnrollmentDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C08A),
                foregroundColor: const Color(0xFF02201A),
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Start Your AI Journey',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ================= FOOTER STRIP ================= */

class _FooterStrip extends StatelessWidget {
  const _FooterStrip();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 12),
        Divider(color: Color(0xFFE5E7EB)),
        SizedBox(height: 8),
        Text(
          '© 2025 StudyGrids, Inc. All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 11.5,
            color: Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}

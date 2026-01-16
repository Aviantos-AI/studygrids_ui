import 'package:flutter/material.dart';
import 'package:pie_study/main.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/widgets/pie_footer.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Image wale saare FAQs
    final faqs = <Map<String, String>>[
      {
        'q': 'Do I need coding?',
        'a':
            'Not for Agentic AI (Managers) or Data Science Foundation. Developer track requires coding.',
      },
      {
        'q': 'Are sessions recorded?',
        'a': 'Yes, all sessions are recorded and shared with learners.',
      },
      {
        'q': 'Do you offer EMI options?',
        'a':
            'Yes — speak with our admissions team to discuss available EMI plans.',
      },
      {
        'q': 'Do I get a certificate?',
        'a':
            'Yes, you receive a completion certificate for each program.',
      },
      {
        'q': 'Is internship support included?',
        'a':
            'Yes, the Data Science Career Program includes internship and placement support.',
      },
      {
        'q': 'What are the class timings?',
        'a':
            'Timings are optimised for working professionals, usually evenings and weekends (IST).',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'FAQ',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF111827)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // sabhi cards ka width same rahega
          final maxWidth =
              constraints.maxWidth > 1150 ? 1150.0 : constraints.maxWidth;

          return Center(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...faqs.map(
                      (item) => _FaqCard(
                        question: item['q']!,
                        answer: item['a']!,
                      ),
                    ),
                    const SizedBox(height: 20,),
                       PieFooter(
                    // ✅ 4 Programs → specific detail pages
                    onProgramTap: (id) {
                      switch (id) {
                        case 'managers':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  const AgenticManagersDetailPage(),
                            ),
                          );
                          break;

                        case 'developers':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  const AgenticDevelopersDetailPage(),
                            ),
                          );
                          break;

                        case 'ds_intern':
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  DataScienceInternshipDetailPage(),
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
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FaqCard extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqCard({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity, // sabhi cards same width
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0xFFF7FBFF),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(15, 23, 42, 0.06),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800, // bold question
                  fontSize: 16.5,              // thoda bada
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                answer,
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
      ),
    );
  }
}

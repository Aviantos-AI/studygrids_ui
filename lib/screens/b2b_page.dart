

import 'package:flutter/material.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/main.dart';
import 'package:pie_study/widgets/mobile_sticky_bottom.dart';
import 'package:pie_study/widgets/pie_footer.dart';
import 'package:pie_study/widgets/register_now.dart';
import 'package:url_launcher/url_launcher.dart'; // handlePieNavTap
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pie_study/widgets/global_floating_button.dart';





// ✅ 1. Import Mixin & Sticky Bar
import 'package:pie_study/utils/enrollment_mixin.dart';


class B2BPage extends StatefulWidget {
  const B2BPage({super.key});

  @override
  State<B2BPage> createState() => _B2BPageState();
}

// ✅ 3. Add Mixin
class _B2BPageState extends State<B2BPage> with EnrollmentPopupMixin {
  
  // Helper to open dialog manually (for buttons)
  void _openEnrollmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => const EnrollmentFormDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: AppColors.bg,

      // mobile / tablet: right side drawer
      endDrawer: Drawer(
        child: PieNavDrawer(
          activeId: 'b2b',
          onItemTap: (id) {
            Navigator.pop(context);
            handlePieNavTap(context, id);
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
            activeId: 'b2b',
            onEnrollTap: () {
            showDialog(
                context: context,
                builder: (ctx) => const CustomEnrollmentDialog(
                  title: "Enquire Now",
                  subtitle: " ",
                ),
              );},
            // _openEnrollmentDialog(context),
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

      // ✅ 4. Wrap Body in Stack
      body: Stack(
        children: [
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final bool isMobile = constraints.maxWidth < 700;
                final double maxWidth = isMobile ? constraints.maxWidth : 1180;

                return SingleChildScrollView(
                  // ✅ 5. Connect Scroll Controller
                  controller: enrollmentScrollController,
                  
                  child: Column(
                    children: [
                      // FULL-WIDTH HERO
                      _B2BHeroSection(
                        isMobile: isMobile,
                        maxWidth: maxWidth,
                      ),
                      const SizedBox(height: 40),

                      // CENTERED CONTENT (maxWidth)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: maxWidth),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _B2BWhyChooseSection(isMobile: isMobile),
                                const SizedBox(height: 40),
                                _B2BOfferingsSection(isMobile: isMobile),
                                const SizedBox(height: 40),
                                _B2BIndustriesSection(isMobile: isMobile),
                                const SizedBox(height: 40),
                                _B2BProcessSection(isMobile: isMobile),
                                 SizedBox(height: isMobile ? 20 : 40),
                                 Container(child:    RegisterNow(),),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // 🔹 FULL-WIDTH FOOTER
                      PieFooter(
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
                                      const DataScienceInternshipDetailPage(),
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
                        onAboutTap: () => handlePieNavTap(context, 'about'),
                        onVerticalsTap: () =>
                            handlePieNavTap(context, 'verticals'),
                        onBlogTap: () => handlePieNavTap(context, 'tnc'),
                        onFaqTap: () => handlePieNavTap(context, 'faq'),
                        onEmailTap: () {},
                        onPhoneTap: () {},
                      ),

                      // ✅ 6. Add Bottom Padding for Sticky Bar
                      // const SizedBox(height: 80),
                    ],
                  ),
                );
              },
            ),
          ),

          // ✅ 7. Add Sticky Bottom Bar Widget
          const MobileStickyBottomBar(),
        ],
      ),
    );
  }
}

/// ---------------- HERO (FULL WIDTH) ----------------

class _B2BHeroSection extends StatelessWidget {
  final bool isMobile;
  final double maxWidth;

  const _B2BHeroSection({
    required this.isMobile,
    required this.maxWidth,
  });

  // Helper for manual opening from Hero button
  void _openEnrollmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => const EnrollmentFormDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.navy.withOpacity(0.06),
            AppColors.navy.withOpacity(0.015),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 28 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 24,
            ),
            child: Column(
              crossAxisAlignment:
                  isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: isMobile
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.navy.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.business_center_outlined,
                        size: 26,
                        color: AppColors.navy,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Empowering Companies to Adopt AI at Scale',
                  textAlign: isMobile ? TextAlign.left : TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    height: 1.3,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Transform your organisation with enterprise AI training, hands-on workshops and strategic consulting designed for real business impact.',
                  textAlign: isMobile ? TextAlign.left : TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    height: 1.6,
                    color: Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment:
                      isMobile ? WrapAlignment.start : WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      // onPressed: () => _openEnrollmentDialog(context),

                      onPressed: () {
 showDialog(
      context: context,
      builder: (context) => const CustomEnrollmentDialog(
        title: "Get Your Proposal",
        subtitle: "Fill in the form to receive a customized solution.",
      ),
    );
  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 18 : 24,
                          vertical: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Request Proposal',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: AppColors.navy.withOpacity(0.35)),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 18 : 24,
                          vertical: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Contact US',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5,
                          color: Color(0xFF111827),
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

/// ---------------- WHY CHOOSE ----------------

class _B2BWhyChooseSection extends StatelessWidget {
  final bool isMobile;
  const _B2BWhyChooseSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final items = [
      _IconFeature(
        icon: Icons.groups_outlined,
        title: 'Upskill entire teams',
        subtitle: 'Cohort-based programs for cross-functional teams.',
      ),
      _IconFeature(
        icon: Icons.design_services_outlined,
        title: 'Custom curriculum',
        subtitle: 'Designed for your domain, data and tech stack.',
      ),
      _IconFeature(
        icon: Icons.trending_up_outlined,
        title: 'Measurable ROI',
        subtitle: 'Track adoption, productivity and impact metrics.',
      ),
      _IconFeature(
        icon: Icons.verified_outlined,
        title: 'Certifications',
        subtitle: 'Industry-recognised assessments and badges.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Why Choose StudyGrids for Corporate Training',
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: isMobile ? 18 : 20,
            color: const Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: isMobile ? WrapAlignment.start : WrapAlignment.center,
          children: items
              .map(
                (e) => SizedBox(
                  width: isMobile ? double.infinity : 220,
                  child: _IconFeatureTile(feature: e),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

/// ---------------- OUR OFFERINGS ----------------

class _B2BOfferingsSection extends StatelessWidget {
  final bool isMobile;
  const _B2BOfferingsSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final offerings = [
      _Offering(
        title: 'Agentic AI Training',
        description:
            'Equip your teams with autonomous AI agent development skills and automation expertise.',
      ),
      _Offering(
        title: 'Custom Workshops',
        description:
            'Tailored training sessions designed for your specific business needs and industry.',
      ),
      _Offering(
        title: 'Developer Bootcamps',
        description:
            'Intensive hands-on training to upskill your development teams in AI technologies.',
      ),
      _Offering(
        title: 'Automation Consulting',
        description:
            'Expert guidance on designing and implementing AI-powered automation workflows.',
      ),
      _Offering(
        title: 'AI Maturity Assessment',
        description:
            'Comprehensive evaluation of your organisation’s AI readiness and capability gaps.',
      ),
      _Offering(
        title: 'Long-term Partnerships',
        description:
            'Ongoing training and support programs to keep your teams at the cutting edge.',
      ),
    ];

    return _SectionBlock(
      isMobile: isMobile,
      title: 'Our Offerings',
      subtitle:
          'Comprehensive AI training and consulting services tailored to your organisation.',
      child: _OfferingsGridSlim(isMobile: isMobile, offerings: offerings),
    );
  }
}

/// ---------------- INDUSTRIES WE SERVE ----------------

class _B2BIndustriesSection extends StatelessWidget {
  final bool isMobile;
  const _B2BIndustriesSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final industries = [
      'Telecom',
      'Banking & Financial Services',
      'Insurance',
      'Healthcare',
      'Information Technology',
      'Government & Public Sector',
      'Manufacturing',
      'E-commerce & Retail',
    ];

    return _SectionBlock(
      isMobile: isMobile,
      title: 'Industries We Serve',
      subtitle: 'Trusted by leading organisations across multiple sectors.',
      child: _IndustryChips(
        isMobile: isMobile,
        labels: industries,
      ),
    );
  }
}

/// ---------------- OUR PROCESS ----------------

class _B2BProcessSection extends StatelessWidget {
  final bool isMobile;
  const _B2BProcessSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final steps = [
      _ProcessStep(
        number: 1,
        title: 'Initial Consultation',
        description:
            'We understand your business goals, challenges, and training requirements.',
      ),
      _ProcessStep(
        number: 2,
        title: 'Needs Assessment',
        description:
            'Evaluate your team’s current AI maturity and identify skill gaps.',
      ),
      _ProcessStep(
        number: 3,
        title: 'Custom Program Design',
        description: 'Create a tailored curriculum aligned with your objectives.',
      ),
      _ProcessStep(
        number: 4,
        title: 'Training Delivery',
        description:
            'Hands-on, practical training sessions led by industry experts.',
      ),
      _ProcessStep(
        number: 5,
        title: 'Ongoing Support',
        description:
            'Continuous support and follow-up to ensure successful implementation.',
      ),
    ];

    return _SectionBlock(
      isMobile: isMobile,
      title: 'Our Process',
      subtitle: '',
      child: Column(
        children: steps
            .map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _ProcessStepCard(step: s),
              ),
            )
            .toList(),
      ),
    );
  }
}

/// =======================  SHARED WIDGETS  =======================

class _SectionBlock extends StatelessWidget {
  final bool isMobile;
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionBlock({
    required this.isMobile,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: isMobile ? 18 : 20,
            color: const Color(0xFF111827),
          ),
        ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF4B5563),
            ),
          ),
        ],
        const SizedBox(height: 24),
        child,
      ],
    );
  }
}

class _IconFeature {
  final IconData icon;
  final String title;
  final String subtitle;
  _IconFeature({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class _IconFeatureTile extends StatelessWidget {
  final _IconFeature feature;
  const _IconFeatureTile({required this.feature});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.navy.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            feature.icon,
            size: 24,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          feature.title,
          textAlign: TextAlign.center,
          softWrap: true,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          feature.subtitle,
          textAlign: TextAlign.center,
          softWrap: true,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            height: 1.4,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}

class _Offering {
  final String title;
  final String description;
  _Offering({required this.title, required this.description});
}

/// Compact cards – screenshot jaisa
class _OfferingsGridSlim extends StatelessWidget {
  final bool isMobile;
  final List<_Offering> offerings;
  const _OfferingsGridSlim({
    required this.isMobile,
    required this.offerings,
  });

  int _crossAxisCount(double width) {
    if (width < 720) return 1;
    if (width < 900) return 2;
    return 3; // desktop
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final int crossAxisCount = _crossAxisCount(width);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: offerings.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isMobile ? 2.0 : 2.6,
      ),
      itemBuilder: (context, index) {
        final offering = offerings[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.muted.withOpacity(0.4),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 3),
                color: Colors.black.withOpacity(0.02),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                offering.title,
                softWrap: true,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 14.5,
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 6),
              Flexible(
                child: Text(
                  offering.description,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.5,
                    height: 1.4,
                    color: Color(0xFF4B5563),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Industries chips – rounded rectangles, no highlight
class _IndustryChips extends StatelessWidget {
  final bool isMobile;
  final List<String> labels;
  const _IndustryChips({
    required this.isMobile,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: isMobile ? WrapAlignment.start : WrapAlignment.center,
      children: labels
          .map(
            (label) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.muted.withOpacity(0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                    color: Colors.black.withOpacity(0.02),
                  ),
                ],
              ),
              child: Text(
                label,
                softWrap: true,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF111827),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

/// Process step model
class _ProcessStep {
  final int number;
  final String title;
  final String description;

  _ProcessStep({
    required this.number,
    required this.title,
    required this.description,
  });
}

/// Card like screenshot – circle number + text
class _ProcessStepCard extends StatelessWidget {
  final _ProcessStep step;
  const _ProcessStepCard({required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.muted.withOpacity(0.4),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 3),
            color: Colors.black.withOpacity(0.02),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // number circle
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.navy,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              step.number.toString(),
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.5,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  step.description,
                  softWrap: true,
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
    );
  }
}
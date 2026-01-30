


import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/utils/enrollment_mixin.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/brand_title.dart';
import 'package:pie_study/main.dart'; // handlePieNavTap
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/global_floating_button.dart';
import 'package:pie_study/widgets/pie_footer.dart';
import 'package:pie_study/widgets/register_now.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pie_study/widgets/mobile_sticky_bottom.dart';






class DataScienceFoundationDetailPage extends StatefulWidget {
  const DataScienceFoundationDetailPage({super.key});

  @override
  State<DataScienceFoundationDetailPage> createState() =>
      _DataScienceFoundationDetailPageState();
}

// ✅ Added Mixin
class _DataScienceFoundationDetailPageState
    extends State<DataScienceFoundationDetailPage> with EnrollmentPopupMixin {







  @override
  Widget build(BuildContext context) {
    const pageBg = Color(0xFFF5F7FB);

    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth >= 900;

    // responsive values
    final contentMaxWidth = isWide ? 1180.0 : 720.0;
    final horizontalPadding = isWide ? 20.0 : 16.0;
    final heroGap = isWide ? 48.0 : 32.0;
    final sectionGapSmall = isWide ? 56.0 : 40.0;
    final sectionGapMedium = isWide ? 64.0 : 48.0;

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

      // Use SingleChildScrollView so footer scrolls with content on small screens
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              controller: enrollmentScrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                // ---------- Centered, constrained main content ----------
                Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // ensure we don't exceed available width
                      final maxWidth = constraints.maxWidth > contentMaxWidth
                          ? contentMaxWidth
                          : constraints.maxWidth;
        
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxWidth),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding, vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Hero (kept same, but vertical gap responsive)
                              FadeInSlide(
                                delay: const Duration(milliseconds: 0),
                                child: const _HeroSection(),
                              ),
        
                              SizedBox(height: heroGap),
        
                              FadeInSlide(
                                delay: const Duration(milliseconds: 120),
                                child: const _AchieveSection(),
                              ),
        
                              SizedBox(height: sectionGapSmall),
        
                              FadeInSlide(
                                delay: const Duration(milliseconds: 220),
                                child: const _CurriculumSection(),
                              ),
        
                              SizedBox(height: sectionGapMedium),
        
                              FadeInSlide(
                                delay: const Duration(milliseconds: 320),
                                child: const _OutcomeSection(),
                              ),
                               Container(child:    RegisterNow(),),
        
                              // Small bottom gap before the full-width footer
                              SizedBox(height: isWide ? 28 : 20),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        
                // ---------- FULL-WIDTH FOOTER (outside ConstrainedBox) ----------
                // This stays full width on all devices and is scrollable with content.
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
                    // TODO: implement mail launcher
                  },
                  onPhoneTap: () {
                    // TODO: implement phone dialer
                  },
                ),
                const SizedBox(height: 50),
        
                // breathing room for very small screens
        
              ],
            ),
          ),
        ),
          // ---------- MOBILE STICKY BOTTOM BAR ----------
           MobileStickyBottomBar(),
    ],  ),
    );
  }
}





/*-------MAIL CHIMP--------*/


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
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 800;
    final titleSize = isWide ? 36.0 : 30.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // double-layer text -> extra bold like design
        Stack(
          children: [
            Text(
              'Learn Data Science from Zero—\nPerfect for Beginners.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                fontSize: titleSize,
                height: 1.18,
                letterSpacing: -0.4,
                color: const Color(0xFF020617),
              ),
            ),
            Text(
              'Learn Data Science from Zero—\nPerfect for Beginners.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                fontSize: titleSize,
                height: 1.18,
                letterSpacing: -0.4,
                color: const Color(0xFF071827),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Data Science Foundation (30 Hours)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w900,
            height: 1.6,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 26),
        ElevatedButton(
          // onPressed: () {},
          onPressed: () => _openEnrollmentDialog(context),

          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0B3558),
            foregroundColor: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Start Learning',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 13.5,
            ),
          ),
        ),
      ],
    );
  }
}

/* ================= WHAT YOU'LL ACHIEVE ================= */

class _AchieveSection extends StatelessWidget {
  const _AchieveSection();

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        Icons.code_rounded,
        'Write Python scripts',
        'Master the fundamentals of Python programming for data analysis.'
      ),
      (
        Icons.bar_chart_rounded,
        'Analyze datasets',
        'Learn to clean, process, and explore complex datasets with powerful libraries.'
      ),
      (
        Icons.auto_awesome_rounded,
        'Build your first ML model',
        'Get hands-on experience creating a predictive model from scratch.'
      ),
      (
        Icons.device_hub_rounded,
        'Understand data pipelines',
        'Gain insight into the end-to-end process of data flow in real-world applications.'
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'What You’ll Achieve',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 21,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 32) / 2
                : constraints.maxWidth;

            return Wrap(
              spacing: 32,
              runSpacing: 22,
              alignment: WrapAlignment.center,
              children: [
                for (var a in items)
                  SizedBox(
                    width: cardWidth,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      constraints: const BoxConstraints(
                        minHeight: 132, // taller cards
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: const Color(0xFFE5E7EB), width: 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(15, 23, 42, 0.03),
                            blurRadius: 16,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0F2FE),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Icon(
                              a.$1,
                              size: 20,
                              color: AppColors.accent,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  a.$2,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.5,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  a.$3,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    height: 1.6,
                                    color: Color(0xFF6B7280),
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

/* ================= CURRICULUM ================= */

class _CurriculumSection extends StatelessWidget {
  const _CurriculumSection();

  @override
  Widget build(BuildContext context) {
    final modules = [
      _ModuleData(
        title: 'Module 1: Python Basics',
        bulletPoints: const [
          'Introduction to Python and environment setup',
          'Variables, data types, and operators',
          'Control flow: loops and conditionals',
          'Functions and modules',
        ],
      ),
      _ModuleData(
        title: 'Module 2: Data Manipulation (Pandas)',
         bulletPoints: const [
          'Pandas Fundamentals'
'Data Cleaning'
'Data Transformation'
'Working with DataFrames'
        ],

      ),
      _ModuleData(
        title: 'Module 3: Visualisation (Matplotlib/Plotly)',
 bulletPoints: const [
        'Matplotlib Basics'
'Seaborn for Statistical Plots'
'Creating Charts'
'Data Storytelling']
      ),
      _ModuleData(
        title: 'Module 4: Machine Learning Introduction',
        bulletPoints: const [
        'ML Concepts'
'Supervised Learning'
'Model Training'
'Basic Algorithms']
      ),
      _ModuleData(
        title: 'Module 5: Mini Project',
         bulletPoints: const [
        'End to End Project'
'Real Dataset'
'Analysis & Visualization'

'Model Building']
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Course Curriculum',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 4,
          width: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: const Color(0xFF071827),
          ),
        ),
        const SizedBox(height: 28),
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 880),
            child: Column(
              children: [
                for (int i = 0; i < modules.length; i++)
                  _CurriculumTile(
                    data: modules[i],
                    initiallyExpanded: i == 0,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ModuleData {
  final String title;
  final List<String>? bulletPoints;

  const _ModuleData({
    required this.title,
    this.bulletPoints,
  });
}

class _CurriculumTile extends StatelessWidget {
  final _ModuleData data;
  final bool initiallyExpanded;

  const _CurriculumTile({
    required this.data,
    required this.initiallyExpanded,
  });

  @override
  Widget build(BuildContext context) {
    final hasBullets = data.bulletPoints != null && data.bulletPoints!.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(15, 23, 42, 0.02),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          iconColor: const Color(0xFF6B7280),
          collapsedIconColor: const Color(0xFF9CA3AF),
          tilePadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          childrenPadding:
              const EdgeInsets.fromLTRB(24, 0, 20, 16),
          title: Text(
            data.title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
              color: Color(0xFF111827),
            ),
          ),
          children: hasBullets
              ? [
                  const SizedBox(height: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: data.bulletPoints!
                        .map(
                          (b) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '• ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    height: 1.6,
                                    color: Color(0xFF4B5563),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    b,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13,
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
                ]
              : [],
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
        constraints: const BoxConstraints(maxWidth: 980),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        decoration: BoxDecoration(
          color: const Color(0xFFE5E7EB),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Ready to Start Your Data Science Journey?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                fontSize: 19,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 12),
            const SizedBox(
              width: 660,
              child: Text(
                'Gain the foundational skills you need to enter the exciting field of data science. '
                'This course is your first step towards a new career.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13.5,
                  height: 1.7,
                  color: Color(0xFF4B5563),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // onPressed: () {},
             onPressed: () => _openEnrollmentDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7E21),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
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
                  fontSize: 13.5,
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
        SizedBox(height: 20),
        Divider(color: Color(0xFFE5E7EB)),
        SizedBox(height: 8),
        Text(
          '© 2025 StudyGrids, Inc. All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12.5,
            fontWeight: FontWeight.w900,
            color: Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}

/* ================= FADE + SLIDE ANIMATION WIDGET ================= */

class FadeInSlide extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const FadeInSlide({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<FadeInSlide> createState() => _FadeInSlideState();
}

class _FadeInSlideState extends State<FadeInSlide>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550),
    );
    _opacity = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _offset = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuad,
      ),
    );

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: widget.child,
      ),
    );
  }
}

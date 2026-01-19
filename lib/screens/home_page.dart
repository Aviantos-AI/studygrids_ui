import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:pie_study/main.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/pie_footer.dart';
import 'package:pie_study/widgets/global_floating_button.dart';

const Color _pieBlue = Color(0xFF0B3558); // deep navy

class PieStudyHomePage extends StatefulWidget {
  const PieStudyHomePage({super.key});

  @override
  State<PieStudyHomePage> createState() => _PieStudyHomePageState();
}

class _PieStudyHomePageState extends State<PieStudyHomePage> {
  Timer? _popupTimer;
  bool _isDialogOpen = false;

  @override
  void initState() {
    super.initState();
    _popupTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (mounted && !_isDialogOpen) {
        _isDialogOpen = true;
        showDialog(
          context: context,
          builder: (ctx) => const EnrollmentFormDialog(),
        ).then((_) {
          _isDialogOpen = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _popupTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      backgroundColor: AppColors.bg,

      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white.withOpacity(0.96),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black12,
        toolbarHeight: 68,
        titleSpacing: 0,

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: PieTopNav(
            onItemTap: (id) => handlePieNavTap(context, id),
            activeId: 'home',
            onEnrollTap: () {
              showDialog(
                context: context,
                builder: (ctx) => const EnrollmentFormDialog(),
              );
            },
          ),
        ),
        actions: [
          //  mobile screen par hi menu icon dikhana hai
          if (!isWide)
            Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.black87),
                onPressed: () => Scaffold.of(ctx).openEndDrawer(),
              ),
            ),
        ],
      ),

      // 👇 mobile + tablet ke liye drawer navigation
      endDrawer: Drawer(
        child: PieNavDrawer(
          activeId: 'home',
          onItemTap: (id) {
            Navigator.pop(context); // drawer close
            handlePieNavTap(context, id);
          },
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFF3F7FB)],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth > 1320
                ? 1320.0
                : constraints.maxWidth;

            // full-page scroll + content (centered) + footer (full width)
            return SingleChildScrollView(
              child: Column(
                children: [
                  // -------- Centered main content with maxWidth --------
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
                            _WhyTrustSection(),
                            SizedBox(height: 40),
                            _CareerImpactSection(),
                            SizedBox(height: 32),
                            _LearnersSection(),
                            SizedBox(height: 40),
                            _WhoWeServeSection(),
                            SizedBox(height: 32),
                            // CtaCardMinimal(),
                            CtaJourneySection(),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // -------- FULL-WIDTH FOOTER (no ConstrainedBox) --------
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
                              builder: (_) =>
                                  const AgenticDevelopersDetailPage(),
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

                  // const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        const leftSection = _HeroLeft();
        const rightSection = _RightHeroCardAnimated();

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 5, child: leftSection),
              const SizedBox(width: 48),
              const Expanded(flex: 4, child: rightSection),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [leftSection, SizedBox(height: 40), rightSection],
          );
        }
      },
    );
  }
}

class _HeroLeft extends StatelessWidget {
  const _HeroLeft();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 900;

    // Responsive heading sizes (desktop bolder / larger)
    final headingStyle = TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w900,
      fontSize: isWide ? 48 : 42, // desktop larger
      height: 1.12,
      letterSpacing: -1.0,
      color: const Color(0xFF0F172A),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Blue Pill Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2FE),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Text(
            'Live • Cohort • Hands-on',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Color(0xFF0369A1),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Main Heading (stronger on desktop)
        Text(
          'Build Future-Ready AI Skills\nwith StudyGrids',
          style: headingStyle,
        ),
        const SizedBox(height: 16),

        // Description
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const Text(
            'Master Agentic AI, Data Science, and next-gen automation through industry-designed, '
            'hands-on programs built for Managers, Leaders, Developers, and Career Changers.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              height: 1.6,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Buttons Row - "Explore Programs" + Animated "Enroll Now"
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () => handlePieNavTap(context, 'programs'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Explore Programs',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),

            _PulsingEnrollButtonLeft(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => const EnrollmentFormDialog(),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Features List (ticks green)
        const _FeatureChipsRow(),
      ],
    );
  }
}

class _PulsingEnrollButtonLeft extends StatefulWidget {
  final VoidCallback onTap;
  const _PulsingEnrollButtonLeft({required this.onTap});

  @override
  State<_PulsingEnrollButtonLeft> createState() =>
      _PulsingEnrollButtonLeftState();
}

class _PulsingEnrollButtonLeftState extends State<_PulsingEnrollButtonLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFE6B2), Color(0xFFFDDFA0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(999),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFB45309).withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const SizedBox(width: 0, height: 0),
              ),
              ElevatedButton(
                onPressed: widget.onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _pieBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 6,
                  shadowColor: Colors.black.withOpacity(0.35),
                ),
                child: const Text(
                  'Enroll Now 🔥',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
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

class _FeatureChipsRow extends StatelessWidget {
  const _FeatureChipsRow();

  static const features = [
    'Live classes',
    'Hands-on projects',
    'Internship pathways',
    'Career support',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: features.map((f) => _FeatureChip(label: f)).toList(),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final String label;
  const _FeatureChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, size: 16, color: Color(0xFF16A34A)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }
}

class _RightHeroCardAnimated extends StatelessWidget {
  const _RightHeroCardAnimated();

  Future<void> _openMailchimp(BuildContext context) async {
    final Uri uri = Uri.parse(mailchimpUrl);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $uri';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open link. Check URL.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _openMailchimp(context),
        borderRadius: BorderRadius.circular(32),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFCA8A04).withOpacity(0.15),
                blurRadius: 50,
                offset: const Offset(0, 22),
                spreadRadius: -6,
              ),
            ],
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.orange, Color(0xFFFF8C42)],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              _StatusBadge(
                                text: 'Live Cohort',
                                icon: Icons.sensors_rounded,
                              ),
                              _PulsingBadge(text: 'Limited Seats Left 🔥'),
                            ],
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'Agentic AI Course',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                              height: 1.05,
                              letterSpacing: -0.5,
                              color: Color(0xFF1E1B4B),
                            ),
                          ),
                          const SizedBox(height: 6),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Weekend-friendly batch  ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color(0xFF78350F),
                                  ),
                                ),
                                TextSpan(
                                  text: '· Starts From 7th Feb',
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Color(0xFF78350F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                          const CountdownTimerWidget(),
                          const SizedBox(height: 14),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: const [
                              _BannerChip(label: 'RAG + N8N Projects'),
                              _BannerChip(label: 'Hands on Agent Workflow'),
                              _BannerChip(label: 'Internship pathway'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -36,
                      right: -36,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  color: const Color(0xFFFFFBEB),
                  child: Column(
                    children: [
                      const Text(
                        'Master the future of AI Automation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _openMailchimp(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB45309),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            shadowColor: const Color(
                              0xFFB45309,
                            ).withOpacity(0.4),
                          ),
                          child: const Text(
                            'Secure Your Spot Now',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Batch Starts From 7th Feb',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF92400E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PulsingBadge extends StatefulWidget {
  final String text;
  const _PulsingBadge({required this.text});

  @override
  State<_PulsingBadge> createState() => _PulsingBadgeState();
}

class _PulsingBadgeState extends State<_PulsingBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF7C2D12),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: const Color(
                    0xFF7C2D12,
                  ).withOpacity(0.3 * _controller.value),
                  blurRadius: 8 * _scaleAnimation.value,
                  spreadRadius: 2 * _controller.value,
                ),
              ],
            ),
            child: Text(
              widget.text,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 11.5,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CountdownTimerWidget extends StatefulWidget {
  const CountdownTimerWidget({super.key});

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Timer _timer;
  final DateTime _targetDate = DateTime(DateTime.now().year, 02, 07, 0, 0, 0);
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _calculateTimeLeft(),
    );
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    if (now.isAfter(_targetDate)) {
      setState(() {
        _timeLeft = Duration.zero;
      });
      _timer.cancel();
    } else {
      setState(() {
        _timeLeft = _targetDate.difference(now);
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_timeLeft.inSeconds <= 0) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          "Batch Started!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF451A03),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Starts in:',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Color(0xFF78350F),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _TimerUnit(value: _timeLeft.inDays, label: 'DAYS'),
            _TimerSeparator(),
            _TimerUnit(value: _timeLeft.inHours % 24, label: 'HRS'),
            _TimerSeparator(),
            _TimerUnit(value: _timeLeft.inMinutes % 60, label: 'MINS'),
            _TimerSeparator(),
            _TimerUnit(value: _timeLeft.inSeconds % 60, label: 'SECS'),
          ],
        ),
      ],
    );
  }
}

class _TimerUnit extends StatelessWidget {
  final int value;
  final String label;

  const _TimerUnit({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            value.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w900,
              fontSize: 22,
              color: Color(0xFFB45309),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Color(0xFF78350F),
          ),
        ),
      ],
    );
  }
}

class _TimerSeparator extends StatelessWidget {
  const _TimerSeparator();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      child: const Text(
        ':',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: Color(0xFFB45309),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String text;
  final IconData icon;

  const _StatusBadge({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color(0xFFD97706)),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
              fontSize: 11.5,
              color: Color(0xFF92400E),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerChip extends StatelessWidget {
  final String label;
  const _BannerChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF451A03),
        ),
      ),
    );
  }
}

class _WhyTrustSection extends StatelessWidget {
  const _WhyTrustSection();

  @override
  Widget build(BuildContext context) {
    final left = [
      'Curriculum designed by AI/ML & tech leaders',
      'Hands-on training with real workflows & agents',
      'Deep focus on Agentic AI and automation',
    ];
    final right = [
      'Internship pathways for Data Science learners',
      'Flexible schedule for working professionals',
      'Mentors with 20+ years of experience',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(15, 23, 42, 0.06),
            blurRadius: 26,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 16,
            bottom: 16,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final wide = constraints.maxWidth > 700;

                Widget buildColumn(List<String> list) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: list
                        .map(
                          (b) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2563EB),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    b,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
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
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Why Thousands Trust StudyGrids',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'A practical, outcomes-focused way to learn Agentic AI.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 18),
                    if (!wide)
                      buildColumn([...left, ...right])
                    else
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: buildColumn(left)),
                          const SizedBox(width: 28),
                          Expanded(child: buildColumn(right)),
                        ],
                      ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3C4),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Text(
                        'Trusted by 1000+ learners',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 12.5,
                          color: Color(0xFF92400E),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CareerImpactSection extends StatelessWidget {
  const _CareerImpactSection();

  @override
  Widget build(BuildContext context) {
    final items = [
      ('35%', 'Average salary boost'),
      ('100+', 'AI workflows built'),
      ('1000+', 'Learners trained'),
      ('50+', 'Enterprise clients'),
    ];

    return Column(
      children: [
        const Text(
          'Career Impact',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Real results from our programs',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13.5,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 650;
            final width = isWide
                ? (constraints.maxWidth - 36) / items.length
                : constraints.maxWidth;

            return Wrap(
              spacing: 12,
              runSpacing: 14,
              alignment: WrapAlignment.center,
              children: [
                for (final item in items)
                  SizedBox(
                    width: width,
                    child: Column(
                      children: [
                        Text(
                          item.$1,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color(0xFF0042E0),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.$2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
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

class _LearnersSection extends StatelessWidget {
  const _LearnersSection();

  @override
  Widget build(BuildContext context) {
    final cards = [
      (
        '“Agentic AI training helped me automate 60% of our operational processes.”',
        'Priya S',
        'Operations Manager',
      ),
      (
        '“Built and deployed my first multi-agent RAG project during the course.”',
        'Rohan K',
        'Software Engineer',
      ),
      (
        '“The 3-month DS internship program landed me interviews in 3 companies.”',
        'Aakash M',
        'Student',
      ),
    ];

    return Column(
      children: [
        const Text(
          'Hear From Our Learners',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Success stories from the StudyGrids community',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13.5,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 860;
            final cardWidth = isWide
                ? (constraints.maxWidth - 36) / 3
                : constraints.maxWidth;

            return Wrap(
              spacing: 18,
              runSpacing: 18,
              alignment: WrapAlignment.center,
              children: [
                for (final c in cards)
                  SizedBox(
                    width: cardWidth,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(15, 23, 42, 0.03),
                            blurRadius: 16,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star_rounded,
                                size: 16,
                                color: Color(0xFFF97316),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            c.$1,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13.5,
                              height: 1.6,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            c.$2,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 13.5,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            c.$3,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.5,
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

class _WhoWeServeSection extends StatelessWidget {
  const _WhoWeServeSection();

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        Icons.person_outline_rounded,
        'B2C – Individual Learners',
        'AI upskilling • Data Science • Agentic AI • Internships',
      ),
      (
        Icons.business_center_outlined,
        'B2B – Companies',
        'Corporate AI training • Workshops • Automation design • AI strategy',
      ),
      (
        Icons.account_balance_rounded,
        'B2G – Government',
        'AI literacy • Capacity building • Public-sector automation',
      ),
    ];

    return Column(
      children: [
        const Text(
          'Who We Serve',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w900,
            fontSize: 26,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 40) / 3
                : constraints.maxWidth;

            return Wrap(
              spacing: 20,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                for (final i in items)
                  SizedBox(
                    width: cardWidth,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 190),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0xFFE5E7EB)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(15, 23, 42, 0.03),
                              blurRadius: 18,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFE0EDFF),
                                  ),
                                  child: Icon(
                                    i.$1 as IconData,
                                    size: 20,
                                    color: const Color(0xFF2563EB),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    i.$2 as String,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                      color: Color(0xFF111827),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              i.$3 as String,
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
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class CtaJourneySection extends StatelessWidget {
  const CtaJourneySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 900;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 22,
        vertical: isDesktop ? 52 : 32,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.blue,
            Color.lerp(AppColors.blue, AppColors.orange, 0.18)!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 32,
            offset: const Offset(0, 16),
          ),
          BoxShadow(
            color: AppColors.orange.withOpacity(0.10),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: Colors.white.withOpacity(0.10)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome, size: 16, color: AppColors.orange),
                    const SizedBox(width: 8),
                    Text(
                      "AI Career Boost",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.95),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Text(
                'Start Your AI Journey Today',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  fontSize: isDesktop ? 34 : 24,
                  height: 1.1,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 14,
                      color: Colors.black.withOpacity(0.45),
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              Text(
                'Join thousands of professionals upgrading their careers with AI skills.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  height: 1.55,
                  fontSize: isDesktop ? 16 : 14,
                  color: Colors.white.withOpacity(0.92),
                ),
              ),

              const SizedBox(height: 28),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 14,
                runSpacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () => handlePieNavTap(context, 'programs'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      shadowColor: AppColors.orange.withOpacity(0.22),
                      elevation: 8,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.school_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Explore Programs',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => handlePieNavTap(context, 'contact'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white.withOpacity(0.26)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      foregroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Talk to an Advisor',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified, size: 16, color: AppColors.orange),
                  const SizedBox(width: 8),
                  Text(
                    "Trusted by 1,000+ learners",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

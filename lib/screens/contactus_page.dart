import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/main.dart'; // handlePieNavTap
import 'package:pie_study/widgets/pie_footer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pie_study/widgets/global_floating_button.dart';

const String mailchimpUrl = 'https://mailchi.mp/ad52932183fa/piestudy';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      // Right-side drawer (same as other pages)
      endDrawer: Drawer(
        child: PieNavDrawer(
          activeId: 'contact',
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
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 68,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: PieTopNav(
            onItemTap: (id) => handlePieNavTap(context, id),
            activeId: 'contact',
            onEnrollTap: () {
              showDialog(
                context: context,
                builder: (ctx) => const CustomEnrollmentDialog(
                  title: "Enquire Now",
                  subtitle: " ",
                ),
              );
              // showDialog(
              //   context: context,
              //   builder: (ctx) => const EnrollmentFormDialog(),
              // );
            },
          ),
        ),
        actions: [
          Builder(
            builder: (ctx) {
              final isWide = MediaQuery.of(ctx).size.width >= 900;
              if (!isWide) {
                return IconButton(
                  icon: const Icon(Icons.menu_rounded, color: Colors.black87),
                  onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),

      // Entire page scrolls; footer placed outside constrained content so it spans full width
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final bool isMobile = constraints.maxWidth < 700;
                  final bool isTablet = constraints.maxWidth >= 700 && constraints.maxWidth < 1100;
                  final bool isDesktop = constraints.maxWidth >= 1100;

                  final double maxWidth = isDesktop ? 1400.0 : (isTablet ? 1000.0 : constraints.maxWidth);
                  final horizontalPadding = isMobile ? 16.0 : 20.0;
                  final verticalPadding = isMobile ? 20.0 : 32.0;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _ContactHeroSection(isMobile: isMobile),
                            SizedBox(height: isMobile ? 20 : 28),
                            _ContactInfoCard(
                              isMobile: isMobile,
                              onConnectTap: () => _openMailchimp(context),
                            ),
                            SizedBox(height: isDesktop ? 72 : (isTablet ? 60 : 40)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // FULL-WIDTH FOOTER (scrollable and spans left->right)
              PieFooter(
                onProgramTap: (id) {
                  switch (id) {
                    case 'managers':
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AgenticManagersDetailPage()));
                      break;
                    case 'developers':
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AgenticDevelopersDetailPage()));
                      break;
                    case 'ds_intern':
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => DataScienceInternshipDetailPage()));
                      break;
                    case 'ds_foundation':
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DataScienceFoundationDetailPage()));
                      break;
                  }
                },
                onAboutTap: () => handlePieNavTap(context, 'about'),
                onVerticalsTap: () => handlePieNavTap(context, 'verticals'),
                onBlogTap: () => handlePieNavTap(context, 'tnc'),
                onFaqTap: () => handlePieNavTap(context, 'faq'),
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
  }
}

/* ================== HERO SECTION ================== */

class _ContactHeroSection extends StatelessWidget {
  final bool isMobile;
  const _ContactHeroSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final cross = isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center;
    final align = isMobile ? Alignment.centerLeft : Alignment.center;
    final titleAlign = isMobile ? TextAlign.left : TextAlign.center;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.navy.withOpacity(0.06),
            AppColors.navy.withOpacity(0.015),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : 36,
        vertical: isMobile ? 22 : 40,
      ),
      child: Column(
        crossAxisAlignment: cross,
        children: [
          Align(
            alignment: align,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Text(
                'Contact StudyGrids',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0369A1),
                ),
              ),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            "Let’s Build Your AI Future",
            textAlign: titleAlign,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w900,
              fontSize: isMobile ? 26 : 36,
              height: 1.18,
              letterSpacing: -0.3,
              color: const Color(0xFF111827),
            ),
          ),
          SizedBox(height: isMobile ? 10 : 14),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 860),
            child: Text(
              "Whether you’re an individual learner or a company leader, we’ll help you design the right AI learning path and roadmap.",
              textAlign: titleAlign,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                height: 1.6,
                color: Color(0xFF4B5563),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ================== CONTACT CARD ================== */

class _ContactInfoCard extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onConnectTap;
  const _ContactInfoCard({required this.isMobile, required this.onConnectTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 28,
        vertical: isMobile ? 18 : 28,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(15, 23, 42, 0.05),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          // Email row
          Row(
            mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFE0F2FE),
                child: Icon(Icons.email_outlined, size: 18, color: Color(0xFF0369A1)),
              ),
              const SizedBox(width: 10),
              const Text(
                "Email:",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  "connect@studygrids.com",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // Phone row
          Row(
            mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFFFF3C4),
                child: Icon(Icons.phone_android_rounded, size: 18, color: Color(0xFF92400E)),
              ),
              const SizedBox(width: 10),
              const Text(
                "Phone:",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  "+91-9309758526",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: isMobile ? 22 : 26),

          // CTA button (black bg, white text) — opens Mailchimp same-window on web
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: isMobile ? double.infinity : 320,
              child: ElevatedButton(
                onPressed: onConnectTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  elevation: 0,
                ),
                child: const Text(
                  "Connect & Signup", // new label
                  style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 15),
                ),
              ),
            ),
          ),

          const SizedBox(height: 14),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "We usually respond within 24 hours on business days.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Inter', fontSize: 12.5, height: 1.5, color: Color(0xFF6B7280)),
            ),
          ),
        ],
      ),
    );
  }
}

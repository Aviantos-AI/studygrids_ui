
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/utils/enrollment_mixin.dart' show EnrollmentPopupMixin;
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/brand_title.dart';
import 'package:pie_study/main.dart';           // handlePieNavTap
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/global_floating_button.dart';
import 'package:pie_study/widgets/mobile_sticky_bottom.dart';
import 'package:pie_study/widgets/pie_footer.dart';
import 'package:pie_study/widgets/register_now.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

// class DataScienceInternshipDetailPage extends StatefulWidget {
//   const DataScienceInternshipDetailPage({super.key});

//   @override
//   State<DataScienceInternshipDetailPage> createState() =>
//       _DataScienceInternshipDetailPageState();
// }

// // ✅ FIX 1: Add 'with EnrollmentPopupMixin'
// class _DataScienceInternshipDetailPageState
//     extends State<DataScienceInternshipDetailPage> with EnrollmentPopupMixin {


//   @override
//   Widget build(BuildContext context) {
//     const pageBg = Color(0xFFF5F7FB);

//     final screenWidth = MediaQuery.of(context).size.width;
//     final isWide = screenWidth >= 900;

//     final maxContentWidth = isWide ? 1180.0 : 720.0;
//     final horizontalPadding = isWide ? 20.0 : 16.0;

//     return Scaffold(
//       backgroundColor: pageBg,
//       endDrawer: isWide
//           ? null
//           : Drawer(
//               child: SafeArea(
//                 child: PieNavDrawer(
//                   activeId: 'programs',
//                   onItemTap: (id) {
//                     Navigator.pop(context);
//                     handlePieNavTap(context, id);
//                   },
//                 ),
//               ),
//             ),

//       appBar: AppBar(
//         leading: const BackButton(color: Colors.black87),
//         backgroundColor: Colors.white,
//         elevation: 0.4,
//         shadowColor: Colors.black12,
//         surfaceTintColor: Colors.transparent,
//         titleSpacing: 0,
//         toolbarHeight: 68,

//         title: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           child: isWide
//               ? PieTopNav(
//                   onItemTap: (id) => handlePieNavTap(context, id),
//                   activeId: 'programs',
//                   ctaLabel: 'FAQ',
//                   onCtaTap: () => handlePieNavTap(context, 'faq'),
//                 )
//               : const Align(
//                   alignment: Alignment.centerLeft,
//                   child: BrandTitle(),
//                 ),
//         ),

//         actions: [
//           if (!isWide)
//             Builder(
//               builder: (ctx) => IconButton(
//                 icon: const Icon(Icons.menu_rounded, color: Colors.black87),
//                 onPressed: () => Scaffold.of(ctx).openEndDrawer(),
//               ),
//             ),
//         ],
//       ),

//       body: Stack(
//         children: [
//           SafeArea(
//             child: SingleChildScrollView(
//                controller: enrollmentScrollController,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
        
//                 // -------- Main Centered Content --------
//                 Center(
//                   child: LayoutBuilder(
//                     builder: (context, constraints) {
//                       final maxWidth = constraints.maxWidth > maxContentWidth
//                           ? maxContentWidth
//                           : constraints.maxWidth;
        
//                       return ConstrainedBox(
//                         constraints: BoxConstraints(maxWidth: maxWidth),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: horizontalPadding,
//                             vertical: 24,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               const FadeInSlide(
//                                 delay: Duration(milliseconds: 0),
//                                 child: _HeroSection(),
//                               ),
//                               const SizedBox(height: 48),
        
//                               const FadeInSlide(
//                                 delay: Duration(milliseconds: 120),
//                                 child: _WhySection(),
//                               ),
//                               const SizedBox(height: 56),
        
//                               const FadeInSlide(
//                                 delay: Duration(milliseconds: 220),
//                                 child: _WhoSection(),
//                               ),
//                               const SizedBox(height: 56),
        
//                               const FadeInSlide(
//                                 delay: Duration(milliseconds: 320),
//                                 child: _StructureSection(),
//                               ),
//                               const SizedBox(height: 56),
        
//                               const FadeInSlide(
//                                 delay: Duration(milliseconds: 420),
//                                 child: _BenefitsSection(),
//                               ),
                            
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
        
//                 // -------- FULL WIDTH FOOTER --------
//                 PieFooter(
//                   onProgramTap: (id) {
//                     switch (id) {
//                       case 'managers':
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (_) => const AgenticManagersDetailPage(),
//                           ),
//                         );
//                         break;
        
//                       case 'developers':
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (_) => const AgenticDevelopersDetailPage(),
//                           ),
//                         );
//                         break;
        
//                       case 'ds_intern':
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (_) => DataScienceInternshipDetailPage(),
//                           ),
//                         );
//                         break;
        
//                       case 'ds_foundation':
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (_) => const DataScienceFoundationDetailPage(),
//                           ),
//                         );
//                         break;
//                     }
//                   },
        
//                   onAboutTap: () => handlePieNavTap(context, 'about'),
//                   onVerticalsTap: () => handlePieNavTap(context, 'verticals'),
//                   onBlogTap: () => handlePieNavTap(context, 'tnc'),
//                   onFaqTap: () => handlePieNavTap(context, 'faq'),
        
//                   onEmailTap: () {},
//                   onPhoneTap: () {},
//                 ),
//               const SizedBox(height: 45),
//               ],
//             ),
//           ),
//         ),
//         MobileStickyBottomBar()
//      ], ),
//     );
//   }
// }

class DataScienceInternshipDetailPage extends StatefulWidget {
  const DataScienceInternshipDetailPage({super.key});

  @override
  State<DataScienceInternshipDetailPage> createState() =>
      _DataScienceInternshipDetailPageState();
}

class _DataScienceInternshipDetailPageState
    extends State<DataScienceInternshipDetailPage>
    with EnrollmentPopupMixin {

  @override
  Widget build(BuildContext context) {
    const pageBg = Color(0xFFF5F7FB);

    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    final maxContentWidth = isDesktop ? 1180.0 : 720.0;
    final horizontalPadding = isDesktop ? 20.0 : 16.0;

    return Scaffold(
      backgroundColor: pageBg,
      endDrawer: isDesktop
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
          child: isDesktop
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
          if (!isDesktop)
            Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.black87),
                onPressed: () => Scaffold.of(ctx).openEndDrawer(),
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              controller: enrollmentScrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxContentWidth),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: 24,
                        ),
                        child: Column(
                          children: [
                            const FadeInSlide(child: _HeroSection()),
                            const SizedBox(height: 48),
                            const FadeInSlide(child: _WhySection()),
                            const SizedBox(height: 56),
                            const FadeInSlide(child: _WhoSection()),
                            const SizedBox(height: 56),
                            const FadeInSlide(child: _StructureSection()),
                            const SizedBox(height: 56),
                            const FadeInSlide(child: _BenefitsSection()),
                            Container(child:    RegisterNow(),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PieFooter(
                    onProgramTap: (id) {
                      if (id == 'managers') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const AgenticManagersDetailPage()));
                      } else if (id == 'developers') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const AgenticDevelopersDetailPage()));
                      } else if (id == 'ds_intern') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const DataScienceInternshipDetailPage()));
                      } else if (id == 'ds_foundation') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const DataScienceFoundationDetailPage()));
                      }
                    },
                    onAboutTap: () => handlePieNavTap(context, 'about'),
                    onVerticalsTap: () => handlePieNavTap(context, 'verticals'),
                    onBlogTap: () => handlePieNavTap(context, 'tnc'),
                    onFaqTap: () => handlePieNavTap(context, 'faq'),
                    onEmailTap: () {},
                    onPhoneTap: () {},
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            ),
          ),
          const MobileStickyBottomBar(),
        ],
      ),
    );
  }
}


const String mailchimpUrl = 'https://mailchi.mp/ad52932183fa/piestudy';



/*-------MAILCHIMP FUNCTION -------------*/
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

/* ================= HERO ================= */

// class _HeroSection extends StatelessWidget {
//   const _HeroSection();

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isWide = width >= 900;
//     final titleSize = isWide ? 32.0 : 26.0;

//     return Flex(
//       direction: isWide ? Axis.horizontal : Axis.vertical,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // LEFT TEXT
//         Expanded(
//           flex: 3,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // small badge
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFE0F2FE),
//                   borderRadius: BorderRadius.circular(999),
//                 ),
//                 child: const Text(
//                   '3-Month Data Science + Internship',
//                   style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 11.5,
//                     color: Color(0xFF0369A1),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 14),
//               Stack(
//                 children: [
//                   Text(
//                     'Become a Job-\nReady Data\nScientist with\nInternship\nExperience.',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w900,
//                       fontSize: titleSize,
//                       height: 1.1,
//                       letterSpacing: -0.3,
//                       color: const Color(0xFF020617),
//                     ),
//                   ),
//                   Text(
//                     'Become a Job-\nReady Data\nScientist with\nInternship\nExperience.',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w900,
//                       fontSize: titleSize,
//                       height: 1.1,
//                       letterSpacing: -0.3,
//                       color: const Color(0xFF071827),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 14),
//               const SizedBox(
//                 width: 460,
//                 child: Text(
//                   'Transform your career with our comprehensive program that combines in-depth '
//                   'data science training with invaluable, real-world internship experience.',
//                   style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontSize: 14,
//                     height: 1.6,
//                     color: Color(0xFF6B7280),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 22),
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 10,
//                 children: [
//                   ElevatedButton(
//                     // onPressed: () {},
//                  onPressed: () => _openEnrollmentDialog(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFFF7E21),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 24, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(999),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       'Enroll Now',
//                       style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         fontSize: 13,
//                       ),
//                     ),
//                   ),
//                   // OutlinedButton(
//                   //   onPressed: () {},
//                   //   style: OutlinedButton.styleFrom(
//                   //     foregroundColor: const Color(0xFF111827),
//                   //     side: const BorderSide(color: Color(0xFFD1D5DB)),
//                   //     padding: const EdgeInsets.symmetric(
//                   //         horizontal: 24, vertical: 12),
//                   //     shape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(999),
//                   //     ),
//                   //   ),
//                   //   child: const Text(
//                   //     'Download Brochure',
//                   //     style: TextStyle(
//                   //       fontFamily: 'Inter',
//                   //       fontWeight: FontWeight.w600,
//                   //       fontSize: 13,
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(width: 32, height: 32),

//         // RIGHT VISUAL: image if available, else icon
//         Expanded(
//           flex: 3,
//           child: SizedBox(
//             height: isWide ? 260 : 220,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(24),
//               child: Image.asset(
//                 // path must match pubspec.yaml
//                 'lib/assets/images/data_science.png',
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Color(0xFF052638),
//                           Color(0xFF0B3B57),
//                         ],
//                       ),
//                     ),
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           width: 190,
//                           height: 190,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             gradient: RadialGradient(
//                               colors: [
//                                 AppColors.gold.withOpacity(0.18),
//                                 Colors.transparent,
//                               ],
//                             ),
//                           ),
//                         ),
//                         Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: const [
//                             Icon(
//                               Icons.show_chart_rounded,
//                               size: 52,
//                               color: Colors.white,
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Live Projects • Real Data',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: 11.5,
//                                 color: Color(0xFFE5E7EB),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 900;
    final titleSize = isWide ? 32.0 : 26.0;

    // --- Left Text Content ---
    Widget leftTextPart = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // small badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2FE),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            '3-Month Data Science + Internship',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 11.5,
              color: Color(0xFF0369A1),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Stack(
          children: [
            Text(
              'Become a Job-\nReady Data\nScientist with\nInternship\nExperience.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                fontSize: titleSize,
                height: 1.1,
                letterSpacing: -0.3,
                color: const Color(0xFF020617),
              ),
            ),
            Text(
              'Become a Job-\nReady Data\nScientist with\nInternship\nExperience.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
                fontSize: titleSize,
                height: 1.1,
                letterSpacing: -0.3,
                color: const Color(0xFF071827),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const SizedBox(
          width: 460,
          child: Text(
            'Transform your career with our comprehensive program that combines in-depth '
            'data science training with invaluable, real-world internship experience.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              height: 1.6,
              color: Color(0xFF6B7280),
            ),
          ),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            ElevatedButton(
              onPressed: () => _openEnrollmentDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7E21),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
          ],
        ),
      ],
    );

    // --- Right Visual Content ---
    Widget rightVisualPart = SizedBox(
      height: isWide ? 260 : 220,
      width: double.infinity, // Mobile par full width ke liye
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          'lib/assets/images/data_science.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF052638),
                    Color(0xFF0B3B57),
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.gold.withOpacity(0.18),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.show_chart_rounded,
                        size: 52,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Live Projects • Real Data',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11.5,
                          color: Color(0xFFE5E7EB),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

    return Flex(
      direction: isWide ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ FIX: Expanded sirf tab use hoga jab space Horizontal ho (Wide Screen)
        if (isWide) Expanded(flex: 3, child: leftTextPart) else leftTextPart,

        const SizedBox(width: 32, height: 32),

        // ✅ FIX: Right part ke liye bhi Expanded conditional hai
        if (isWide) Expanded(flex: 3, child: rightVisualPart) else rightVisualPart,
      ],
    );
  }
}

/* ================= WHY SECTION ================= */

class _WhySection extends StatelessWidget {
  const _WhySection();

  @override
  Widget build(BuildContext context) {
    final cards = [
      (
        Icons.work_outline_rounded,
        'Internship Included',
        'Gain practical, real-world experience by working on live projects during your internship.'
      ),
      (
        Icons.fact_check_rounded,
        'Job-Ready Skills',
        'Master the most in-demand tools and techniques used by top data scientists today.'
      ),
      (
        Icons.school_rounded,
        'Expert Mentors',
        'Learn from industry veterans with years of experience in the data science field.'
      ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(15, 23, 42, 0.03),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Why StudyGrids Data Science Program?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Our program is uniquely designed to make you a complete, job-ready professional.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13.5,
              height: 1.6,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;
              final cardWidth = isWide
                  ? (constraints.maxWidth - 24) / 3
                  : constraints.maxWidth;

              return Wrap(
                spacing: 12,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  for (var c in cards)
                    SizedBox(
                      width: cardWidth,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 18),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0F2FE),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Icon(
                                c.$1,
                                size: 18,
                                color: AppColors.accent,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              c.$2,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xFF111827),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              c.$3,
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
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

/* ================= WHO SHOULD JOIN ================= */

class _WhoSection extends StatelessWidget {
  const _WhoSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Who Should Join This Program?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 26),
        LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;
            final cardWidth = isWide
                ? (constraints.maxWidth - 32) / 3
                : constraints.maxWidth;

            return Wrap(
              spacing: 16,
              runSpacing: 18,
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  width: cardWidth,
                  child: const _WhoCard(
                    title: 'Career Changers',
                    subtitle:
                        'Looking to transition into a high-growth tech career from a different field.',
                    imagePath: 'lib/assets/images/careerpath.jpeg',
                    icon: Icons.change_circle_rounded,
                  ),
                ),
                SizedBox(
                  width: cardWidth,
                  child: const _WhoCard(
                    title: 'Recent Graduates',
                    subtitle:
                        'Eager to secure a competitive edge and land your first data science role.',
                    imagePath: 'lib/assets/images/career.jpeg',
                    icon: Icons.school_outlined,
                  ),
                ),
                SizedBox(
                  width: cardWidth,
                  child: const _WhoCard(
                    title: 'Upskilling Professionals',
                    subtitle:
                        'Aiming to add advanced data science skills to your existing professional toolkit.',
                    imagePath: 'lib/assets/images/upskill.jpeg',
                    icon: Icons.trending_up_rounded,
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

class _WhoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final IconData icon;

  const _WhoCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(15, 23, 42, 0.02),
            blurRadius: 14,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE + FALLBACK ICON
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback: gradient + icon
                return Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF0B3B57),
                        Color(0xFF0F4CC1),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              height: 1.6,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}

/* ================= 3-MONTH STRUCTURE ================= */

class _StructureSection extends StatelessWidget {
  const _StructureSection();

  @override
  Widget build(BuildContext context) {
    final months = [
      (
        'M1',
        'Month 1: Foundations',
        'Build a strong base with essential skills. Focus on Python for data analysis, core statistical concepts, '
            'and an introduction to Machine Learning principles.'
      ),
      (
        'M2',
        'Month 2: Advanced Application',
        'Dive deeper into advanced topics. Master key ML algorithms, conduct Exploratory Data Analysis (EDA), '
            'and work on hands-on projects to apply your knowledge.'
      ),
      (
        'M3',
        'Month 3: Real-World Experience',
        'Transition from theory to practice. Develop a comprehensive capstone project and gain invaluable experience '
            'through a live internship project.'
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '3-Month Program Structure',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 28),
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                for (var m in months)
                  _MonthTile(code: m.$1, title: m.$2, desc: m.$3),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MonthTile extends StatelessWidget {
  final String code;
  final String title;
  final String desc;

  const _MonthTile({
    required this.code,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF071827),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              code,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 14.5,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
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
        ],
      ),
    );
  }
}

/* ================= INTERNSHIP BENEFITS ================= */

class _BenefitsSection extends StatelessWidget {
  const _BenefitsSection();

  @override
  Widget build(BuildContext context) {
    final benefits = [
      (
        'Work on Real Datasets',
        'Apply your skills to solve real-world problems with industry-relevant data.',
      ),
      (
        'Project Certification',
        'Receive a verifiable certificate for your internship project to showcase to employers.',
      ),
      (
        'Resume & LinkedIn Optimization',
        'Get guidance on crafting a compelling profile and highlighting your data projects.',
      ),
      (
        'Interview Preparation',
        'Participate in mock interviews and get feedback to ace your job applications.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        // --- Left Part UI ---
        Widget leftPart = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Internship Benefits',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 420,
              child: Text(
                'Our internship isn’t just a certificate—it’s your launchpad into the data science industry, '
                'equipped with the experience and tools you need to succeed.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13.5,
                  height: 1.7,
                  color: Color(0xFF4B5563),
                ),
              ),
            ),
          ],
        );

        // --- Right Part UI ---
        Widget rightPart = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: benefits
              .map(
                (b) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0F2FE),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          size: 14,
                          color: Color(0xFF0EA5E9),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              b.$1,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 13.5,
                                color: Color(0xFF111827),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              b.$2,
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
                    ],
                  ),
                ),
              )
              .toList(),
        );

        return Flex(
          direction: isWide ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Fix: Only use Expanded in Horizontal mode (Desktop)
            if (isWide)
              Expanded(flex: 2, child: leftPart)
            else
              leftPart,

            const SizedBox(width: 40, height: 32),

            // ✅ Fix: Only use Expanded in Horizontal mode (Desktop)
            if (isWide)
              Expanded(flex: 3, child: rightPart)
            else
              rightPart,
          ],
        );
      },
    );
  }
}

/* ================= FOOTER ================= */

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
            fontSize: 11.5,
            color: Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}

/* ================= FADE + SLIDE ANIMATION ================= */

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

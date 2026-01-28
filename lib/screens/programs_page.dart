




import 'package:flutter/material.dart';
import 'package:pie_study/main.dart';

import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/pie_footer.dart'; // footer

// class ProgramsPage extends StatelessWidget {
//   const ProgramsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const pageBg = Color(0xFFF5F5F7);
//     final isWide = MediaQuery.of(context).size.width >= 800;

//     return Scaffold(
//       backgroundColor: pageBg,

//       // 🔹 Small screen: drawer (right side)
//       endDrawer: Drawer(
//         child: PieNavDrawer(
//           activeId: 'programs',
//           onItemTap: (id) {
//             Navigator.pop(context); // drawer close
//             handlePieNavTap(context, id); // global nav
//           },
//         ),
//       ),

//       appBar: AppBar(
//         backgroundColor: Colors.white.withOpacity(0.96),
//         elevation: 0.5,
//         surfaceTintColor: Colors.transparent,
//         shadowColor: Colors.black12,
//         titleSpacing: 0,
//         toolbarHeight: 68,
//         title: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           child: PieTopNav(
//             onItemTap: (id) => handlePieNavTap(context, id),
//             activeId: 'programs', // ✅ "Programs" tab highlight
//             onCtaTap: () => handlePieNavTap(context, 'contact'),
//           ),
//         ),
//         actions: [
//           // 🔹 Sirf small screen par menu icon
//           if (!isWide)
//             Builder(
//               builder: (ctx) => IconButton(
//                 icon: const Icon(
//                   Icons.menu_rounded,
//                   color: Colors.black87,
//                 ),
//                 onPressed: () => Scaffold.of(ctx).openEndDrawer(),
//               ),
//             ),
//         ],
//       ),

//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           // 🔹 maxWidth thoda bada kiya, taaki desktop par left-right empty space kam ho
//           final maxWidth =
//               constraints.maxWidth > 1320 ? 1320.0 : constraints.maxWidth;
//           final bool isMobile = constraints.maxWidth < 720;

//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 // -------- CENTERED CONTENT (with maxWidth) --------
//                 Padding(
//                   // 🔹 left-right padding kam kiya, taaki content thoda aur spread ho
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 12, vertical: 32),
//                   child: Center(
//                     child: ConstrainedBox(
//                       constraints: BoxConstraints(maxWidth: maxWidth),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // TITLE
//                           RichText(
//                             textAlign: TextAlign.center,
//                             text: const TextSpan(
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w900,
//                                 fontSize: 36,
//                                 height: 1.15,
//                                 letterSpacing: -0.8,
//                                 color: Color(0xFF111827),
//                               ),
//                               children: [
//                                 TextSpan(text: 'Choose Your '),
//                                 TextSpan(
//                                   text: 'Learning',
//                                   style: TextStyle(color: AppColors.gold),
//                                 ),
//                                 TextSpan(text: ' Path'),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           SizedBox(
//                             width: maxWidth < 640 ? maxWidth : 640,
//                             child: const Text(
//                               'Find the perfect program to advance your skills and accelerate your career in artificial intelligence.',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w400,
//                                 height: 1.55,
//                                 color: Color(0xFF6B7280),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           Container(
//                             width: 120,
//                             height: 6,
//                             decoration: BoxDecoration(
//                               color: AppColors.gold.withOpacity(0.9),
//                               borderRadius: BorderRadius.circular(999),
//                             ),
//                           ),
//                           const SizedBox(height: 32),

//                           // 🔹 Responsive Programs Grid
//                           _ProgramsGrid(
//                             maxWidth: maxWidth,
//                             isMobile: isMobile,
//                           ),

//                           const SizedBox(height: 40),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 // -------- FULL-WIDTH FOOTER (OUTSIDE maxWidth) --------
//                 PieFooter(
//                   // ✅ 4 Programs → specific detail pages
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
//                             builder: (_) =>
//                                 const DataScienceInternshipDetailPage(),
//                           ),
//                         );
//                         break;

//                       case 'ds_foundation':
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (_) =>
//                                 const DataScienceFoundationDetailPage(),
//                           ),
//                         );
//                         break;
//                     }
//                   },

//                   // ✅ About Us link
//                   onAboutTap: () => handlePieNavTap(context, 'about'),

//                   // ✅ Our Verticals → B2G (vertical mapping main.dart me hai)
//                   onVerticalsTap: () => handlePieNavTap(context, 'verticals'),

//                   // ✅ Terms & Conditions
//                   onBlogTap: () => handlePieNavTap(context, 'tnc'),

//                   // ✅ FAQ
//                   onFaqTap: () => handlePieNavTap(context, 'faq'),

//                   //  optional: email/phone future ke liye
//                   onEmailTap: () {
//                     // TODO: email launcher
//                   },
//                   onPhoneTap: () {
//                     // TODO: phone dialer
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// /* ---------- GRID / CARDS ------------ */

// class _ProgramsGrid extends StatelessWidget {
//   final double maxWidth;
//   final bool isMobile;

//   const _ProgramsGrid({
//     required this.maxWidth,
//     required this.isMobile,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // 🔹 gap between cards
//     const double spacing = 40;

//     // 🔹 Mobile = 1 card per row (full width)
//     // 🔹 Desktop = 2 cards per row with bigger gap
//     final double cardWidth;
//     if (isMobile || maxWidth < 600) {
//       cardWidth = maxWidth; // single column on mobile
//     } else {
//       const double gap = 40; // horizontal gap between two cards
//       cardWidth = (maxWidth - gap) / 2;
//     }

//     return Wrap(
//       spacing: spacing,
//       runSpacing: spacing,
//       children: [
//         SizedBox(
//           width: cardWidth,
//           child: _ProgramCard(
//             title: 'Agentic AI for Managers & Leaders',
//             description:
//                 'Empower your leadership with AI for strategic decision-making using no-code tools and focusing on strategy.',
//             audienceLabel: 'For Managers',
//             audienceColorBg: const Color(0xFFE3F2FF),
//             audienceColorText: const Color(0xFF0072FF),
//             bullets: const [
//               'Focus on strategy & leadership',
//               'Utilize no-code tools',
//               'Live online classes',
//             ],
//             onLearnMore: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => const AgenticManagersDetailPage(),
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(
//           width: cardWidth,
//           child: _ProgramCard(
//             title: 'Agentic AI for Software Developers',
//             description:
//                 'Build and deploy advanced AI agents and applications. Focus on coding, LLMs, and practical development.',
//             audienceLabel: 'For Developers',
//             audienceColorBg: const Color(0xFFE5F7EA),
//             audienceColorText: const Color(0xFF15803D),
//             bullets: const [
//               'Hands-on coding projects',
//               'Deep dive into LLMs',
//               'Practical application development',
//             ],
//             onLearnMore: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => const AgenticDevelopersDetailPage(),
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(
//           width: cardWidth,
//           child: _ProgramCard(
//             title: 'Data Science + Internship',
//             description:
//                 'A comprehensive program with an in-depth curriculum and real-world experience through a guaranteed internship.',
//             audienceLabel: 'Career Changers',
//             audienceColorBg: const Color(0xFFE5F2FF),
//             audienceColorText: const Color(0xFF1D4ED8),
//             bullets: const [
//               'Guaranteed internship placement',
//               'In-depth curriculum',
//               'Job placement assistance',
//             ],
//             onLearnMore: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => const DataScienceInternshipDetailPage(),
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(
//           width: cardWidth,
//           child: _ProgramCard(
//             title: 'Data Science Foundation',
//             description:
//                 'An introduction to the core concepts of data science. Learn foundational skills with flexible, project-based learning.',
//             audienceLabel: 'For Beginners',
//             audienceColorBg: const Color(0xFFE5F7EA),
//             audienceColorText: const Color(0xFF15803D),
//             bullets: const [
//               'Build foundational skills',
//               'Flexible project-based learning',
//               'Perfect for getting started',
//             ],
//             onLearnMore: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => const DataScienceFoundationDetailPage(),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _ProgramCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String audienceLabel;
//   final Color audienceColorBg;
//   final Color audienceColorText;
//   final List<String> bullets;
//   final VoidCallback? onLearnMore;

//   const _ProgramCard({
//     required this.title,
//     required this.description,
//     required this.audienceLabel,
//     required this.audienceColorBg,
//     required this.audienceColorText,
//     required this.bullets,
//     this.onLearnMore,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const orange = Color(0xFFFF8B3D);
//     const orangeSoft = Color(0xFFFFF2E5);

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromRGBO(15, 23, 42, 0.06),
//             blurRadius: 18,
//             offset: Offset(0, 10),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title + icon
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w700,
//                     fontSize: 16,
//                     color: Color(0xFF111827),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: orangeSoft,
//                   borderRadius: BorderRadius.circular(999),
//                 ),
//                 child: const Icon(
//                   Icons.apps_rounded,
//                   size: 16,
//                   color: orange,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(
//             description,
//             style: const TextStyle(
//               fontFamily: 'Inter',
//               fontSize: 13,
//               height: 1.45,
//               color: AppColors.muted,
//             ),
//           ),
//           const SizedBox(height: 14),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//             decoration: BoxDecoration(
//               color: audienceColorBg,
//               borderRadius: BorderRadius.circular(999),
//             ),
//             child: Text(
//               audienceLabel,
//               style: TextStyle(
//                 fontFamily: 'Inter',
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//                 color: audienceColorText,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Divider(height: 1, color: Color(0xFFE5E7EB)),
//           const SizedBox(height: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: bullets
//                 .map(
//                   (text) => Padding(
//                     padding: const EdgeInsets.only(bottom: 6),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 20,
//                           height: 20,
//                           margin: const EdgeInsets.only(top: 2),
//                           decoration: const BoxDecoration(
//                             color: orangeSoft,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.check_rounded,
//                             size: 14,
//                             color: orange,
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             text,
//                             style: const TextStyle(
//                               fontFamily: 'Inter',
//                               fontSize: 13,
//                               height: 1.4,
//                               color: Color(0xFF374151),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           const SizedBox(height: 14),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: onLearnMore ?? () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: orange,
//                 foregroundColor: Colors.white,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(999),
//                 ),
//                 elevation: 0,
//               ),
//               child: const Text(
//                 'Learn More',
//                 style: TextStyle(
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w700,
//                   fontSize: 13,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const pageBg = Color(0xFFF5F5F7);
    final isWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      backgroundColor: pageBg,

      // 🔹 Small screen: drawer (right side)
      endDrawer: Drawer(
        child: PieNavDrawer(
          activeId: 'programs',
          onItemTap: (id) {
            Navigator.pop(context); // drawer close
            handlePieNavTap(context, id); // global nav
          },
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.96),
        elevation: 0.5,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black12,
        titleSpacing: 0,
        toolbarHeight: 68,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: PieTopNav(
            onItemTap: (id) => handlePieNavTap(context, id),
            activeId: 'programs', // ✅ "Programs" tab highlight
            onCtaTap: () => handlePieNavTap(context, 'contact'),
          ),
        ),
        actions: [
          // 🔹 Sirf small screen par menu icon
          if (!isWide)
            Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.black87,
                ),
                onPressed: () => Scaffold.of(ctx).openEndDrawer(),
              ),
            ),
        ],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          // 🔹 maxWidth logic
          final maxWidth =
              constraints.maxWidth > 1320 ? 1320.0 : constraints.maxWidth;
          final bool isMobile = constraints.maxWidth < 720;

          return SingleChildScrollView(
            child: Column(
              children: [
                // -------- CENTERED CONTENT (with maxWidth) --------
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 32),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // TITLE
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w900,
                                fontSize: 36,
                                height: 1.15,
                                letterSpacing: -0.8,
                                color: Color(0xFF111827),
                              ),
                              children: [
                                TextSpan(text: 'Choose Your '),
                                TextSpan(
                                  text: 'Learning',
                                  style: TextStyle(color: AppColors.gold),
                                ),
                                TextSpan(text: ' Path'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: maxWidth < 640 ? maxWidth : 640,
                            child: const Text(
                              'Find the perfect program to advance your skills and accelerate your career in artificial intelligence.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 1.55,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: 120,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.gold.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          const SizedBox(height: 32),

                          // 🔹 Responsive Programs Grid
                          _ProgramsGrid(
                            maxWidth: maxWidth,
                            isMobile: isMobile,
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),

                // -------- FULL-WIDTH FOOTER --------
                PieFooter(
                  // ✅ Fixed: Using Named Routes for Footer Links too
                  onProgramTap: (id) {
                    switch (id) {
                      case 'managers':
                        Navigator.of(context).pushNamed('/program/managers');
                        break;

                      case 'developers':
                        Navigator.of(context).pushNamed('/program/agentic-ai-training');
                        break;

                      case 'ds_intern':
                        Navigator.of(context).pushNamed('/program/datascience-training');
                        break;

                      case 'ds_foundation':
                        Navigator.of(context).pushNamed('/program/datascience-foundation');
                        break;
                    }
                  },

                  // ✅ Global Nav Links
                  onAboutTap: () => handlePieNavTap(context, 'about'),
                  onVerticalsTap: () => handlePieNavTap(context, 'verticals'),
                  onBlogTap: () => handlePieNavTap(context, 'tnc'),
                  onFaqTap: () => handlePieNavTap(context, 'faq'),

                  // Placeholders
                  onEmailTap: () {},
                  onPhoneTap: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* ---------- GRID / CARDS ------------ */

class _ProgramsGrid extends StatelessWidget {
  final double maxWidth;
  final bool isMobile;

  const _ProgramsGrid({
    required this.maxWidth,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    const double spacing = 40;

    final double cardWidth;
    if (isMobile || maxWidth < 600) {
      cardWidth = maxWidth; 
    } else {
      const double gap = 40; 
      cardWidth = (maxWidth - gap) / 2;
    }

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: [
        // 1. MANAGER PROGRAM
        SizedBox(
          width: cardWidth,
          child: _ProgramCard(
            title: 'Agentic AI for Managers & Leaders',
            description:
                'Empower your leadership with AI for strategic decision-making using no-code tools and focusing on strategy.',
            audienceLabel: 'For Managers',
            audienceColorBg: const Color(0xFFE3F2FF),
            audienceColorText: const Color(0xFF0072FF),
            bullets: const [
              'Focus on strategy & leadership',
              'Utilize no-code tools',
              'Live online classes',
            ],
            onLearnMore: () {
              // ✅ FIX: URL update hoga
              Navigator.of(context).pushNamed('/program/managers');
            },
          ),
        ),

        // 2. DEVELOPER PROGRAM
        SizedBox(
          width: cardWidth,
          child: _ProgramCard(
            title: 'Agentic AI for Software Developers',
            description:
                'Build and deploy advanced AI agents and applications. Focus on coding, LLMs, and practical development.',
            audienceLabel: 'For Developers',
            audienceColorBg: const Color(0xFFE5F7EA),
            audienceColorText: const Color(0xFF15803D),
            bullets: const [
              'Hands-on coding projects',
              'Deep dive into LLMs',
              'Practical application development',
            ],
            onLearnMore: () {
              // ✅ FIX: URL update hoga
              Navigator.of(context).pushNamed('/program/agentic-ai-training');
            },
          ),
        ),

        // 3. DS INTERNSHIP
        SizedBox(
          width: cardWidth,
          child: _ProgramCard(
            title: 'Data Science + Internship',
            description:
                'A comprehensive program with an in-depth curriculum and real-world experience through a guaranteed internship.',
            audienceLabel: 'Career Changers',
            audienceColorBg: const Color(0xFFE5F2FF),
            audienceColorText: const Color(0xFF1D4ED8),
            bullets: const [
              'Guaranteed internship placement',
              'In-depth curriculum',
              'Job placement assistance',
            ],
            onLearnMore: () {
              // ✅ FIX: URL update hoga
              Navigator.of(context).pushNamed('/program/datascience-training');
            },
          ),
        ),

        // 4. DS FOUNDATION
        SizedBox(
          width: cardWidth,
          child: _ProgramCard(
            title: 'Data Science Foundation',
            description:
                'An introduction to the core concepts of data science. Learn foundational skills with flexible, project-based learning.',
            audienceLabel: 'For Beginners',
            audienceColorBg: const Color(0xFFE5F7EA),
            audienceColorText: const Color(0xFF15803D),
            bullets: const [
              'Build foundational skills',
              'Flexible project-based learning',
              'Perfect for getting started',
            ],
            onLearnMore: () {
              // ✅ FIX: URL update hoga
              Navigator.of(context).pushNamed('/program/datascience-foundation');
            },
          ),
        ),
      ],
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final String title;
  final String description;
  final String audienceLabel;
  final Color audienceColorBg;
  final Color audienceColorText;
  final List<String> bullets;
  final VoidCallback? onLearnMore;

  const _ProgramCard({
    required this.title,
    required this.description,
    required this.audienceLabel,
    required this.audienceColorBg,
    required this.audienceColorText,
    required this.bullets,
    this.onLearnMore,
  });

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFFF8B3D);
    const orangeSoft = Color(0xFFFFF2E5);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(15, 23, 42, 0.06),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: orangeSoft,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Icon(
                  Icons.apps_rounded,
                  size: 16,
                  color: orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              height: 1.45,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: audienceColorBg,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              audienceLabel,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: audienceColorText,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, color: Color(0xFFE5E7EB)),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bullets
                .map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: const BoxDecoration(
                            color: orangeSoft,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            size: 14,
                            color: orange,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              height: 1.4,
                              color: Color(0xFF374151),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onLearnMore ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: orange,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Learn More',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
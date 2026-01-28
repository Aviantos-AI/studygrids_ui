

import 'package:flutter/material.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/main.dart';
import 'package:pie_study/widgets/global_floating_button.dart';
import 'package:pie_study/widgets/pie_footer.dart'; // handlePieNavTap
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

// const String mailchimpUrl = 'https://mailchi.mp/ad52932183fa/piestudy';

// // Logo colors
// const Color _pieBlue = Color(0xFF0B3558); // deep navy
// const Color _pieGold = Color(0xFFFDB515); // warm golden

// /// =======================  B2C PAGE  =======================

// class B2CPage extends StatelessWidget {
//   const B2CPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bool isWide = MediaQuery.of(context).size.width >= 900;

//     return Scaffold(
//       backgroundColor: AppColors.bg,

//       endDrawer: Drawer(
//         child: PieNavDrawer(
//           activeId: 'b2c',
//           onItemTap: (id) {
//             Navigator.pop(context);
//             handlePieNavTap(context, id);
//           },
//         ),
//       ),

//       appBar: AppBar(
//         leading: const BackButton(color: Colors.black87),
//         backgroundColor: Colors.white.withOpacity(0.96),
//         elevation: 0.5,
//         surfaceTintColor: Colors.transparent,
//         shadowColor: Colors.black12,
//         titleSpacing: 0,
//         toolbarHeight: 68,
//         title: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//           child: PieTopNav(
//             onItemTap: (id) => handlePieNavTap(context, id),
//             activeId: 'b2g',
//           ),
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

//       body: SafeArea(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             final bool isMobile = constraints.maxWidth < 700;
//             final double maxWidth = isMobile ? constraints.maxWidth : 1180;

//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   _B2CHeroSection(isMobile: isMobile, maxWidth: maxWidth),
//                   const SizedBox(height: 40),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 0,
//                     ),
//                     child: Center(
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(maxWidth: maxWidth),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             _B2CWhyChooseSection(isMobile: isMobile),
//                             const SizedBox(height: 40),
//                             _B2CProgramsSection(isMobile: isMobile),
//                             const SizedBox(height: 40),
//                             _B2CLearnersSection(isMobile: isMobile),
//                             const SizedBox(height: 40),
//                             _B2CLearningJourneySection(isMobile: isMobile),
//                             const SizedBox(height: 32),
//                             _B2CHighlightCTASection(isMobile: isMobile),
//                             const SizedBox(height: 60),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   PieFooter(
//                     // ✅ 4 Programs → specific detail pages
//                     onProgramTap: (id) {
//                       switch (id) {
//                         case 'managers':
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (_) => const AgenticManagersDetailPage(),
//                             ),
//                           );
//                           break;

//                         case 'developers':
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (_) =>
//                                   const AgenticDevelopersDetailPage(),
//                             ),
//                           );
//                           break;

//                         case 'ds_intern':
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (_) =>
//                                   const DataScienceInternshipDetailPage(),
//                             ),
//                           );
//                           break;

//                         case 'ds_foundation':
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (_) =>
//                                   const DataScienceFoundationDetailPage(),
//                             ),
//                           );
//                           break;
//                       }
//                     },

//                     // ✅ About Us link
//                     onAboutTap: () {
//                       handlePieNavTap(context, 'about');
//                     },

//                     // ✅ Our Verticals → B2G (vertical mapping main.dart me hai)
//                     onVerticalsTap: () {
//                       handlePieNavTap(context, 'verticals');
//                     },

//                     // ✅ Terms & Conditions
//                     onBlogTap: () {
//                       handlePieNavTap(context, 'tnc');
//                     },

//                     // ✅ FAQ
//                     onFaqTap: () {
//                       handlePieNavTap(context, 'faq');
//                     },

//                     // ✅ optional: email/phone future ke liye
//                     onEmailTap: () {
//                       // TODO: email launcher
//                     },
//                     onPhoneTap: () {
//                       // TODO: phone dialer
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// /// ---------------- HERO (NAVY BACKGROUND) ----------------

// class _B2CHeroSection extends StatelessWidget {
//   final bool isMobile;
//   final double maxWidth;

//   const _B2CHeroSection({required this.isMobile, required this.maxWidth});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             _pieBlue,
//             Color(0xFF072339), // thoda dark bottom
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       padding: EdgeInsets.symmetric(vertical: isMobile ? 28 : 44),
//       child: Center(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(maxWidth: maxWidth),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
//             child: Column(
//               crossAxisAlignment: isMobile
//                   ? CrossAxisAlignment.start
//                   : CrossAxisAlignment.center,
//               children: [
//                 // small badge
//                 Row(
//                   mainAxisAlignment: isMobile
//                       ? MainAxisAlignment.start
//                       : MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.08),
//                         borderRadius: BorderRadius.circular(999),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.25),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: const [
//                           Icon(Icons.bolt_rounded, size: 16, color: _pieGold),
//                           SizedBox(width: 6),
//                           Text(
//                             'Admissions open • Limited seats',
//                             style: TextStyle(
//                               fontFamily: 'Inter',
//                               fontSize: 11.5,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 18),
//                 Text(
//                   'Empowering Learners to Build AI Careers',
//                   textAlign: isMobile ? TextAlign.left : TextAlign.center,
//                   softWrap: true,
//                   style: const TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w800,
//                     fontSize: 26,
//                     height: 1.3,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   'Learn AI, ML and Data skills with mentor-led cohorts, real projects and a job-focused curriculum designed for Indian learners.',
//                   textAlign: isMobile ? TextAlign.left : TextAlign.center,
//                   softWrap: true,
//                   style: const TextStyle(
//                     fontFamily: 'Inter',
//                     fontSize: 14,
//                     height: 1.6,
//                     color: Color(0xFFE5E7EB),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Wrap(
//                   spacing: 12,
//                   runSpacing: 12,
//                   alignment: isMobile
//                       ? WrapAlignment.start
//                       : WrapAlignment.center,
//                   children: [
//                     // gold button with white text
//                     ElevatedButton(
//                       // onPressed: () {},
//                       onPressed: () => handlePieNavTap(context, 'programs'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.orange,
//                         foregroundColor: Colors.white,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: isMobile ? 18 : 24,
//                           vertical: 13,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(999),
//                         ),
//                         elevation: 0,
//                       ),
//                       child: const Text(
//                         'Explore Programs',
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w700,
//                           fontSize: 13.5,
//                         ),
//                       ),
//                     ),
//                     OutlinedButton(
//                       onPressed: () {},
//                       style: OutlinedButton.styleFrom(
//                         side: const BorderSide(color: Colors.white70),
//                         padding: EdgeInsets.symmetric(
//                           horizontal: isMobile ? 18 : 24,
//                           vertical: 13,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(999),
//                         ),
//                         backgroundColor: Colors.transparent,
//                       ),
//                       child: const Text(
//                         'Download Brochure',
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 13.5,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// ---------------- WHY LEARNERS CHOOSE ----------------

// class _B2CWhyChooseSection extends StatelessWidget {
//   final bool isMobile;
//   const _B2CWhyChooseSection({required this.isMobile});

//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       _IconFeature(
//         icon: Icons.auto_stories_outlined,
//         title: 'Structured learning paths',
//         subtitle: 'Beginner-friendly roadmap with clear milestones.',
//       ),
//       _IconFeature(
//         icon: Icons.support_agent_outlined,
//         title: 'Mentor support',
//         subtitle: 'Live doubt-clearing and project feedback.',
//       ),
//       _IconFeature(
//         icon: Icons.task_alt_outlined,
//         title: 'Hands-on projects',
//         subtitle: 'Real-world case studies and capstone projects.',
//       ),
//       _IconFeature(
//         icon: Icons.work_outline,
//         title: 'Career guidance',
//         subtitle: 'Resume, LinkedIn, mock interviews and more.',
//       ),
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           'Why Learners Choose StudyGrids',
//           textAlign: TextAlign.center,
//           softWrap: true,
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w700,
//             fontSize: isMobile ? 18 : 20,
//             color: const Color(0xFF111827),
//           ),
//         ),
//         const SizedBox(height: 24),
//         Wrap(
//           spacing: 24,
//           runSpacing: 24,
//           alignment: isMobile ? WrapAlignment.start : WrapAlignment.center,
//           children: items
//               .map(
//                 (e) => SizedBox(
//                   width: isMobile ? double.infinity : 220,
//                   child: _IconFeatureTile(feature: e),
//                 ),
//               )
//               .toList(),
//         ),
//       ],
//     );
//   }
// }

// /// ---------------- OUR PROGRAMS ----------------

// class _B2CProgramsSection extends StatelessWidget {
//   final bool isMobile;
//   const _B2CProgramsSection({required this.isMobile});

//   @override
//   Widget build(BuildContext context) {
//     final programs = [
//       _Program(
//         title: 'Job-Ready AI & ML Program',
//         description:
//             'End-to-end program covering Python, ML, GenAI and deployment for industry roles.',
//       ),
//       _Program(
//         title: 'Data Analytics Career Track',
//         description:
//             'Excel, SQL, BI tools and storytelling to become a data analyst.',
//       ),
//       _Program(
//         title: 'Weekend AI Cohorts',
//         description: 'Live weekend batches tailored for working professionals.',
//       ),
//       _Program(
//         title: 'College Launchpad Program',
//         description:
//             'Final-year and pre-final-year students preparing for AI/data jobs.',
//       ),
//       _Program(
//         title: 'Interview Prep Bootcamps',
//         description:
//             'Focused bootcamps for product, data and ML interview readiness.',
//       ),
//       _Program(
//         title: 'Portfolio & Resume Review',
//         description:
//             '1:1 feedback to refine your projects, GitHub and LinkedIn.',
//       ),
//     ];

//     return _SectionBlock(
//       isMobile: isMobile,
//       title: 'Our Programs',
//       subtitle:
//           'Cohort-based and self-paced options for every stage of your career.',
//       child: _ProgramsGridSlim(isMobile: isMobile, programs: programs),
//     );
//   }
// }

// /// ---------------- LEARNERS WE SUPPORT ----------------

// class _B2CLearnersSection extends StatelessWidget {
//   final bool isMobile;
//   const _B2CLearnersSection({required this.isMobile});

//   @override
//   Widget build(BuildContext context) {
//     final learners = [
//       'College Students',
//       'Freshers & Early-career',
//       'Working Professionals',
//       'Career Switchers',
//       'Freelancers & Solopreneurs',
//       'Product & Tech Folks',
//       'Non-Tech to AI',
//       'Founders & CXOs',
//     ];

//     return _SectionBlock(
//       isMobile: isMobile,
//       title: 'Learners We Support',
//       subtitle:
//           'Designed for ambitious learners from diverse academic and professional backgrounds.',
//       child: _ChipList(isMobile: isMobile, labels: learners),
//     );
//   }
// }

// /// ---------------- LEARNING JOURNEY (5 STEPS) ----------------

// class _B2CLearningJourneySection extends StatelessWidget {
//   final bool isMobile;
//   const _B2CLearningJourneySection({required this.isMobile});

//   @override
//   Widget build(BuildContext context) {
//     final steps = [
//       _JourneyStep(
//         number: 1,
//         title: 'Foundation Skills',
//         description:
//             'Master Python, statistics, data handling and core AI concepts.',
//       ),
//       _JourneyStep(
//         number: 2,
//         title: 'Hands-on Projects',
//         description:
//             'Work on guided and capstone projects to build a solid portfolio.',
//       ),
//       _JourneyStep(
//         number: 3,
//         title: 'Specialisation Track',
//         description:
//             'Choose AI/ML, Data Analytics or GenAI apps based on your goals.',
//       ),
//       _JourneyStep(
//         number: 4,
//         title: 'Career Preparation',
//         description:
//             'Resume review, LinkedIn optimisation and mock interviews.',
//       ),
//       _JourneyStep(
//         number: 5,
//         title: 'Lifelong Community',
//         description:
//             'Stay connected with mentors, alumni network and ongoing live sessions.',
//       ),
//     ];

//     return _SectionBlock(
//       isMobile: isMobile,
//       title: 'Your Learning Journey',
//       subtitle: '',
//       child: Column(
//         children: steps
//             .map(
//               (step) => Padding(
//                 padding: const EdgeInsets.only(bottom: 16),
//                 child: _JourneyStepCard(step: step),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }

// /**---------------MAIL CHIMP FUNCTION--------- */

// Future<void> _openMailchimp(BuildContext context) async {
//   final uri = Uri.parse(mailchimpUrl);
//   if (kIsWeb) {
//     // open in same tab on web
//     await launchUrl(uri, webOnlyWindowName: '_self');
//     return;
//   }

//   // native: open external browser
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Unable to open signup page.')),
//     );
//   }
// }

//     void _openEnrollmentDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (ctx) => const EnrollmentFormDialog(),
//     );
//   }

// /// ---------------- HIGHLIGHT CTA (NAVY + GOLD) ----------------

// class _B2CHighlightCTASection extends StatelessWidget {
//   final bool isMobile;
//   const _B2CHighlightCTASection({required this.isMobile});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       padding: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 0),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(
//           horizontal: isMobile ? 18 : 28,
//           vertical: isMobile ? 18 : 22,
//         ),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             colors: [_pieBlue, Color(0xFF061B2D)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(22),
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 16,
//               offset: const Offset(0, 10),
//               color: Colors.black.withOpacity(0.12),
//             ),
//           ],
//         ),
//         child: isMobile
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Ready to start your AI journey?',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w700,
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   const Text(
//                     'Join the next cohort and get personalised guidance from PieStudy mentors.',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontSize: 13,
//                       height: 1.5,
//                       color: Color(0xFFE5E7EB),
//                     ),
//                   ),
//                   const SizedBox(height: 14),
//                   Wrap(
//                     spacing: 10,
//                     runSpacing: 10,
//                     children: [
//                       ElevatedButton(
//                         // onPressed: () {},
//                      onPressed: () => _openEnrollmentDialog( context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: _pieGold,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(999),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: const Text(
//                           'Join Next Cohort',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ),
//                       OutlinedButton(
//                         // onPressed: () {},
//                         onPressed: () => handlePieNavTap(context, 'contact'),
//                         style: OutlinedButton.styleFrom(
//                           side: const BorderSide(color: Colors.white70),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 16,
//                             vertical: 10,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(999),
//                           ),
//                         ),
//                         child: const Text(
//                           'Talk to a Mentor',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 13,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               )
//             : Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'Ready to start your AI journey?',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 6),
//                         Text(
//                           'Join the next cohort and get personalised guidance, projects and mock interviews with StudyGrids mentors.',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontSize: 13.5,
//                             height: 1.5,
//                             color: Color(0xFFE5E7EB),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 22),
//                   Wrap(
//                     spacing: 12,
//                     runSpacing: 8,
//                     children: [
//                       ElevatedButton(
//                         // onPressed: () {},
//                       onPressed: () => _openEnrollmentDialog( context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.orange,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 20,
//                             vertical: 12,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(999),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: const Text(
//                           'Join Next Cohort',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 13.5,
//                           ),
//                         ),
//                       ),
//                       OutlinedButton(
//                         // onPressed: () {},
//                         onPressed: () => handlePieNavTap(context, 'contact'),
//                         style: OutlinedButton.styleFrom(
//                           side: const BorderSide(color: Colors.white70),
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 18,
//                             vertical: 12,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(999),
//                           ),
//                         ),
//                         child: const Text(
//                           'Talk to a Mentor',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 13.5,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

// /// =======================  SHARED WIDGETS  =======================

// class _SectionBlock extends StatelessWidget {
//   final bool isMobile;
//   final String title;
//   final String subtitle;
//   final Widget child;

//   const _SectionBlock({
//     required this.isMobile,
//     required this.title,
//     required this.subtitle,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           title,
//           textAlign: TextAlign.center,
//           softWrap: true,
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w700,
//             fontSize: isMobile ? 18 : 20,
//             color: const Color(0xFF111827),
//           ),
//         ),
//         if (subtitle.isNotEmpty) ...[
//           const SizedBox(height: 8),
//           Text(
//             subtitle,
//             textAlign: TextAlign.center,
//             softWrap: true,
//             style: const TextStyle(
//               fontFamily: 'Inter',
//               fontSize: 13,
//               height: 1.5,
//               color: Color(0xFF4B5563),
//             ),
//           ),
//         ],
//         const SizedBox(height: 24),
//         child,
//       ],
//     );
//   }
// }

// class _IconFeature {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   _IconFeature({
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//   });
// }

// class _IconFeatureTile extends StatelessWidget {
//   final _IconFeature feature;
//   const _IconFeatureTile({required this.feature});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: _pieGold.withOpacity(0.14),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Icon(feature.icon, size: 24, color: _pieBlue),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           feature.title,
//           textAlign: TextAlign.center,
//           softWrap: true,
//           style: const TextStyle(
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//             color: Color(0xFF111827),
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           feature.subtitle,
//           textAlign: TextAlign.center,
//           softWrap: true,
//           style: const TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 12,
//             height: 1.4,
//             color: Color(0xFF6B7280),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _Program {
//   final String title;
//   final String description;
//   _Program({required this.title, required this.description});
// }

// /// Our Programs grid – MOBILE PAR CHHOTE CARDS
// class _ProgramsGridSlim extends StatelessWidget {
//   final bool isMobile;
//   final List<_Program> programs;
//   const _ProgramsGridSlim({required this.isMobile, required this.programs});

//   int _crossAxisCount(double width) {
//     if (width < 720) return 1; // mobile: 1 column
//     if (width < 1024) return 2;
//     return 3;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final int crossAxisCount = _crossAxisCount(width);

//     // mobile cards ko chhota dikhane ke liye: aspect ratio bada
//     final double aspect = isMobile ? 2.5 : 2.4;

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: programs.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//         childAspectRatio: aspect,
//       ),
//       itemBuilder: (context, index) {
//         final program = programs[index];
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(color: AppColors.muted.withOpacity(0.4)),
//             boxShadow: [
//               BoxShadow(
//                 blurRadius: 8,
//                 offset: const Offset(0, 3),
//                 color: Colors.black.withOpacity(0.02),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 program.title,
//                 softWrap: true,
//                 style: const TextStyle(
//                   fontFamily: 'Inter',
//                   fontWeight: FontWeight.w700,
//                   fontSize: 13.5, // thoda chota
//                   color: Color(0xFF111827),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Flexible(
//                 child: Text(
//                   program.description,
//                   softWrap: true,
//                   style: const TextStyle(
//                     fontFamily: 'Inter',
//                     fontSize: 12,
//                     height: 1.4,
//                     color: Color(0xFF4B5563),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class _ChipList extends StatelessWidget {
//   final bool isMobile;
//   final List<String> labels;
//   const _ChipList({required this.isMobile, required this.labels});

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 16,
//       runSpacing: 16,
//       alignment: isMobile ? WrapAlignment.start : WrapAlignment.center,
//       children: labels
//           .map(
//             (label) => Container(
//               padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(999),
//                 border: Border.all(color: _pieBlue.withOpacity(0.15)),
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 8,
//                     offset: const Offset(0, 3),
//                     color: Colors.black.withOpacity(0.02),
//                   ),
//                 ],
//               ),
//               child: Text(
//                 label,
//                 softWrap: true,
//                 style: const TextStyle(
//                   fontFamily: 'Inter',
//                   fontSize: 13,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF111827),
//                 ),
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }
// }

// class _JourneyStep {
//   final int number;
//   final String title;
//   final String description;

//   _JourneyStep({
//     required this.number,
//     required this.title,
//     required this.description,
//   });
// }

// class _JourneyStepCard extends StatelessWidget {
//   final _JourneyStep step;
//   const _JourneyStepCard({required this.step});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: AppColors.muted.withOpacity(0.4)),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 8,
//             offset: const Offset(0, 3),
//             color: Colors.black.withOpacity(0.02),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 32,
//             height: 32,
//             decoration: const BoxDecoration(
//               color: AppColors.orange,
//               shape: BoxShape.circle,
//             ),
//             alignment: Alignment.center,
//             child: Text(
//               step.number.toString(),
//               style: const TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w700,
//                 fontSize: 15,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   step.title,
//                   softWrap: true,
//                   style: const TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w700,
//                     fontSize: 14.5,
//                     color: Color(0xFF111827),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   step.description,
//                   softWrap: true,
//                   style: const TextStyle(
//                     fontFamily: 'Inter',
//                     fontSize: 12.5,
//                     height: 1.5,
//                     color: Color(0xFF4B5563),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



const String mailchimpUrl = 'https://mailchi.mp/ad52932183fa/piestudy';

// Logo colors
const Color _pieBlue = Color(0xFF0B3558); // deep navy
const Color _pieGold = Color(0xFFFDB515); // warm golden

/// =======================  B2C PAGE  =======================

class B2CPage extends StatelessWidget {
  const B2CPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: AppColors.bg,

      endDrawer: Drawer(
        child: PieNavDrawer(
          activeId: 'b2c', // ✅ FIX: 'b2g' -> 'b2c'
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
            activeId: 'b2c', // ✅ FIX: 'b2g' -> 'b2c' (Highlight Correct Tab)
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

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth < 700;
            final double maxWidth = isMobile ? constraints.maxWidth : 1180;

            return SingleChildScrollView(
              child: Column(
                children: [
                  _B2CHeroSection(isMobile: isMobile, maxWidth: maxWidth),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _B2CWhyChooseSection(isMobile: isMobile),
                            const SizedBox(height: 40),
                            _B2CProgramsSection(isMobile: isMobile),
                            const SizedBox(height: 40),
                            _B2CLearnersSection(isMobile: isMobile),
                            const SizedBox(height: 40),
                            _B2CLearningJourneySection(isMobile: isMobile),
                            const SizedBox(height: 32),
                            _B2CHighlightCTASection(isMobile: isMobile),
                            const SizedBox(height: 60),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // FOOTER
                  PieFooter(
                    // ✅ 4 Programs → specific detail pages via Named Routes
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

                    // ✅ About Us link
                    onAboutTap: () {
                      handlePieNavTap(context, 'about');
                    },

                    // ✅ Our Verticals → B2C
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

                    //  optional: email/phone
                    onEmailTap: () {},
                    onPhoneTap: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// ---------------- HERO (NAVY BACKGROUND) ----------------

class _B2CHeroSection extends StatelessWidget {
  final bool isMobile;
  final double maxWidth;

  const _B2CHeroSection({required this.isMobile, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _pieBlue,
            Color(0xFF072339), // thoda dark bottom
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 28 : 44),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                // small badge
                Row(
                  mainAxisAlignment: isMobile
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.bolt_rounded, size: 16, color: _pieGold),
                          SizedBox(width: 6),
                          Text(
                            'Admissions open • Limited seats',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  'Empowering Learners to Build AI Careers',
                  textAlign: isMobile ? TextAlign.left : TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                    height: 1.3,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Learn AI, ML and Data skills with mentor-led cohorts, real projects and a job-focused curriculum designed for Indian learners.',
                  textAlign: isMobile ? TextAlign.left : TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    height: 1.6,
                    color: Color(0xFFE5E7EB),
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: isMobile
                      ? WrapAlignment.start
                      : WrapAlignment.center,
                  children: [
                    // gold button with white text
                    ElevatedButton(
                      onPressed: () => handlePieNavTap(context, 'programs'),
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
                        'Explore Programs',
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
                        side: const BorderSide(color: Colors.white70),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 18 : 24,
                          vertical: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Download Brochure',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5,
                          color: Colors.white,
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

/// ---------------- WHY LEARNERS CHOOSE ----------------

class _B2CWhyChooseSection extends StatelessWidget {
  final bool isMobile;
  const _B2CWhyChooseSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final items = [
      _IconFeature(
        icon: Icons.auto_stories_outlined,
        title: 'Structured learning paths',
        subtitle: 'Beginner-friendly roadmap with clear milestones.',
      ),
      _IconFeature(
        icon: Icons.support_agent_outlined,
        title: 'Mentor support',
        subtitle: 'Live doubt-clearing and project feedback.',
      ),
      _IconFeature(
        icon: Icons.task_alt_outlined,
        title: 'Hands-on projects',
        subtitle: 'Real-world case studies and capstone projects.',
      ),
      _IconFeature(
        icon: Icons.work_outline,
        title: 'Career guidance',
        subtitle: 'Resume, LinkedIn, mock interviews and more.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Why Learners Choose StudyGrids',
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
        ),
      ],
    );
  }
}

/// ---------------- OUR PROGRAMS ----------------

class _B2CProgramsSection extends StatelessWidget {
  final bool isMobile;
  const _B2CProgramsSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final programs = [
      _Program(
        title: 'Job-Ready AI & ML Program',
        description:
            'End-to-end program covering Python, ML, GenAI and deployment for industry roles.',
      ),
      _Program(
        title: 'Data Analytics Career Track',
        description:
            'Excel, SQL, BI tools and storytelling to become a data analyst.',
      ),
      _Program(
        title: 'Weekend AI Cohorts',
        description: 'Live weekend batches tailored for working professionals.',
      ),
      _Program(
        title: 'College Launchpad Program',
        description:
            'Final-year and pre-final-year students preparing for AI/data jobs.',
      ),
      _Program(
        title: 'Interview Prep Bootcamps',
        description:
            'Focused bootcamps for product, data and ML interview readiness.',
      ),
      _Program(
        title: 'Portfolio & Resume Review',
        description:
            '1:1 feedback to refine your projects, GitHub and LinkedIn.',
      ),
    ];

    return _SectionBlock(
      isMobile: isMobile,
      title: 'Our Programs',
      subtitle:
          'Cohort-based and self-paced options for every stage of your career.',
      child: _ProgramsGridSlim(isMobile: isMobile, programs: programs),
    );
  }
}

/// ---------------- LEARNERS WE SUPPORT ----------------

class _B2CLearnersSection extends StatelessWidget {
  final bool isMobile;
  const _B2CLearnersSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final learners = [
      'College Students',
      'Freshers & Early-career',
      'Working Professionals',
      'Career Switchers',
      'Freelancers & Solopreneurs',
      'Product & Tech Folks',
      'Non-Tech to AI',
      'Founders & CXOs',
    ];

    return _SectionBlock(
      isMobile: isMobile,
      title: 'Learners We Support',
      subtitle:
          'Designed for ambitious learners from diverse academic and professional backgrounds.',
      child: _ChipList(isMobile: isMobile, labels: learners),
    );
  }
}

/// ---------------- LEARNING JOURNEY (5 STEPS) ----------------

class _B2CLearningJourneySection extends StatelessWidget {
  final bool isMobile;
  const _B2CLearningJourneySection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final steps = [
      _JourneyStep(
        number: 1,
        title: 'Foundation Skills',
        description:
            'Master Python, statistics, data handling and core AI concepts.',
      ),
      _JourneyStep(
        number: 2,
        title: 'Hands-on Projects',
        description:
            'Work on guided and capstone projects to build a solid portfolio.',
      ),
      _JourneyStep(
        number: 3,
        title: 'Specialisation Track',
        description:
            'Choose AI/ML, Data Analytics or GenAI apps based on your goals.',
      ),
      _JourneyStep(
        number: 4,
        title: 'Career Preparation',
        description:
            'Resume review, LinkedIn optimisation and mock interviews.',
      ),
      _JourneyStep(
        number: 5,
        title: 'Lifelong Community',
        description:
            'Stay connected with mentors, alumni network and ongoing live sessions.',
      ),
    ];

    return _SectionBlock(
      isMobile: isMobile,
      title: 'Your Learning Journey',
      subtitle: '',
      child: Column(
        children: steps
            .map(
              (step) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _JourneyStepCard(step: step),
              ),
            )
            .toList(),
      ),
    );
  }
}

/**---------------MAIL CHIMP FUNCTION & DIALOG--------- */

Future<void> _openMailchimp(BuildContext context) async {
  final uri = Uri.parse(mailchimpUrl);
  if (kIsWeb) {
    await launchUrl(uri, webOnlyWindowName: '_self');
    return;
  }
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

/// ---------------- HIGHLIGHT CTA (NAVY + GOLD) ----------------

class _B2CHighlightCTASection extends StatelessWidget {
  final bool isMobile;
  const _B2CHighlightCTASection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 4 : 0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 18 : 28,
          vertical: isMobile ? 18 : 22,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [_pieBlue, Color(0xFF061B2D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              offset: const Offset(0, 10),
              color: Colors.black.withOpacity(0.12),
            ),
          ],
        ),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ready to start your AI journey?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Join the next cohort and get personalised guidance from PieStudy mentors.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      height: 1.5,
                      color: Color(0xFFE5E7EB),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed: () => _openEnrollmentDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _pieGold,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Join Next Cohort',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () => handlePieNavTap(context, 'contact'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white70),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        child: const Text(
                          'Talk to a Mentor',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ready to start your AI journey?',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Join the next cohort and get personalised guidance, projects and mock interviews with StudyGrids mentors.',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13.5,
                            height: 1.5,
                            color: Color(0xFFE5E7EB),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 22),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: () => _openEnrollmentDialog(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Join Next Cohort',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () => handlePieNavTap(context, 'contact'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white70),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                        child: const Text(
                          'Talk to a Mentor',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 13.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
            color: _pieGold.withOpacity(0.14),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(feature.icon, size: 24, color: _pieBlue),
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

class _Program {
  final String title;
  final String description;
  _Program({required this.title, required this.description});
}

/// Our Programs grid – MOBILE PAR CHHOTE CARDS
class _ProgramsGridSlim extends StatelessWidget {
  final bool isMobile;
  final List<_Program> programs;
  const _ProgramsGridSlim({required this.isMobile, required this.programs});

  int _crossAxisCount(double width) {
    if (width < 720) return 1; // mobile: 1 column
    if (width < 1024) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final int crossAxisCount = _crossAxisCount(width);

    // mobile cards ko chhota dikhane ke liye: aspect ratio bada
    final double aspect = isMobile ? 2.5 : 2.4;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: programs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: aspect,
      ),
      itemBuilder: (context, index) {
        final program = programs[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.muted.withOpacity(0.4)),
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
                program.title,
                softWrap: true,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5, // thoda chota
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(
                  program.description,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
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

class _ChipList extends StatelessWidget {
  final bool isMobile;
  final List<String> labels;
  const _ChipList({required this.isMobile, required this.labels});

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
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: _pieBlue.withOpacity(0.15)),
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

class _JourneyStep {
  final int number;
  final String title;
  final String description;

  _JourneyStep({
    required this.number,
    required this.title,
    required this.description,
  });
}

class _JourneyStepCard extends StatelessWidget {
  final _JourneyStep step;
  const _JourneyStepCard({required this.step});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.muted.withOpacity(0.4)),
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
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.orange,
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
import 'package:flutter/material.dart';
import 'package:pie_study/screens/about_us_page.dart';
import 'package:pie_study/screens/b2b_page.dart';
import 'package:pie_study/screens/b2c_page.dart';
import 'package:pie_study/screens/contactus_page.dart';
import 'package:pie_study/screens/faq_page.dart';
import 'package:pie_study/screens/home_page.dart';
import 'package:pie_study/screens/programs_page.dart';
import 'package:pie_study/screens/term&Conditions_page.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/global_floating_button.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart'; 

void main() {
  // ✅ 2. Activate Path Url Strategy (Removes # from URL)
  setPathUrlStrategy();
  
  runApp(const PieStudyApp());
}

class PieStudyApp extends StatelessWidget {
  const PieStudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyGrids',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.bg,
      ),
      
      // ✅ RESPONSIVE FRAMEWORK SETUP START
      // Yeh builder poori app ko wrap karta hai aur screen size detect karta hai.
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          // 0 se 450 px tak MOBILE mana jayega
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          
          // 451 se 800 px tak TABLET
          const Breakpoint(start: 451, end: 800, name: TABLET),
          
          // 801 se 1920 px tak DESKTOP
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          
          // 1921 se upar 4K Screens
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      // ✅ RESPONSIVE FRAMEWORK SETUP END

      initialRoute: '/',
      routes: {
        '/': (_) => const _PageWithFloatingButton(child: PieStudyHomePage()),
        '/programs': (_) => const _PageWithFloatingButton(child: ProgramsPage()),

        // ✅ NEW: B2G -> B2C
        '/b2c': (_) => const _PageWithFloatingButton(child: B2CPage()),
        '/b2b': (_) => const _PageWithFloatingButton(child: B2BPage()),

        // ✅ NEW: Updated Program URLs
        '/program/managers': (_) => const _PageWithFloatingButton(child: AgenticManagersDetailPage()),
        '/program/agentic-ai-training': (_) => const _PageWithFloatingButton(child: AgenticDevelopersDetailPage()),
        '/program/datascience-training': (_) => const _PageWithFloatingButton(child: DataScienceInternshipDetailPage()),
        '/program/datascience-foundation': (_) => const _PageWithFloatingButton(child: DataScienceFoundationDetailPage()),

        // ✅ NEW: About -> About Us
        '/about-us': (_) => const _PageWithFloatingButton(child: PieStudyAboutPage()),

        '/tnc': (_) => const _PageWithFloatingButton(child: TermsAndConditionsPage()),
        '/contact': (_) => const _PageWithFloatingButton(child: ContactUsPage()),
        '/faq': (_) => const _PageWithFloatingButton(child: FaqPage()),
      },
    );
  }
}

class _PageWithFloatingButton extends StatelessWidget {
  final Widget child;
  const _PageWithFloatingButton({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        const GlobalFloatingButton(),
      ],
    );
  }
}

// ✅ Updated Navigation Handler (Global Function)
void handlePieNavTap(BuildContext context, String id) {
  String route = '/';

  switch (id) {
    case 'home':
      route = '/';
      break;

    case 'programs':
      route = '/programs';
      break;

    case 'b2b':
      route = '/b2b';
      break;

    // ✅ FIX: 'b2g', 'b2c', 'verticals' sabhi '/b2c' par jayenge
    case 'b2g': 
    case 'b2c':
    case 'verticals':
      route = '/b2c'; 
      break;

    case 'about':
      route = '/about-us'; 
      break;

    case 'tnc':
      route = '/tnc';
      break;

    case 'contact':
      route = '/contact';
      break;

    case 'faq':
      route = '/faq';
      break;

    // ✅ Footer/Program Links Updated
    case 'managers':
      route = '/program/managers';
      break;

    case 'developers':
      route = '/program/agentic-ai-training';
      break;

    case 'ds_intern':
      route = '/program/datascience-training';
      break;

    case 'ds_foundation':
      route = '/program/datascience-foundation';
      break;

    default:
      route = '/';
  }

  // Prevent pushing same route again
  if (ModalRoute.of(context)?.settings.name == route) return;

  Navigator.of(context).pushNamed(route);
}



// import 'package:flutter/material.dart';
// import 'package:pie_study/screens/about_us_page.dart';
// import 'package:pie_study/screens/b2b_page.dart';
// import 'package:pie_study/screens/b2c_page.dart';
// import 'package:pie_study/screens/faq_page.dart';
// import 'package:pie_study/screens/home_page.dart';
// import 'package:pie_study/screens/programs_page.dart';
// import 'package:pie_study/screens/term&Conditions_page.dart';
// import 'package:pie_study/widgets/app_colors.dart';



// void main() {
//   runApp(const PieStudyApp());
// }

// class PieStudyApp extends StatelessWidget {
//   const PieStudyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PieStudy',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: false,
//         scaffoldBackgroundColor: AppColors.bg,
//       ),
//       // ✅ default page
//       initialRoute: '/',
//       routes: {
//         '/': (_) => const PieStudyHomePage(),
//         '/programs': (_) => const ProgramsPage(),
//          '/b2b': (_) => const B2BPage(),
//          '/b2g': (_) => const B2CPage (),
//         '/about': (_) => const PieStudyAboutPage(),
//         '/tnc': (_) => const TermsAndConditionsPage(),
//         // '/contact': (_) => const ContactScreen(),
//         '/faq': (_) => const FaqPage(), // FAQ footer se open hoga
//       },
//     );
//   }
// }

// /// ✅ Ye function top nav + drawer dono se use hoga
// void handlePieNavTap(BuildContext context, String id) {
//   String route = '/';

//   switch (id) {
//     case 'home':
//       route = '/';
//       break;
//     case 'programs':
//       route = '/programs';
//       break;
//     case 'b2b':
//       route = '/b2b';
//       break;
//     case 'b2g':
//       route = '/b2g';
//       break;
//     case 'about':
//       route = '/about';
//       break;
//     case 'tnc':
//       route = '/tnc';
//       break;
//     case 'contact':
//       route = '/contact';
//       break;
//     default:
//       route = '/';
//   }

//   // already isi route par ho to dobara push nahi karega
//   if (ModalRoute.of(context)?.settings.name == route) return;

//   Navigator.of(context).pushReplacementNamed(route);
// }




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

void main() {
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
      initialRoute: '/',
      routes: {
        '/': (_) => const _PageWithFloatingButton(child: PieStudyHomePage()),
        '/programs': (_) => const _PageWithFloatingButton(child: ProgramsPage()),
        '/b2b': (_) => const _PageWithFloatingButton(child: B2BPage()),
        '/b2g': (_) => const _PageWithFloatingButton(child: B2CPage()),
        '/about': (_) => const _PageWithFloatingButton(child: PieStudyAboutPage()),
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

/// ✅ Ye function top nav + drawer + footer sab ke liye
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

    // B2C/B2G ke liye dono id support: 'b2g' ya 'b2c'
    case 'b2g':
    case 'b2c':
      route = '/b2g';
      break;

    case 'about':
      route = '/about';
      break;

    case 'tnc':
      route = '/tnc';
      break;

    case 'contact':
      route = '/contact';
      break;

    // ✅ Our Verticals ab B2G page dikhayega
    case 'verticals':
      route = '/b2g';
      break;

    // ✅ Footer ke 4 Programs (sab Programs page open karein)
    case 'managers':
    case 'developers':
    case 'ds_intern':
    case 'ds_foundation':
      route = '/programs';
      break;

    // ✅ FAQ ke liye
    case 'faq':
      route = '/faq';
      break;

    default:
      route = '/';
  }


  // already isi route par ho to dobara push nahi karega
if (ModalRoute.of(context)?.settings.name == route) return;

// ✅ normal push: purana page stack me rahega, back arrow chalega
Navigator.of(context).pushNamed(route);

}

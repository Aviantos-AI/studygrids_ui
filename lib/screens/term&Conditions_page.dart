// import 'package:flutter/material.dart';
// import 'package:pie_study/widgets/app_colors.dart';
// import 'package:pie_study/widgets/brand_title.dart';

// class TermsAndConditionsPage extends StatelessWidget {
//   const TermsAndConditionsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const pageBg = Color(0xFFF5F7FB);

//     return Scaffold(
//       backgroundColor: pageBg,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.4,
//         shadowColor: Colors.black12,
//         surfaceTintColor: Colors.transparent,
//         titleSpacing: 0,
//         title: const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: BrandTitle(size: 30),
//           ),
//         ),
//       ),
//       body: Center(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             final maxWidth =
//                 constraints.maxWidth > 1000 ? 1000.0 : constraints.maxWidth;

//             return SingleChildScrollView(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(maxWidth: maxWidth),
//                   child: const _PoliciesBody(),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class _PoliciesBody extends StatelessWidget {
//   const _PoliciesBody();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // PAGE TITLE
//         const Text(
//           'Policies & Terms',
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w800,
//             fontSize: 28,
//             letterSpacing: -0.4,
//             color: Color(0xFF111827),
//           ),
//         ),
//         const SizedBox(height: 6),
//         const Text(
//           'This page summarises how PieStudy EdTech Solutions (“Pie Study”, “we”, “us”) '
//           'collects, uses and protects your data, and the terms under which you use our platform.',
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 14,
//             height: 1.6,
//             color: Color(0xFF6B7280),
//           ),
//         ),
//         const SizedBox(height: 12),
//         Row(
//           children: const [
//             Icon(Icons.info_outline, size: 18, color: Color(0xFF9CA3AF)),
//             SizedBox(width: 6),
//             Text(
//               'Last updated: DD/MM/YYYY • Platform: ',
//               style: TextStyle(
//                 fontFamily: 'Inter',
//                 fontSize: 12,
//                 color: Color(0xFF9CA3AF),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 24),

//         // SECTIONS
//         const _PolicySection(
//           title: '1. Information We Collect',
//           body:
//               'We collect personal information you provide (name, email, phone, address, date of birth if required, '
//               'login credentials and identity verification details when needed). We also collect payment-related '
//               'metadata (transaction IDs, payment status, EMI/loan partner status), learning and usage data '
//               '(courses, progress, tests, attendance, submissions, device info and analytics), technical log data '
//               '(IP address, device/OS, browser, cookies, crash logs) and limited data from third-party logins such as '
//               'Google, WhatsApp, Zoom or LinkedIn (for example name, email and profile picture).',
//         ),
//         const _PolicySection(
//           title: '2. How We Use Your Information',
//           body:
//               'Your data is used to create and manage your account, enrol you into programs, track your learning '
//               'progress, issue certificates and provide support. We personalise recommendations, analyse engagement, '
//               'improve course design, send service and marketing communications (where allowed), and ensure safety, '
//               'fraud prevention and legal compliance on the platform.',
//         ),
//         const _PolicySection(
//           title: '3. Legal Bases for Processing',
//           body:
//               'We process your data based on: (a) your consent (e.g., when you register or accept policies), '
//               '(b) contractual necessity (to deliver programs you enrol in), (c) legal obligation (tax, accounting, '
//               'compliance requirements) and (d) our legitimate interest in improving security, product quality and '
//               'user experience.',
//         ),
//         const _PolicySection(
//           title: '4. How We Share Your Information',
//           body:
//               'We do not sell your personal data. We may share it with trusted service providers such as payment '
//               'gateways, cloud hosting, email/SMS tools, video platforms and analytics providers who follow strict '
//               'confidentiality and security obligations. Limited information may be shared with instructors, academic '
//               'partners and placement/career partners (only with your consent) to run the program and support your '
//               'career outcomes. We may also share data when required by law, court order or government authorities to '
//               'prevent fraud, abuse or harm.',
//         ),
//         const _PolicySection(
//           title: '5. Cookies & Tracking Technologies',
//           body:
//               'We use cookies and similar technologies to keep you logged in, remember preferences, analyse traffic and '
//               'improve recommendations. You can disable cookies in your browser, but some features of the platform may '
//               'not work correctly if you do so.',
//         ),
//         const _PolicySection(
//           title: '6. Data Storage & Security',
//           body:
//               'Your data is stored on secure, encrypted servers with SSL in transit, access controls, monitoring and '
//               'regular reviews. While we follow strong security practices, no online system is 100% secure. You use the '
//               'platform with this understanding and should protect your own login credentials.',
//         ),
//         const _PolicySection(
//           title: '7. Data Retention',
//           body:
//               'We retain your information while your account is active, for as long as necessary to provide services, '
//               'and for periods required by law or regulatory obligations. You can request account or data deletion, '
//               'subject to retention required by applicable law.',
//         ),
//         const _PolicySection(
//           title: '8. Your Rights',
//           body:
//               'Depending on applicable law, you may request access, correction, deletion, restriction, or portability '
//               'of your personal data. You can also opt out of marketing and withdraw consent where processing is based '
//               'on consent. To exercise these rights, contact us at connect@piestudy.com.',
//         ),
//         const _PolicySection(
//           title: '9. Children’s Privacy',
//           body:
//               ' is not intended for children under 18 without parental or guardian consent. If we become aware '
//               'that a minor has registered without proper consent, we may suspend or delete their account and erase '
//               'related personal data, as required by law.',
//         ),
//         const _PolicySection(
//           title: '10. Third-Party Links',
//           body:
//               'Our platform may link to third-party websites and services such as YouTube, social networks or payment '
//               'gateways. We are not responsible for the content, privacy practices or security of those external '
//               'websites. Please review their policies independently before sharing data there.',
//         ),
//         const _PolicySection(
//           title: '11. International Users',
//           body:
//               'If you access  from outside India, your data may be stored or processed on servers located in '
//               'India or other countries. By using the platform, you consent to such cross-border data transfers where '
//               'required for service delivery and lawful processing.',
//         ),
//         const _PolicySection(
//           title: '12. Changes to this Policy',
//           body:
//               'We may update these policies from time to time. Updated versions will be posted on this page with a new '
//               '“Last Updated” date. Continued use of  after changes become effective means you accept the '
//               'revised terms.',
//         ),
//         const _PolicySection(
//           title: '13. Contact & Jurisdiction',
//           body:
//               'For any questions, concerns, complaints or data-related requests, you can reach us at:\n\n'
//               'PieStudy EdTech Solutions\n'
//               'Email: connect@piestudy.com\n'
//               'Website: www.piestudy.com\n'
//               'Jurisdiction: Goa & Bengaluru, India.',
//         ),
//       ],
//     );
//   }
// }

// class _PolicySection extends StatelessWidget {
//   final String title;
//   final String body;

//   const _PolicySection({
//     required this.title,
//     required this.body,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 18),
//       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: const Color(0xFFE5E7EB)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Bold heading
//           Text(
//             title,
//             style: const TextStyle(
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w700,
//               fontSize: 15,
//               color: Color(0xFF111827),
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             body,
//             style: const TextStyle(
//               fontFamily: 'Inter',
//               fontSize: 13,
//               height: 1.6,
//               color: Color(0xFF4B5563),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:pie_study/main.dart';
import 'package:pie_study/screens/Data_science_internship_page.dart';
import 'package:pie_study/screens/agentic_ai_developer_page.dart';
import 'package:pie_study/screens/agentic_ai_manager_program.dart';
import 'package:pie_study/screens/data_science_course_page.dart';
import 'package:pie_study/screens/main_navigation.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/brand_title.dart';
import 'package:pie_study/widgets/pie_footer.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const pageBg = Color(0xFFF5F7FB);
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: pageBg,

      endDrawer: Drawer(
        child: PieNavDrawer(
          activeId: 'tnc',
          onItemTap: (id) {
            Navigator.pop(context);
            handlePieNavTap(context, id);
          },
        ),
      ),

      appBar: AppBar(
        leading: const BackButton(color: Colors.black87),
        backgroundColor: Colors.white.withOpacity(0.96),
        elevation: 0.4,
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        toolbarHeight: 68,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: PieTopNav(
            onItemTap: (id) => handlePieNavTap(context, id),
            activeId: 'tnc',
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

 body: SingleChildScrollView(
  child: Column(
    children: [
      Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth > 1000 ? 1000.0 : constraints.maxWidth;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: const _PoliciesBody(),
                ),
              ),
            );
          },
        ),
      ),

      // ⬇️ FOOTER scrollable ho jayega
      PieFooter(
        onProgramTap: (id) {
          /* same code */
        },
        onAboutTap: () => handlePieNavTap(context, 'about'),
        onVerticalsTap: () => handlePieNavTap(context, 'verticals'),
        onBlogTap: () => handlePieNavTap(context, 'tnc'),
        onFaqTap: () => handlePieNavTap(context, 'faq'),
        onEmailTap: () {},
        onPhoneTap: () {},
      ),
    ],
  ),
),

    );
  }
}

/* ================= BODY ================= */

class _PoliciesBody extends StatelessWidget {
  const _PoliciesBody();

  @override
  Widget build(BuildContext context) {
    final privacyItems = _PolicyData.privacySections;
    final termsItems = _PolicyData.termsSections;
    final refundItems = _PolicyData.refundSections;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Policies & Terms',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 28,
            letterSpacing: -0.4,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'How StudyGrids EdTech Solutions (“Study Grids”, “we”, “us”) collects and uses your data, '
          'and the terms under which you use our platform.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            height: 1.6,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.info_outline, size: 18, color: Color(0xFF9CA3AF)),
            const SizedBox(width: 6),
            Expanded(
              child: const Text(
                'Last updated: 11/11/2025 • Platform: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),

        // ---------- PRIVACY POLICY -----------
        const Text(
          'Privacy Policy',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'These points explain how your personal data is collected, processed and protected when '
          'you use .',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            height: 1.6,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 16),
        ...privacyItems.map(
          (item) => _PolicyTile(
            title: item.title,
            body: item.body,
          ),
        ),

        const SizedBox(height: 28),

        // ---------- TERMS & CONDITIONS -----------
        const Text(
          'Terms & Conditions',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'These Terms control your use of the  website, app, courses and services. '
          'By registering or using the Platform you agree to all the clauses below.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            height: 1.6,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 16),
        ...termsItems.map(
          (item) => _PolicyTile(
            title: item.title,
            body: item.body,
          ),
        ),

        const SizedBox(height: 28),

        // ---------- REFUND & CANCELLATION POLICY -----------
        const Text(
          'Refund & Cancellation Policy',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'This section explains when learners may request refunds, cancellations or course changes.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            height: 1.6,
            color: Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 16),
        ...refundItems.map(
          (item) => _PolicyTile(
            title: item.title,
            body: item.body,
          ),
        ),
      ],
    );
  }
}

/* ================= ACCORDION TILE ================= */

class _PolicyTile extends StatelessWidget {
  final String title;
  final String body;

  const _PolicyTile({
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(15, 23, 42, 0.03),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: const Color.fromRGBO(15, 23, 42, 0.04),
          highlightColor: const Color.fromRGBO(15, 23, 42, 0.04),
        ),
        child: ExpansionTile(
          tilePadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          childrenPadding:
              const EdgeInsets.fromLTRB(16, 0, 16, 14),
          iconColor: AppColors.gold,
          collapsedIconColor: const Color(0xFF9CA3AF),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700, // heading more bold
              fontSize: 14.5,
              color: Color(0xFF111827),
            ),
          ),
          children: [
            Text(
              body,
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
    );
  }
}

/* ================= DATA MODEL ================= */

class _PolicyItem {
  final String title;
  final String body;

  const _PolicyItem({
    required this.title,
    required this.body,
  });
}

class _PolicyData {
  /// Privacy policy sections (based on PRIVACY POLICY document).
  static const List<_PolicyItem> privacySections = [
    _PolicyItem(
      title: '1. Information We Collect',
      body:
          'We collect personal details you provide (such as name, email, phone, address, and date of birth where needed), '
          'account and login details, payment and transaction information, learning activity data (courses enrolled, '
          'progress, assessments, attendance, feedback), device and technical information (IP address, browser, OS, '
          'cookies, crash logs), and limited data from third-party logins such as Google, WhatsApp, Zoom or LinkedIn. '
          'We only collect what is necessary to operate and improve the platform.',
    ),
    _PolicyItem(
      title: '2. How We Use Your Information',
      body:
          'Your data is used to create and manage your account, enrol you in programs, track progress, issue certificates, '
          'and provide support. We also use it to personalise content and recommendations, analyse engagement, improve '
          'course quality, send important service communications, and (where permitted) send updates and marketing about '
          'relevant programs. Data may be used to monitor fraud, security incidents and to comply with legal obligations.',
    ),
    _PolicyItem(
      title: '3. Legal Bases for Processing',
      body:
          'We process your data where it is necessary to perform a contract with you (delivery of courses/services), '
          'where you have given consent (for example marketing or optional integrations), where we must comply with legal '
          'requirements (tax, accounting, regulatory), and where we have a legitimate interest in improving platform '
          'security, preventing misuse, and enhancing learning outcomes.',
    ),
    _PolicyItem(
      title: '4. Sharing of Information',
      body:
          'Your personal data is never sold. It may be shared only with trusted service providers such as hosting/cloud '
          'partners, payment gateways, email/SMS tools, analytics services, video-conferencing tools, instructors and '
          'career/placement partners who help us run the programs. These parties are bound by confidentiality and data '
          'protection obligations. We may also share information if required by law, court order, or to prevent fraud or harm.',
    ),
    _PolicyItem(
      title: '5. Cookies & Tracking Technologies',
      body:
          'We use cookies and similar technologies to keep you signed in, remember preferences, measure traffic and '
          'improve user experience. You can manage cookies through your browser settings, but disabling them may impact '
          'some features such as login persistence or personalised recommendations.',
    ),
    _PolicyItem(
      title: '6. Data Storage & Security',
      body:
          'Data is stored on secure servers with encryption in transit, access control, logging and periodic security '
          'reviews. While we take reasonable technical and organisational measures, no online service can be 100% secure. '
          'You are responsible for maintaining the confidentiality of your credentials and for logging out on shared devices.',
    ),
    _PolicyItem(
      title: '7. Data Retention',
      body:
          'We retain personal data for as long as necessary to provide services, maintain records, meet legal or regulatory '
          'requirements and resolve disputes. When data is no longer required, we delete or anonymise it. You may request '
          'deletion or closure of your account; certain information may still be kept where law requires retention.',
    ),
    _PolicyItem(
      title: '8. Your Rights',
      body:
          'Subject to applicable law, you may request access to your data, ask for corrections, request deletion, restrict '
          'processing, export certain data, or object to specific uses such as direct marketing. You may also withdraw '
          'consent where processing is based on consent. To exercise your rights, contact us via the official support email.',
    ),
    _PolicyItem(
      title: '9. Children’s Privacy',
      body:
          'The platform is primarily intended for adults and learners 18+ years of age. Learners under 18 should use the '
          'platform only with the knowledge and consent of a parent or legal guardian. If we discover that a minor has '
          'used the platform without proper consent, we may limit or delete the account and remove associated data.',
    ),
    _PolicyItem(
      title: '10. Third-Party Links & Integrations',
      body:
          ' may embed or integrate third-party services such as YouTube, Zoom, external websites or social media. '
          'We are not responsible for the content, privacy practices or security of those third-party services. You should '
          'review their policies separately before sharing any data with them.',
    ),
    _PolicyItem(
      title: '11. International Data Transfers',
      body:
          'If you access the platform from outside India, your information may still be processed or stored on servers '
          'located in India or other jurisdictions. By using the platform you consent to such transfers, where permitted '
          'by law, for the purpose of providing services and operating the platform.',
    ),
    _PolicyItem(
      title: '12. Updates to the Privacy Policy',
      body:
          'We may update this Privacy Policy periodically to reflect changes in laws, technology or our services. The '
          'latest version will always be available on this page with an updated “Last Updated” date. Your continued use of '
          ' after changes take effect will be treated as acceptance of the revised policy.',
    ),
    _PolicyItem(
      title: '13. Contact for Privacy Queries',
      body:
          'For questions, concerns or requests relating to privacy and data protection, you can contact StudyGrids EdTech '
          'Solutions at connect@studygrids.com. We will review and respond within a reasonable timeframe as required by law.',
    ),
  ];

  /// Terms & Conditions sections (based on TERMS & CONDITIONS document).
  static const List<_PolicyItem> termsSections = [
    _PolicyItem(
      title: '1. Definitions',
      body:
          '“Platform” refers to the  website, app, LMS and all related digital properties. “User / Learner / '
          'Student” means any person accessing or registering on the platform. “Instructor / Mentor” refers to experts '
          'delivering content via . “Content” includes videos, documents, assignments, quizzes, projects, code '
          'files and all learning material. “Services” include courses, bootcamps, live classes, mentorship, assessments, '
          'career services, placement support and certificates.',
    ),
    _PolicyItem(
      title: '2. Acceptance of Terms',
      body:
          'By visiting, registering, purchasing or using any part of the Platform, you confirm that you have read and '
          'accepted these Terms, our Privacy Policy, Refund Policy, Honor Code and any other policies displayed on the '
          'Platform. If you do not agree, you must stop using . We may update the Terms from time to time, and '
          'continued use after updates constitutes acceptance of the revised Terms.',
    ),
    _PolicyItem(
      title: '3. Eligibility & Account Registration',
      body:
          'You must be at least 18 years old, or use the platform under parental/guardian supervision. You agree to '
          'provide accurate, complete information during registration and not to impersonate any person or organisation. '
          'Creating multiple accounts to misuse offers, trials or content is prohibited. We may refuse registration or '
          'terminate accounts that violate these conditions.',
    ),
    _PolicyItem(
      title: '4. Account Security',
      body:
          'You are solely responsible for maintaining the confidentiality of your login credentials and for all activity '
          'under your account. Do not share your password or account access with others. Unauthorised sharing, resale or '
          'misuse of accounts may lead to immediate suspension or termination without refund.',
    ),
    _PolicyItem(
      title: '5. Services Provided',
      body:
          'Depending on the program,  may provide self-paced online courses, live cohort-based programs, '
          'bootcamps, workshops, downloadable resources (where permitted), assignments, quizzes, projects, mentorship, '
          'doubt-clearing sessions, community access, career and placement support, and certificates. We may modify or '
          'discontinue any service, feature or course at our discretion.',
    ),
    _PolicyItem(
      title: '6. License to Use ',
      body:
          'When you purchase or enrol in a course/program, you receive a limited, non-exclusive, non-transferable license '
          'to access the content for your personal learning only. You must not copy, record, download, re-upload, share, '
          'sell, rent or sublicense the content, or use it for teaching or commercial purposes. Attempts to bypass security '
          'or access controls may result in termination and legal action.',
    ),
    _PolicyItem(
      title: '7. Access Duration',
      body:
          'Access durations vary by program type. Self-paced courses may have fixed-period or lifetime access. Live cohort '
          'programs are typically accessible during the program duration. Bootcamps and workshops usually have limited '
          'access windows. Subscription-based plans remain active until the subscription expires or is cancelled. We may '
          'update, replace or remove content over time for quality or compliance reasons.',
    ),
    _PolicyItem(
      title: '8. Payments, Pricing & Taxes',
      body:
          'All prices are normally listed in INR unless stated otherwise and may change at any time. Accepted payment '
          'methods include UPI, cards, net banking, wallets, EMI and financing partners. Taxes and payment gateway charges '
          'may apply. EMI/loan offerings are governed by the respective financing partner’s terms. Fraudulent or disputed '
          'payments may result in suspension and possible legal action.',
    ),
    _PolicyItem(
      title: '9. Refund & Cancellation Policy',
      body:
          'Refunds follow StudyGrids official Refund & Cancellation Policy. Generally, refunds are not provided once a '
          'program has started, for live cohort or bootcamp programs, for completed or partially completed modules, for '
          'certification/placement programs, for no-shows or change of mind, or for payments made via loan/financing '
          'partners. Any exceptions are purely at the Company’s sole discretion.',
    ),
    _PolicyItem(
      title: '10. Course Content, Updates & Changes',
      body:
          'To maintain academic quality, we may update curricula, replace lessons, add or remove instructors, modify '
          'assessment methods, and restructure or discontinue specific modules. Users are not entitled to earlier versions '
          'of content or to content that has been removed or replaced.',
    ),
    _PolicyItem(
      title: '11. User Code of Conduct',
      body:
          'You agree not to harass instructors, mentors or learners; not to use abusive, hateful or discriminatory language; '
          'not to cheat in assignments or exams; not to upload offensive, illegal or plagiarised material; and not to '
          'disrupt live sessions or spam communities. Sharing recordings or internal content outside the platform is '
          'prohibited. Violations may result in permanent suspension without refund.',
    ),
    _PolicyItem(
      title: '12. Intellectual Property Rights',
      body:
          'All content on the Platform is owned by StudyGrids EdTech Solutions or licensed from instructors and partners. '
          'Enrolment gives you limited usage rights only; it does not transfer ownership. Unauthorised copying, recording, '
          'distribution or derivative use of the content is strictly prohibited and may violate Indian copyright law.',
    ),
    _PolicyItem(
      title: '13. User-Generated Content',
      body:
          'By submitting assignments, projects, feedback, comments or any other content, you grant  a worldwide, '
          'royalty-free license to use, reproduce, display and promote such content for educational or marketing purposes. '
          'You confirm you have necessary rights to the content and that it does not infringe the rights of others. We may '
          'remove any content that is illegal, offensive or violates these Terms.',
    ),
    _PolicyItem(
      title: '14. Assessments, Projects & Certification',
      body:
          'Certificates of completion or achievement may be awarded only if you meet program criteria, including completing '
          'required modules, passing assessments, and following academic integrity standards. Certificates do not amount to '
          'a formal degree or diploma unless clearly mentioned and backed by an authorised academic body.',
    ),
    _PolicyItem(
      title: '15. Career & Placement Services (Disclaimer)',
      body:
          'Career-related offerings such as resume reviews, interview preparation, mock interviews, job referrals and '
          'hiring drives are support services only.  does not guarantee job placement, interviews, salary levels '
          'or career outcomes. You remain solely responsible for your job search and employment decisions.',
    ),
    _PolicyItem(
      title: '16. Third-Party Services',
      body:
          'The Platform may integrate with third-party services such as Zoom, WhatsApp, Google, payment gateways and LMS '
          'tools. While we choose reputable partners, we are not responsible for their availability, performance, privacy '
          'practices or misuse. Use of third-party services is at your own risk and subject to their separate terms.',
    ),
    _PolicyItem(
      title: '17. Service Interruptions',
      body:
          'We strive for high availability but do not guarantee uninterrupted service. Access may be affected by '
          'maintenance, internet or power issues, server problems, cyber incidents, third-party downtime or technical '
          'glitches. StudyGrids is not liable for any loss, delay or inconvenience arising from such interruptions.',
    ),
    _PolicyItem(
      title: '18. Limitation of Liability',
      body:
          'To the maximum extent permitted by law, StudyGrids is not liable for indirect, incidental, special, consequential '
          'or punitive damages, including loss of income, data, business opportunities or anticipated benefits. In any '
          'case, our total liability will not exceed the amount actually paid by you for the specific program giving rise '
          'to the claim. You use the Platform at your own risk.',
    ),
    _PolicyItem(
      title: '19. Indemnity',
      body:
          'You agree to indemnify and hold StudyGrids EdTech Solutions, its directors, employees, instructors and partners '
          'harmless from claims, losses, damages, liabilities and expenses arising from your violation of these Terms, '
          'misuse of the Platform, illegal activities, or infringement of any third-party rights.',
    ),
    _PolicyItem(
      title: '20. Termination or Suspension',
      body:
          'We may suspend or terminate your access immediately, with or without notice, if you violate these Terms, engage '
          'in fraud, misuse content, dispute or reverse payments, harm the community, or remain inactive in certain '
          'programs where activity is mandatory. Termination is usually without refund unless required by law.',
    ),
    _PolicyItem(
      title: '21. Governing Law & Jurisdiction',
      body:
          'These Terms are governed by the laws of India. All disputes, claims or proceedings shall be subject to the '
          'exclusive jurisdiction of the competent courts in Goa or Bengaluru, India.',
    ),
    _PolicyItem(
      title: '22. Changes to Terms',
      body:
          'StudyGrids may revise these Terms at any time. Updated versions will be posted on the Platform and become '
          'effective immediately unless stated otherwise. By continuing to use the Platform after updates, you agree to be '
          'bound by the revised Terms.',
    ),
    _PolicyItem(
      title: '23. Contact Information',
      body:
          'For any questions, feedback, disputes or legal concerns regarding these Terms, you can contact:\n\n'
          'StudyGrids EdTech Solutions\n'
          'Email: connect@studygrids.com\n'
          'Website: www.studygrids.com\n'
          'Jurisdiction: Goa & Bengaluru, India.',
    ),
  ];

  /// Refund & Cancellation Policy sections (based on Refund Policy document).
  static const List<_PolicyItem> refundSections = [
    _PolicyItem(
      title: '1. General Refund Principles',
      body:
          'Refunds are processed only as per this Refund & Cancellation Policy and applicable laws. All refund requests '
          'must be submitted in writing to connect@studygrids.com, with details of the course, payment and reason. Approved '
          'refunds are usually processed to the original payment method within 7–14 working days. Payment gateway charges, '
          'convenience fees and taxes are generally non-refundable. StudyGrids may reject requests that do not meet the '
          'eligibility criteria described below.',
    ),
    _PolicyItem(
      title: '2. Self-Paced Courses (Pre-recorded Content)',
      body:
          'For self-paced or pre-recorded courses, refunds may be available within 7 days of purchase only if less than '
          '10% of the total content has been accessed or viewed. If more than 10% of the content is accessed, or if '
          'downloadable materials have been used, the program is considered consumed and no refund will be provided.',
    ),
    _PolicyItem(
      title: '3. Live Cohort-Based / Instructor-Led Programs',
      body:
          'Live cohort and instructor-led programs involve live faculty, limited seats and operational costs. Refund rules '
          'typically apply as follows:\n\n'
          '• Within 7 days of enrolment AND before the first live class: up to 100% refund (minus payment gateway fees).\n'
          '• After attending 1 live session: up to 50% refund.\n'
          '• After attending 2 or more live sessions: no refund.\n\n'
          'Exact percentages may vary by program and will be specified at the time of enrolment.',
    ),
    _PolicyItem(
      title: '4. Placement-Assisted / Job Guarantee Programs',
      body:
          'Placement-oriented or job guarantee programs involve extensive setup such as onboarding, mentorship, resume '
          'building, mock interviews, LMS configuration and career support. Typically:\n\n'
          '• Full refund may be available if requested within 7 days of enrolment and before any onboarding activity.\n'
          '• Partial refund (for example 50%) may be available if onboarding has started but no live class is attended.\n'
          '• No refund is provided after the first live class, first mentorship session, career services kickoff, or when '
          'more than 10% of content is accessed.\n\n'
          'Program-specific terms communicated at the time of admission will prevail.',
    ),
    _PolicyItem(
      title: '5. EMI / Loan-Based Purchases',
      body:
          'Where enrolment is financed through EMI, BNPL or third-party loan partners, refunds (if permitted) will be '
          'processed only after necessary coordination with the learner and the lender. StudyGrids cannot directly cancel, '
          'stop or modify EMIs; this is controlled by the financing partner. Any interest, penalties or charges levied by '
          'the lender are non-refundable and beyond StudyGrids control.',
    ),
    _PolicyItem(
      title: '6. Course Cancellation by StudyGrids',
      body:
          'If StudyGrids cancels or significantly postpones a batch or program due to reasons such as low enrolments, '
          'faculty unavailability or operational issues, learners will be offered either a full refund or an option to '
          'transfer to another batch/program of comparable value, subject to seat availability. The decision communicated '
          'by StudyGrids in such cases will be final.',
    ),
    _PolicyItem(
      title: '7. Batch Change / Program Rescheduling',
      body:
          'Learners may request a change of batch or rescheduling before the batch starts, usually without additional '
          'charges, subject to availability. After commencement, only limited one-time rescheduling may be allowed with a '
          'nominal administrative fee. Batch change requests do not normally qualify for a refund.',
    ),
    _PolicyItem(
      title: '8. Duplicate Payments',
      body:
          'If a payment is accidentally made twice for the same program, the extra amount will be refunded in full after '
          'verification with the payment gateway or bank. Processing typically takes 5–10 business days from successful '
          'verification.',
    ),
    _PolicyItem(
      title: '9. No-Show Policy',
      body:
          'If a learner does not attend live classes, orientation, onboarding or mentoring sessions (no-show), this does '
          'not qualify as a ground for refund. Access to recordings or self-paced content, where applicable, may still be '
          'available but no credit, extension or compensation is guaranteed.',
    ),
    _PolicyItem(
      title: '10. Digital Products & Downloads',
      body:
          'Digital items such as eBooks, PDFs, slide decks, downloadable templates, code files, certification vouchers and '
          'credits for AI tools or integrated partner software are non-refundable once delivered or accessed, except where '
          'mandated by law.',
    ),
    _PolicyItem(
      title: '11. Misuse, Policy Violation or Abuse',
      body:
          'StudyGrids may deny refunds and may terminate access if there is evidence of policy violations, including but '
          'not limited to excessive streaming or downloading, credential sharing, account resale, plagiarism, cheating, '
          'abusive behaviour or any attempt to reverse engineer or misuse the platform. In such cases, access may be '
          'revoked without any refund.',
    ),
    _PolicyItem(
      title: '12. Contact for Refund & Cancellation Requests',
      body:
          'All refund, cancellation or batch change requests must be made in writing to:\n\n'
          'Email: connect@studygrids.com\n'
          'Operating Entity: StudyGrids EdTech Solutions\n'
          'Jurisdiction: Goa / Bengaluru (as applicable)\n\n'
          'Requests will be reviewed in line with this policy and applicable law, and outcomes will be communicated to you '
          'via email.',
    ),
  ];
}

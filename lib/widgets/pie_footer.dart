


// import 'package:flutter/material.dart';

// // Brand colors
// const Color _pieBlue = Color(0xFF0B3558); // logo blue
// const Color _pieGold = Color(0xFFFDB515); // logo gold
// const Color _pieorange = Color(0xFFFF7021); // lighter blue

// class PieFooter extends StatelessWidget {
//   /// Programs section ke liye: id -> 'managers', 'developers', 'ds_intern', 'ds_foundation'
//   final void Function(String programId)? onProgramTap;

//   /// FAQ link
//   final VoidCallback? onFaqTap;

//   /// Company links
//   final VoidCallback? onAboutTap;
//   final VoidCallback? onVerticalsTap;
//   final VoidCallback? onBlogTap; // <- isse ab T&C open karo

//   /// Contact actions
//   final VoidCallback? onEmailTap;
//   final VoidCallback? onPhoneTap;

//   const PieFooter({
//     super.key,
//     this.onProgramTap,
//     this.onFaqTap,
//     this.onAboutTap,
//     this.onVerticalsTap,
//     this.onBlogTap,
//     this.onEmailTap,
//     this.onPhoneTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: _pieBlue,
//         border: Border(
//           top: BorderSide(
//             color: Color(0x33FDB515), // subtle gold line
//             width: 1,
//           ),
//         ),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final isWide = constraints.maxWidth >= 900;
//           final maxWidth =
//               constraints.maxWidth > 1200 ? 1200.0 : constraints.maxWidth;

//           return Center(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(maxWidth: maxWidth),
//               child: isWide
//                   ? Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Expanded(
//                           flex: 3,
//                           child: _FooterBrandSection(),
//                         ),
//                         const SizedBox(width: 32),
//                         Expanded(
//                           flex: 2,
//                           child: _FooterProgramsSection(
//                             onProgramTap: onProgramTap,
//                           ),
//                         ),
//                         const SizedBox(width: 32),
//                         Expanded(
//                           flex: 2,
//                           child: _FooterCompanySection(
//                             onFaqTap: onFaqTap,
//                             onAboutTap: onAboutTap,
//                             onVerticalsTap: onVerticalsTap,
//                             onBlogTap: onBlogTap,
//                           ),
//                         ),
//                         const SizedBox(width: 32),
//                         Expanded(
//                           flex: 2,
//                           child: _FooterContactSection(
//                             onEmailTap: onEmailTap,
//                             onPhoneTap: onPhoneTap,
//                           ),
//                         ),
//                       ],
//                     )
//                   : Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const _FooterBrandSection(),
//                         const SizedBox(height: 24),
//                         _FooterProgramsSection(onProgramTap: onProgramTap),
//                         const SizedBox(height: 20),
//                         _FooterCompanySection(
//                           onFaqTap: onFaqTap,
//                           onAboutTap: onAboutTap,
//                           onVerticalsTap: onVerticalsTap,
//                           onBlogTap: onBlogTap,
//                         ),
//                         const SizedBox(height: 20),
//                         _FooterContactSection(
//                           onEmailTap: onEmailTap,
//                           onPhoneTap: onPhoneTap,
//                         ),
//                       ],
//                     ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// /* --------- BRAND COLUMN --------- */

// class _FooterBrandSection extends StatelessWidget {
//   const _FooterBrandSection();

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: 320),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // PieStudy brand (Pie white, Study gold)
//           RichText(
//             text: const TextSpan(
//               children: [
//                 TextSpan(
//                   text: 'Study',
//                   style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w800,
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 TextSpan(
//                   text: ' Grids',
//                   style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w800,
//                     fontSize: 20,
//                     color: Color(0xFFFF7021),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             'Empowering India with AI skills for the future workforce through practical, outcome-driven learning.',
//             style: TextStyle(
//               fontFamily: 'Inter',
//               fontSize: 13,
//               height: 1.6,
//               color: Color(0xFFE5E7EB),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             '© StudyGrids ${DateTime.now().year}. All rights reserved.',
//             style: const TextStyle(
//               fontFamily: 'Inter',
//               fontSize: 11.5,
//               color: Color(0xFF9CA3AF),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /* --------- PROGRAMS (clickable) --------- */

// class _FooterProgramsSection extends StatelessWidget {
//   final void Function(String programId)? onProgramTap;

//   const _FooterProgramsSection({this.onProgramTap});

//   @override
//   Widget build(BuildContext context) {
//     final items = [
//       ('Agentic AI for Managers', 'managers'),
//       ('Agentic AI for Developers', 'developers'),
//       ('Data Science + Internship', 'ds_intern'),
//       ('Data Science Foundation', 'ds_foundation'),
//     ];

//     return _FooterColumn(
//       title: 'Programs',
//       children: items
//           .map(
//             (e) => _FooterLink(
//               label: e.$1,
//               onTap: () => onProgramTap?.call(e.$2),
//             ),
//           )
//           .toList(),
//     );
//   }
// }

// /* --------- COMPANY (FAQ + others clickable) --------- */

// class _FooterCompanySection extends StatelessWidget {
//   final VoidCallback? onFaqTap;
//   final VoidCallback? onAboutTap;
//   final VoidCallback? onVerticalsTap;
//   final VoidCallback? onBlogTap; // <- ab T&C ke liye

//   const _FooterCompanySection({
//     this.onFaqTap,
//     this.onAboutTap,
//     this.onVerticalsTap,
//     this.onBlogTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return _FooterColumn(
//       title: 'Company',
//       children: [
//         _FooterPlainText(
//           'About Us',
//           onTap: onAboutTap,
//         ),
//         _FooterPlainText(
//           'Our Verticals',
//           onTap: onVerticalsTap,
//         ),
//         _FooterPlainText(
//           'Terms & Conditions', // 🔁 yahan change
//           onTap: onBlogTap,
//         ),
//         _FooterLink(
//           label: 'FAQ',
//           onTap: onFaqTap,
//         ),
//       ],
//     );
//   }
// }

// /* --------- CONTACT (clickable email & phone) --------- */

// class _FooterContactSection extends StatelessWidget {
//   final VoidCallback? onEmailTap;
//   final VoidCallback? onPhoneTap;

//   const _FooterContactSection({
//     this.onEmailTap,
//     this.onPhoneTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Contact',
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w700,
//             fontSize: 14,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 10),
//         _FooterContactRow(
//           icon: Icons.email_outlined,
//           text: 'connect@studygrids.com',
//           onTap: onEmailTap,
//         ),
//         const SizedBox(height: 6),
//         _FooterContactRow(
//           icon: Icons.phone_outlined,
//           text: '+91- 9309758526',
//           onTap: onPhoneTap,
//         ),
//       ],
//     );
//   }
// }

// class _FooterContactRow extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final VoidCallback? onTap;

//   const _FooterContactRow({
//     required this.icon,
//     required this.text,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final row = Row(
//       children: [
//         Icon(
//           icon,
//           size: 16,
//           color: _pieorange,
//         ),
//         const SizedBox(width: 8),
//         Flexible(
//           child: Text(
//             text,
//             style: const TextStyle(
//               fontFamily: 'Inter',
//               fontSize: 13,
//               color: Color(0xFFE5E7EB),
//             ),
//           ),
//         ),
//       ],
//     );

//     if (onTap == null) return row;

//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(4),
//       child: row,
//     );
//   }
// }

// /* --------- GENERIC COLUMN / LINK WIDGETS --------- */

// class _FooterColumn extends StatelessWidget {
//   final String title;
//   final List<Widget> children;

//   const _FooterColumn({
//     required this.title,
//     required this.children,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: 260),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w700,
//               fontSize: 14,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 10),
//           ...children,
//         ],
//       ),
//     );
//   }
// }

// class _FooterPlainText extends StatelessWidget {
//   final String label;
//   final VoidCallback? onTap;
//   const _FooterPlainText(this.label, {this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final text = Text(
//       label,
//       // style: const TextStyle(
//       //   fontFamily: 'Inter',
//       //   fontSize: 13,
//       //   color: _pieGold,
//       //   decorationColor: _pieGold,
//       // ),
//         style: const TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 13,
//             color: _pieorange,
//             fontWeight: FontWeight.w600,
//             decoration: TextDecoration.underline,
//             decorationColor: _pieorange,
//           ),
//     );

//     if (onTap == null) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 6),
//         child: text,
//       );
//     }

//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(4),
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 6, top: 2),
//         child: text,
//       ),
//     );
//   }
// }

// class _FooterLink extends StatelessWidget {
//   final String label;
//   final VoidCallback? onTap;

//   const _FooterLink({
//     required this.label,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(4),
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 6, top: 2),
//         child: Text(
//           label,
//           style: const TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 13,
//             color: _pieorange,
//             fontWeight: FontWeight.w600,
//             decoration: TextDecoration.underline,
//             decorationColor: _pieorange,
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // ✅ NEW PACKAGE IMPORT

// Brand colors
const Color _pieBlue = Color(0xFF0B3558); // logo blue
const Color _pieGold = Color(0xFFFDB515); // logo gold
const Color _pieorange = Color(0xFFFF7021); // lighter blue

class PieFooter extends StatelessWidget {
  /// Programs section ke liye: id -> 'managers', 'developers', 'ds_intern', 'ds_foundation'
  final void Function(String programId)? onProgramTap;

  /// FAQ link
  final VoidCallback? onFaqTap;

  /// Company links
  final VoidCallback? onAboutTap;
  final VoidCallback? onVerticalsTap;
  final VoidCallback? onBlogTap; // <- isse ab T&C open karo

  /// Contact actions
  final VoidCallback? onEmailTap;
  final VoidCallback? onPhoneTap;

  const PieFooter({
    super.key,
    this.onProgramTap,
    this.onFaqTap,
    this.onAboutTap,
    this.onVerticalsTap,
    this.onBlogTap,
    this.onEmailTap,
    this.onPhoneTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _pieBlue,
        border: Border(
          top: BorderSide(
            color: Color(0x33FDB515), // subtle gold line
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;
          final maxWidth =
              constraints.maxWidth > 1200 ? 1200.0 : constraints.maxWidth;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 3,
                          child: _FooterBrandSection(),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 2,
                          child: _FooterProgramsSection(
                            onProgramTap: onProgramTap,
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 2,
                          child: _FooterCompanySection(
                            onFaqTap: onFaqTap,
                            onAboutTap: onAboutTap,
                            onVerticalsTap: onVerticalsTap,
                            onBlogTap: onBlogTap,
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 2,
                          child: _FooterContactSection(
                            onEmailTap: onEmailTap,
                            onPhoneTap: onPhoneTap,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _FooterBrandSection(),
                        const SizedBox(height: 24),
                        _FooterProgramsSection(onProgramTap: onProgramTap),
                        const SizedBox(height: 20),
                        _FooterCompanySection(
                          onFaqTap: onFaqTap,
                          onAboutTap: onAboutTap,
                          onVerticalsTap: onVerticalsTap,
                          onBlogTap: onBlogTap,
                        ),
                        const SizedBox(height: 20),
                        _FooterContactSection(
                          onEmailTap: onEmailTap,
                          onPhoneTap: onPhoneTap,
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

/* --------- BRAND COLUMN --------- */

class _FooterBrandSection extends StatelessWidget {
  const _FooterBrandSection();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PieStudy brand (Pie white, Study gold)
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Study',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: ' Grids',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Color(0xFFFF7021),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Empowering India with AI skills for the future workforce through practical, outcome-driven learning.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              height: 1.6,
              color: Color(0xFFE5E7EB),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '© StudyGrids ${DateTime.now().year}. All rights reserved.',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 11.5,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}

/* --------- PROGRAMS (clickable) --------- */

class _FooterProgramsSection extends StatelessWidget {
  final void Function(String programId)? onProgramTap;

  const _FooterProgramsSection({this.onProgramTap});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Agentic AI for Managers', 'managers'),
      ('Agentic AI for Developers', 'developers'),
      ('Data Science + Internship', 'ds_intern'),
      ('Data Science Foundation', 'ds_foundation'),
    ];

    return _FooterColumn(
      title: 'Programs',
      children: items
          .map(
            (e) => _FooterLink(
              label: e.$1,
              onTap: () => onProgramTap?.call(e.$2),
            ),
          )
          .toList(),
    );
  }
}

/* --------- COMPANY (FAQ + others clickable) --------- */

class _FooterCompanySection extends StatelessWidget {
  final VoidCallback? onFaqTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onVerticalsTap;
  final VoidCallback? onBlogTap; // <- ab T&C ke liye

  const _FooterCompanySection({
    this.onFaqTap,
    this.onAboutTap,
    this.onVerticalsTap,
    this.onBlogTap,
  });

  @override
  Widget build(BuildContext context) {
    return _FooterColumn(
      title: 'Company',
      children: [
        _FooterPlainText(
          'About Us',
          onTap: onAboutTap,
        ),
        _FooterPlainText(
          'Our Verticals',
          onTap: onVerticalsTap,
        ),
        _FooterPlainText(
          'Terms & Conditions',
          onTap: onBlogTap,
        ),
        _FooterLink(
          label: 'FAQ',
          onTap: onFaqTap,
        ),
      ],
    );
  }
}

/* --------- CONTACT (clickable email & phone + Social Icons) --------- */

class _FooterContactSection extends StatelessWidget {
  final VoidCallback? onEmailTap;
  final VoidCallback? onPhoneTap;

  const _FooterContactSection({
    this.onEmailTap,
    this.onPhoneTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        _FooterContactRow(
          icon: Icons.email_outlined,
          text: 'connect@studygrids.com',
          onTap: onEmailTap,
        ),
        const SizedBox(height: 6),
        _FooterContactRow(
          icon: Icons.phone_outlined,
          text: '+91- 9309758526',
          onTap: onPhoneTap,
        ),
        const SizedBox(height: 16),
        
        // ✅ NEW: Social Media Header
        const Text(
          'Follow Us',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 12),
        
        // ✅ NEW: Social Media Icons Row with FontAwesome Icons
        Row(
          children: const [
            // Instagram
            _FooterSocialIcon(
              icon: FontAwesomeIcons.instagram, 
              url: 'https://www.instagram.com/piestudy_?igsh=MTdyZXpsMHhvOGlrNQ==',
            ),
            SizedBox(width: 14),

            // LinkedIn
            _FooterSocialIcon(
              icon: FontAwesomeIcons.linkedinIn, // Exact LinkedIn Logo
              url: 'https://www.linkedin.com/company/piestudy/',
            ),
            SizedBox(width: 14),

            // Facebook
            _FooterSocialIcon(
              icon: FontAwesomeIcons.facebookF, // Exact FB Logo
              url: 'https://www.facebook.com/share/p/1CzSLDMufj/',
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _FooterContactRow({
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final row = Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: _pieorange,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              color: Color(0xFFE5E7EB),
            ),
          ),
        ),
      ],
    );

    if (onTap == null) return row;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: row,
    );
  }
}

// ✅ NEW: Social Icon Helper Widget
class _FooterSocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _FooterSocialIcon({
    required this.icon,
    required this.url,
  });

  Future<void> _launchSocial() async {
    final uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        debugPrint("Could not launch $uri");
      }
    } catch (e) {
      debugPrint("Error launching url: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchSocial,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(9), // slightly bigger padding for FA icons
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: FaIcon( // ✅ Use FaIcon for better alignment with FontAwesome
          icon,
          size: 18, 
          color: Colors.white, 
        ),
      ),
    );
  }
}

/* --------- GENERIC COLUMN / LINK WIDGETS --------- */

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterColumn({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 260),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}

class _FooterPlainText extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const _FooterPlainText(this.label, {this.onTap});

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 13,
        color: _pieorange,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
        decorationColor: _pieorange,
      ),
    );

    if (onTap == null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: text,
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6, top: 2),
        child: text,
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _FooterLink({
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6, top: 2),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            color: _pieorange,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            decorationColor: _pieorange,
          ),
        ),
      ),
    );
  }
}
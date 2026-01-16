// import 'package:flutter/material.dart';
// import 'package:pie_study/widgets/app_colors.dart';
// import 'package:pie_study/widgets/brand_title.dart';

// /// Nav click par yehi callback chalega. id: 'home', 'programs', 'tnc', etc.
// typedef PieNavTap = void Function(String id);

// /// Saare nav items ek hi jagah.
// const Map<String, String> kPieNavItems = {
//   'Home': 'home',
//   'Programs': 'programs',
//   'B2B Trainings': 'b2b',
//   'B2G Programs': 'b2g',
//   'About Us': 'about',
//   'T&C': 'tnc',
//   'Contact Us': 'contact',
// };

// /// AppBar ke andar use hone wala top nav (BrandTitle + items + optional CTA button).
// class PieTopNav extends StatelessWidget {
//   final PieNavTap onItemTap;
//   final String? ctaLabel;
//   final VoidCallback? onCtaTap;

//   const PieTopNav({
//     super.key,
//     required this.onItemTap,
//     this.ctaLabel,
//     this.onCtaTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width >= 900;

//     return Row(
//       children: [
//         const BrandTitle(size: 30),
//         const Spacer(),
//         if (isWide)
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               PieNavRow(onItemTap: onItemTap),
//               if (ctaLabel != null && onCtaTap != null) ...[
//                 const SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: onCtaTap,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.navy,
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 10,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: Text(
//                     ctaLabel!,
//                     style: const TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w700,
//                       fontSize: 13,
//                     ),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//       ],
//     );
//   }
// }

// /// Desktop top nav row (sirf labels)
// class PieNavRow extends StatelessWidget {
//   final PieNavTap onItemTap;
//   final Map<String, String> items;

//   const PieNavRow({
//     super.key,
//     required this.onItemTap,
//     this.items = kPieNavItems,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: items.entries
//           .map(
//             (e) => Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 6),
//               child: InkWell(
//                 onTap: () => onItemTap(e.value),
//                 borderRadius: BorderRadius.circular(999),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                   child: Text(
//                     e.key,
//                     style: const TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 13,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }
// }

// /// Mobile drawer nav – same items but ListTile style
// class PieNavDrawer extends StatelessWidget {
//   final PieNavTap onItemTap;
//   final Map<String, String> items;

//   const PieNavDrawer({
//     super.key,
//     required this.onItemTap,
//     this.items = kPieNavItems,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(16),
//           child: BrandTitle(size: 30),
//         ),
//         const Divider(),
//         ...items.entries.map(
//           (e) => ListTile(
//             title: Text(
//               e.key,
//               style: const TextStyle(
//                 fontFamily: 'Inter',
//                 fontSize: 14,
//               ),
//             ),
//             onTap: () => onItemTap(e.value),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:pie_study/widgets/brand_title.dart';

/// Nav click par yehi callback chalega. id: 'home', 'programs', 'tnc', etc.
typedef PieNavTap = void Function(String id);

/// Saare nav items ek hi jagah.
const Map<String, String> kPieNavItems = {
  'Home': 'home',
  'Programs': 'programs',
  'B2B Trainings': 'b2b',
  'B2C Programs': 'b2g',
  'About Us': 'about',
  'T&C': 'tnc',
  'Contact Us': 'contact',
};

/// AppBar ke andar use hone wala top nav (BrandTitle + items + optional CTA button).
class PieTopNav extends StatelessWidget {
  final PieNavTap onItemTap;
  final String? ctaLabel;
  final VoidCallback? onCtaTap;

  /// Jis page par ho, uska id yaha pass karna (e.g. 'home', 'about')
  final String? activeId;

  const PieTopNav({
    super.key,
    required this.onItemTap,
    this.ctaLabel,
    this.onCtaTap,
    this.activeId,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Row(
      children: [
        const BrandTitle(),
        const Spacer(),
        if (isWide)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PieNavRow(
                onItemTap: onItemTap,
                activeId: activeId,
              ),
              if (ctaLabel != null && onCtaTap != null) ...[
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onCtaTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.navy,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    ctaLabel!,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ],
          ),
      ],
    );
  }
}

/// Desktop top nav row (sirf labels)
class PieNavRow extends StatelessWidget {
  final PieNavTap onItemTap;
  final Map<String, String> items;

  /// current active nav item id (e.g. 'home', 'about')
  final String? activeId;

  const PieNavRow({
    super.key,
    required this.onItemTap,
    this.items = kPieNavItems,
    this.activeId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.entries.map((e) {
        final bool isActive = e.value == activeId;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            onTap: () => onItemTap(e.value),
            borderRadius: BorderRadius.circular(999),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: isActive
                  ? BoxDecoration(
                      color: Colors.grey.shade200, // grey highlight
                      borderRadius: BorderRadius.circular(999),
                    )
                  : null,
              child: Text(
                e.key,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight:
                      isActive ? FontWeight.w700 : FontWeight.w600,
                  fontSize: 14,
                  color:
                      isActive ? AppColors.navy : Colors.black87,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

/// Mobile drawer nav – same items but ListTile style
class PieNavDrawer extends StatelessWidget {
  final PieNavTap onItemTap;
  final Map<String, String> items;

  /// Drawer me bhi active item bold/different color chahiye to use yahi id
  final String? activeId;

  const PieNavDrawer({
    super.key,
    required this.onItemTap,
    this.items = kPieNavItems,
    this.activeId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: BrandTitle(),
          ),
          const Divider(),
          ...items.entries.map(
            (e) {
              final bool isActive = e.value == activeId;

              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: isActive
                    ? BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      )
                    : null,
                child: ListTile(
                  title: Text(
                    e.key,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight:
                          isActive ? FontWeight.w700 : FontWeight.w500,
                      color:
                          isActive ? AppColors.navy : Colors.black87,
                    ),
                  ),
                  onTap: () => onItemTap(e.value),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class BrandTitle extends StatelessWidget {
//   final double? height;
//   final double? width;

//   const BrandTitle({
//     super.key,
//     this.height,
//     this.width,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final screenWidth = constraints.maxWidth;

//         // 👉 Auto adjust rules when user does not provide size
//         double autoHeight;
//         if (screenWidth < 450) {
//           autoHeight = 26; // small mobile
//         } else if (screenWidth < 900) {
//           autoHeight = 32; // tablet / medium
//         } else {
//           autoHeight = 54; // desktop
//         }

//         final appliedHeight = height ?? autoHeight;

//         // if width not provided → maintain aspect ratio automatically
//         return SizedBox(
//           height: appliedHeight,
//           width: width, // may be null, allowed
//           child: FittedBox(
//             fit: BoxFit.contain,
//             child: Image.asset(
//               'lib/assets/images/studygridlogos.png',
//               height: appliedHeight,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';

class BrandTitle extends StatelessWidget {
  final double? height;
  final double? width;

  const BrandTitle({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // ✅ Better responsive sizes
        double autoHeight;
        if (screenWidth < 450) {
          autoHeight = 22; // small mobile
        } else if (screenWidth < 900) {
          autoHeight = 35; // tablet
        } else if (screenWidth < 1400) {
          autoHeight = 55; // desktop
        } else {
          autoHeight = 55; // large desktop
        }

        final appliedHeight = height ?? autoHeight;

        return Image.asset(
          'lib/assets/images/studygridlogos.png',
          height: appliedHeight,
          width: width,
          fit: BoxFit.contain,
        );
      },
    );
  }
}

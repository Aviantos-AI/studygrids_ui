import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pie_study/widgets/global_floating_button.dart'; // Apne Dialog ka path check karein

// // ✅ MIXIN: Yeh logic kisi bhi page me use ho sakta hai
// mixin EnrollmentPopupMixin<T extends StatefulWidget> on State<T> {
  
//   // ✅ Scroll Controller jo hum page ke SingleChildScrollView ko denge
//   final ScrollController enrollmentScrollController = ScrollController();
  
//   Timer? _timer;
//   bool _isDialogOpen = false;

//   // ✅ STATIC Variable: Iska matlab yeh poori App me ek hi rahega.
//   // Ek baar true ho gaya, to kisi bhi page par dubara popup nahi aayega 
//   // jab tak User Browser Refresh nahi karta.
//   static bool hasShownInSession = false; 

//   @override
//   void initState() {
//     super.initState();

//     // 1. Timer Logic (10 Seconds)
//     _timer = Timer(const Duration(seconds: 10), () {
//       _checkAndShowDialog();
//     });

//     // 2. Scroll Logic (50%)
//     enrollmentScrollController.addListener(() {
//       if (hasShownInSession) return; // Optimization

//       if (enrollmentScrollController.hasClients) {
//         final maxScroll = enrollmentScrollController.position.maxScrollExtent;
//         final currentScroll = enrollmentScrollController.offset;

//         if (maxScroll > 0 && (currentScroll / maxScroll) >= 0.5) {
//           _checkAndShowDialog();
//         }
//       }
//     });
//   }

//   void _checkAndShowDialog() {
//     // Agar page hat gaya hai, ya dialog khula hai, ya session me dikh chuka hai -> Return
//     if (!mounted || _isDialogOpen || hasShownInSession) return;

//     _openDialogProcess();
//   }

//   Future<void> _openDialogProcess() async {
//     if (_isDialogOpen) return;

//     _timer?.cancel(); // Timer rok do

//     setState(() {
//       _isDialogOpen = true;
//       hasShownInSession = true; // ✅ Global Lock lag gaya
//     });

//     if (!mounted) return;

//     await showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (ctx) => const EnrollmentFormDialog(),
//     );

//     if (mounted) {
//       setState(() {
//         _isDialogOpen = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     enrollmentScrollController.dispose(); // ✅ Controller cleanup
//     super.dispose();
//   }
// }



mixin EnrollmentPopupMixin<T extends StatefulWidget> on State<T> {
  
  // ✅ Scroll Controller attached to SingleChildScrollView
  final ScrollController enrollmentScrollController = ScrollController();
  
  Timer? _timer;
  
  // ✅ GLOBAL LOCK: Static variable to ensure it runs ONLY ONCE per session (Refresh resets this)
  static bool _hasShownInSession = false; 

  @override
  void initState() {
    super.initState();

    // Agar pehle hi dikh chuka hai, to Timer ya Listener attach hi mat karo (Optimization)
    if (_hasShownInSession) return;

    // Condition 1: 20 Seconds Timer
    _timer = Timer(const Duration(seconds: 20), () {
      if (mounted) _checkAndShowDialog("Timer");
    });

    // Condition 2: 50% Scroll Logic
    enrollmentScrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Agar session me dikh chuka hai, to turant listener hata do
    if (_hasShownInSession) {
      enrollmentScrollController.removeListener(_scrollListener);
      return;
    }

    if (enrollmentScrollController.hasClients) {
      final maxScroll = enrollmentScrollController.position.maxScrollExtent;
      final currentScroll = enrollmentScrollController.offset;

      // ✅ Fix: MaxScroll > 50 check karein taaki empty page pe trigger na ho
      if (maxScroll > 50 && (currentScroll / maxScroll) >= 0.5) {
        _checkAndShowDialog("Scroll");
      }
    }
  }

  Future<void> _checkAndShowDialog(String source) async {
    // ✅ STRICT CHECK: Agar khula hai ya dikh chuka hai -> RETURN
    if (!mounted || _hasShownInSession) return;

    // ✅ LOCK IMMEDIATELY: Logic shuru hote hi true kar do taaki race condition na ho
    _hasShownInSession = true;
    _timer?.cancel();
    enrollmentScrollController.removeListener(_scrollListener);

    debugPrint("🔥 Popup Triggered by: $source"); // Debugging ke liye

    // Show Dialog
    await showDialog(
      context: context,
      barrierDismissible: true, // Bahar click karne par band hoga
      builder: (ctx) => const EnrollmentFormDialog(),
    );

    // Note: Dialog band hone ke baad _hasShownInSession FALSE NAHI karna hai.
    // Kyunki requirement hai: "Dialog close -> repeat ❌"
  }

  @override
  void dispose() {
    _timer?.cancel();
    enrollmentScrollController.dispose();
    super.dispose();
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pie_study/widgets/global_floating_button.dart'; // Apne Dialog ka path check karein

// ✅ MIXIN: Yeh logic kisi bhi page me use ho sakta hai
mixin EnrollmentPopupMixin<T extends StatefulWidget> on State<T> {
  
  // ✅ Scroll Controller jo hum page ke SingleChildScrollView ko denge
  final ScrollController enrollmentScrollController = ScrollController();
  
  Timer? _timer;
  bool _isDialogOpen = false;

  // ✅ STATIC Variable: Iska matlab yeh poori App me ek hi rahega.
  // Ek baar true ho gaya, to kisi bhi page par dubara popup nahi aayega 
  // jab tak User Browser Refresh nahi karta.
  static bool hasShownInSession = false; 

  @override
  void initState() {
    super.initState();

    // 1. Timer Logic (10 Seconds)
    _timer = Timer(const Duration(seconds: 10), () {
      _checkAndShowDialog();
    });

    // 2. Scroll Logic (50%)
    enrollmentScrollController.addListener(() {
      if (hasShownInSession) return; // Optimization

      if (enrollmentScrollController.hasClients) {
        final maxScroll = enrollmentScrollController.position.maxScrollExtent;
        final currentScroll = enrollmentScrollController.offset;

        if (maxScroll > 0 && (currentScroll / maxScroll) >= 0.5) {
          _checkAndShowDialog();
        }
      }
    });
  }

  void _checkAndShowDialog() {
    // Agar page hat gaya hai, ya dialog khula hai, ya session me dikh chuka hai -> Return
    if (!mounted || _isDialogOpen || hasShownInSession) return;

    _openDialogProcess();
  }

  Future<void> _openDialogProcess() async {
    if (_isDialogOpen) return;

    _timer?.cancel(); // Timer rok do

    setState(() {
      _isDialogOpen = true;
      hasShownInSession = true; // ✅ Global Lock lag gaya
    });

    if (!mounted) return;

    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => const EnrollmentFormDialog(),
    );

    if (mounted) {
      setState(() {
        _isDialogOpen = false;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    enrollmentScrollController.dispose(); // ✅ Controller cleanup
    super.dispose();
  }
}
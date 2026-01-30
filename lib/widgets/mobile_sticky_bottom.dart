import 'package:flutter/material.dart';
import 'package:pie_study/widgets/global_floating_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';



import 'dart:ui'; // ✅ Required for ImageFilter (Glass Effect)


class MobileStickyBottomBar extends StatelessWidget {
  const MobileStickyBottomBar({super.key});

  // ✅ Phone Call Logic
  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(scheme: 'tel', path: '+919309758526');
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  // ✅ Dialog Logic
  void _openEnrollmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => const CustomEnrollmentDialog(
        title: "Get a Call Back",
        subtitle: " ",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Screen Width Logic
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    return Positioned(
      // ✅ Desktop: 30px from bottom (Float). Mobile: 0 (Stick).
      bottom: isWideScreen ? 30 : 0,
      left: 0,
      right: 0,
      child: Center(
        child: ConstrainedBox(
          // ✅ Max width for Desktop to look like a Capsule
          constraints: BoxConstraints(maxWidth: isWideScreen ? 420 : double.infinity),
          child: Container(
            // ✅ Margin for Desktop Floating Effect
            margin: isWideScreen
                ? const EdgeInsets.symmetric(horizontal: 16)
                : EdgeInsets.zero,
            
            // ✅ Shadow Logic (Glass ke peeche shadow)
            decoration: BoxDecoration(
              borderRadius: isWideScreen
                  ? BorderRadius.circular(100)
                  : const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12), // Soft premium shadow
                  blurRadius: 25,
                  offset: const Offset(0, 8),
                  spreadRadius: 0,
                ),
              ],
            ),
            
            // ✅ CLIPPING is crucial for Blur to respect rounded corners
            child: ClipRRect(
              borderRadius: isWideScreen
                  ? BorderRadius.circular(100)
                  : const BorderRadius.vertical(top: Radius.circular(20)),
              
              child: BackdropFilter(
                // 🔥 REAL GLASS EFFECT: High Blur Sigma
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                
                child: Container(
                  padding: EdgeInsets.all(isWideScreen ? 10 : 12),
                  decoration: BoxDecoration(
                    // ⚠️ Transparency: 0.70 is perfect for Frosted Glass
                    color: Colors.white.withOpacity(0.70), 
                    
                    // ✅ Apple Style Subtle White Border
                    border: Border.all(
                      color: Colors.white.withOpacity(0.4),
                      width: 1.0,
                    ),
                    
                    // Radius must match ClipRRect
                    borderRadius: isWideScreen
                        ? BorderRadius.circular(100)
                        : const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  
                  child: Row(
                    children: [
                      // 📞 Call Expert Button
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _makePhoneCall,
                          icon: const Icon(Icons.call, size: 18),
                          label: const Text("Call Expert"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF0F172A),
                            side: const BorderSide(color: Color(0xFF94A3B8)), // Visible Border
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            textStyle: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                            backgroundColor: Colors.transparent, // Maintain Glass transparency
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 12),

                      // 👉 Get in Touch Button
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _openEnrollmentDialog(context),
                          icon: const Icon(Icons.touch_app_rounded, size: 18),
                          label: const Text("Get a call back"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7E21),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            elevation: 0,
                            textStyle: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 13.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
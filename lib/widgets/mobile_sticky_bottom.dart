import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileStickyBottomBar extends StatefulWidget {
  const MobileStickyBottomBar({super.key});

  @override
  State<MobileStickyBottomBar> createState() => _MobileStickyBottomBarState();
}

class _MobileStickyBottomBarState extends State<MobileStickyBottomBar> {
  // Popup message visibility control
  bool _showBottomMessage = true;

  void _closeBottomMessage() {
    setState(() {
      _showBottomMessage = false;
    });
  }

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(scheme: 'tel', path: '+919309758526'); // Apna number dalein
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _openWhatsApp() async {
    // Apna WhatsApp link dalein
    final Uri url = Uri.parse("https://wa.me/919309758526?text=Hi, I want to know more about the courses."); 
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Check: Agar Mobile nahi hai, to kuch mat dikhao (Hidden on Desktop/Tablet)
    // Note: Ensure ResponsiveBreakpoints is setup in main.dart
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    
    if (!isMobile) {
      return const SizedBox.shrink();
    }

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 1. Message Popup (Conditional)
          if (_showBottomMessage)
            Container(
              margin: const EdgeInsets.only(right: 16, bottom: 8, left: 16),
              constraints: const BoxConstraints(maxWidth: 300),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0), // Space for X button
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Start your degree or diploma at 10k per month!",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Best-in-class courses in Data Science, Management and Technology",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            color: Colors.black54,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Close (X) Button
                  Positioned(
                    top: -4,
                    right: -4,
                    child: GestureDetector(
                      onTap: _closeBottomMessage,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, size: 14, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // 2. Bottom Buttons Bar (Call Us & Live Chat)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Call Us Button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _makePhoneCall,
                    icon: const Icon(Icons.call, size: 18),
                    label: const Text("Call Us"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: const BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Live Chat Button (Red Color)
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _openWhatsApp,
                    icon: const Icon(Icons.chat_bubble_outline, size: 18),
                    label: const Text("Live Chat"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDC2626), // Red color match
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                      textStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
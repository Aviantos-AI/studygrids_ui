import 'package:flutter/material.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class GlobalFloatingButton extends StatelessWidget {
  const GlobalFloatingButton({super.key});

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse('https://wa.me/919309758526');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 50,
      child: FloatingActionButton(
        onPressed: _openWhatsApp,
        backgroundColor: const Color(0xFF25D366),
        child:  FaIcon(
          FontAwesomeIcons.whatsapp, 
          color: Colors.white, 
          size: 32, 
        ),
        
        
       
      ),
    );
  }
}



class EnrollmentFormDialog extends StatefulWidget {
  const EnrollmentFormDialog({super.key});

  @override
  State<EnrollmentFormDialog> createState() => _EnrollmentFormDialogState();
}

class _EnrollmentFormDialogState extends State<EnrollmentFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _selectedCourse;
  bool _consentGiven = false;

  final List<String> _courses = ['Agentic Ai', 'Data Science'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate() && _consentGiven) {
      try {
        final response = await http.post(
          Uri.parse(
            'https://paperback-wines-total-eating.trycloudflare.com/leads/submit',
          ),
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'full_name': _nameController.text,
            'email': _emailController.text,
            'mobile': _phoneController.text,
            'interested_course': _selectedCourse,
            'city': '',
            'message': '',
            'source': 'website',
          }),
        );

        if (mounted) {
          Navigator.pop(context);
          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Form submitted successfully!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Submission failed. Please try again.'),
              ),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error submitting form. Please try again.'),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Get a Call Back'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name*'),
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email*'),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v?.isEmpty ?? true) return 'Required';
                  if (!v!.contains('@')) return 'Invalid email';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone No*'),
                keyboardType: TextInputType.phone,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCourse,
                decoration: const InputDecoration(
                  labelText: 'Course Interested*',
                ),
                items: _courses.map((course) {
                  return DropdownMenuItem(value: course, child: Text(course));
                }).toList(),
                onChanged: (value) => setState(() => _selectedCourse = value),
                validator: (v) => v == null ? 'Please select a course' : null,
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Checkbox(
                    value: _consentGiven,
                    onChanged: (value) =>
                        setState(() => _consentGiven = value ?? false),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          setState(() => _consentGiven = !_consentGiven),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'I agree to the collection and use of my name, email address,and mobile number\nfor communication purposes in accordance with the privacy policy.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _consentGiven ? _handleSubmit : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.orange,
            foregroundColor: Colors.white,
          ),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}



/***--------------------------------new POPUP------------- */








// // ⚡ TODO: REPLACE THIS WITH YOUR ACTUAL API URL
// const String _apiEndpoint = 'https://trains-sole-tender-follow.trycloudflare.com//webinar/enroll';

// class CustomEnrollmentDialog extends StatefulWidget {
//   final String title;
//   final String subtitle;

//   const CustomEnrollmentDialog({
//     super.key,
//     this.title = "Get in Touch",
//     this.subtitle = "Fill in the details below, and our experts will contact you shortly.",
//   });

//   @override
//   State<CustomEnrollmentDialog> createState() => _CustomEnrollmentDialogState();
// }

// class _CustomEnrollmentDialogState extends State<CustomEnrollmentDialog> {
//   final _formKey = GlobalKey<FormState>();

//   // Input Controllers
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _enquiryController = TextEditingController();

//   bool _consentGiven = false;
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _enquiryController.dispose();
//     super.dispose();
//   }

//   // ✅ STRICT API SUBMISSION LOGIC
//   Future<void> _submitForm() async {
//     // 1. Validate Inputs
//     if (!_formKey.currentState!.validate()) return;

//     // 2. Validate Privacy Consent
//     if (!_consentGiven) {
//       _showSnackBar('Please accept the privacy policy to submit.', isError: true);
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final url = Uri.parse(_apiEndpoint);

//       // ✅ FIXED: Sending ONLY the 4 parameters supported by your API
//       final Map<String, dynamic> requestBody = {
//         "full_name": _nameController.text.trim(),
//         "email": _emailController.text.trim(),
//         "mobile": _phoneController.text.trim(),
//         "course_suggestion": _enquiryController.text.trim(), // Maps to 'Nature of Enquiry'
//       };

//       final response = await http.post(
//         url,
//         headers: {
//           'accept': 'application/json',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(requestBody),
//       );

//       if (mounted) {
//         setState(() => _isLoading = false);

//         // Check for 200 OK or 201 Created
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Navigator.pop(context); // Close Form
//           _showSuccessDialog();   // Show Success Message
//         } else {
//           // Log error for debugging (optional)
//           debugPrint("API Error: ${response.body}");
//           _showSnackBar('Submission failed. Server Error: ${response.statusCode}', isError: true);
//         }
//       }
//     } catch (e) {
//       if (mounted) {
//         setState(() => _isLoading = false);
//         _showSnackBar('Network error. Please check your connection.', isError: true);
//       }
//     }
//   }

//   // --- UI Feedback Methods ---
//   void _showSnackBar(String message, {bool isError = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isError ? Colors.redAccent : Colors.green,
//         behavior: SnackBarBehavior.floating,
//         margin: const EdgeInsets.all(16),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }

//   void _showSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         contentPadding: const EdgeInsets.all(24),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.green.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 48),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Request Submitted!",
//               style: TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 color: Color(0xFF111827),
//               ),
//             ),
//             const SizedBox(height: 5),
//             const Text(
//               "Thank you for your interest. Our expert counselors will reach out to you within 24 hours.",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: 'Inter',
//                 fontSize: 14,
//                 color: Color(0xFF6B7280),
//                 height: 1.5,
//               ),
//             ),
//             const SizedBox(height: 18),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () => Navigator.pop(ctx),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.orange,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                 ),
//                 child: const Text("Okay"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
    
//     // ✅ Responsive Logic:
//     // Desktop: 10% smaller than previous 450px -> ~405px
//     // Mobile: 15% smaller than previous 90% width -> ~76.5% width
//     final dialogWidth = screenWidth > 600 
//         ? 405.0 
//         : screenWidth * 0.765;

//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//       elevation: 0,
//       insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxWidth: dialogWidth),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // --- Header ---
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.title, // ✅ Dynamic Title
//                             style: const TextStyle(
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w800,
//                               fontSize: 22,
//                               color: Color(0xFF111827),
//                               letterSpacing: -0.5,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Text(
//                             widget.subtitle, // ✅ Dynamic Subtitle
//                             style: const TextStyle(
//                               fontFamily: 'Inter',
//                               fontSize: 13,
//                               color: Color(0xFF6B7280),
//                               height: 1.4,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () => Navigator.pop(context),
//                       borderRadius: BorderRadius.circular(20),
//                       child: Container(
//                         padding: const EdgeInsets.all(6),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade100,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(Icons.close, size: 20, color: Colors.grey),
//                       ),
//                     ),
//                   ],
//                 ),
                
//                 const SizedBox(height: 24),

//                 // --- 1. Full Name ---
//                 _buildLabel("Full Name"),
//                 const SizedBox(height: 6),
//                 _buildTextField(
//                   controller: _nameController,
//                   hint: "e.g. Rahul Sharma",
//                   icon: Icons.person_outline_rounded,
//                   validator: (v) => (v?.trim().isEmpty ?? true) ? "Name is required" : null,
//                 ),
                
//                 const SizedBox(height: 16),

//                 // --- 2. Email ---
//                 _buildLabel("Email Address"),
//                 const SizedBox(height: 6),
//                 _buildTextField(
//                   controller: _emailController,
//                   hint: "e.g. rahul@example.com",
//                   icon: Icons.email_outlined,
//                   inputType: TextInputType.emailAddress,
//                   validator: (v) {
//                     if (v?.trim().isEmpty ?? true) return "Email is required";
//                     if (!v!.contains('@') || !v.contains('.')) return "Enter a valid email";
//                     return null;
//                   },
//                 ),

//                 const SizedBox(height: 16),

//                 // --- 3. Mobile ---
//                 _buildLabel("Phone Number"),
//                 const SizedBox(height: 6),
//                 _buildTextField(
//                   controller: _phoneController,
//                   hint: "e.g. +91 9876543210",
//                   icon: Icons.phone_outlined,
//                   inputType: TextInputType.phone,
//                   validator: (v) {
//                      if (v?.trim().isEmpty ?? true) return "Phone number is required";
//                      if (v!.length < 10) return "Valid phone number required";
//                      return null;
//                   },
//                 ),

//                 const SizedBox(height: 16),

//                 // --- 4. Nature of Enquiry (Mapped to course_suggestion) ---
//                 _buildLabel("Nature of Enquiry / Course Interest"),
//                 const SizedBox(height: 6),
//                 _buildTextField(
//                   controller: _enquiryController,
//                   hint: "Describe your query (e.g. Course details, Fees)...",
//                   icon: Icons.chat_bubble_outline_rounded,
//                   inputType: TextInputType.multiline,
//                   maxLines: 3, // Text Area
//                   validator: (v) => (v?.trim().isEmpty ?? true) ? "Please enter enquiry details" : null,
//                 ),

//                 const SizedBox(height: 20),

//                 // --- Consent ---
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: 24,
//                       height: 24,
//                       child: Checkbox(
//                         value: _consentGiven,
//                         activeColor: AppColors.orange,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//                         side: BorderSide(color: Colors.grey.shade400),
//                         onChanged: (val) => setState(() => _consentGiven = val ?? false),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () => setState(() => _consentGiven = !_consentGiven),
//                         child: const Text(
//                           "I agree to receive communications from PieStudy via email/phone regarding my enquiry.",
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontSize: 12,
//                             color: Color(0xFF6B7280),
//                             height: 1.4,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 24),

//                 // --- Submit Button ---
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _submitForm,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.orange,
//                       disabledBackgroundColor: AppColors.orange.withOpacity(0.6),
//                       foregroundColor: Colors.white,
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: _isLoading
//                         ? const SizedBox(
//                             width: 24,
//                             height: 24,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 2.5,
//                             ),
//                           )
//                         : const Text(
//                             "Submit Request",
//                             style: TextStyle(
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w700,
//                               fontSize: 15,
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- UI Reusable Components ---

//   Widget _buildLabel(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontFamily: 'Inter',
//         fontSize: 13,
//         fontWeight: FontWeight.w600,
//         color: Color(0xFF374151),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     TextInputType inputType = TextInputType.text,
//     int maxLines = 1,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: inputType,
//       maxLines: maxLines,
//       validator: validator,
//       style: const TextStyle(
//         fontFamily: 'Inter',
//         fontSize: 14,
//         color: Color(0xFF111827),
//       ),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(
//           fontFamily: 'Inter',
//           fontSize: 14,
//           color: Color(0xFF9CA3AF),
//         ),
//         // Icon padding for top alignment in TextArea
//         prefixIcon: Padding(
//           padding: EdgeInsets.only(bottom: maxLines > 1 ? 48 : 0),
//           child: Icon(icon, size: 20, color: const Color(0xFF9CA3AF)),
//         ),
//         filled: true,
//         fillColor: const Color(0xFFF9FAFB),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppColors.orange, width: 1.5),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.redAccent),
//         ),
//       ),
//     );
//   }
// }



// ✅ CORRECTED API URL
const String _apiEndpoint = 'https://paperback-wines-total-eating.trycloudflare.com/webinar/enroll';

class CustomEnrollmentDialog extends StatefulWidget {
  final String title;
  final String subtitle;

  const CustomEnrollmentDialog({
    super.key,
    this.title = "Get in Touch",
    this.subtitle = "Fill in the details below, and our experts will contact you shortly.",
  });

  @override
  State<CustomEnrollmentDialog> createState() => _CustomEnrollmentDialogState();
}

class _CustomEnrollmentDialogState extends State<CustomEnrollmentDialog> {
  final _formKey = GlobalKey<FormState>();

  // Input Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _enquiryController = TextEditingController();

  bool _consentGiven = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _enquiryController.dispose();
    super.dispose();
  }

  // ✅ STRICT API SUBMISSION LOGIC
  Future<void> _submitForm() async {
    // 1. Validate Inputs
    if (!_formKey.currentState!.validate()) return;

    // 2. Validate Privacy Consent
    if (!_consentGiven) {
      _showSnackBar('Please accept the privacy policy to submit.', isError: true);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final url = Uri.parse(_apiEndpoint);

      // ✅ FIXED: Sending ONLY the 4 parameters supported by your API
      final Map<String, dynamic> requestBody = {
        "full_name": _nameController.text.trim(),
        "email": _emailController.text.trim(),
        "mobile": _phoneController.text.trim(),
        "course_suggestion": _enquiryController.text.trim(),
      };

      final response = await http.post(
        url,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (mounted) {
        setState(() => _isLoading = false);

        // Check for 200 OK or 201 Created
        if (response.statusCode == 200 || response.statusCode == 201) {
          Navigator.pop(context); // Close Form
          _showSuccessDialog();   // Show Success Message
        } else {
          debugPrint("API Error: ${response.body}");
          _showSnackBar('Submission failed. Server Error: ${response.statusCode}', isError: true);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        _showSnackBar('Network error. Please check your connection.', isError: true);
      }
    }
  }

  // --- UI Feedback Methods ---
  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'Inter'),
        ),
        backgroundColor: Colors.black87, // Black Background
        behavior: SnackBarBehavior.floating,
        width: 250, // Compact width for desktop look
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 48),
            ),
            const SizedBox(height: 16),
            const Text(
              "Request Submitted!",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Thank you for your interest.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text("Okay"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // ✅ Responsive Logic:
    // Desktop: Fixed 450px (Clean, readable dialog)
    // Mobile: 90% of screen width (Full width feel)
    final dialogWidth = screenWidth > 600 ? 440.0 : screenWidth * 0.9;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: dialogWidth),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- Header ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w900,
                              fontSize: 22,
                              color: Colors.black,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.subtitle,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              color: Color(0xFF374151),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close, size: 20, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),

                // --- 1. Full Name ---
                _buildLabel("Full Name *"),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _nameController,
                  hint: "e.g. Rahul Sharma",
                  icon: Icons.person_outline_rounded,
                  validator: (v) => (v?.trim().isEmpty ?? true) ? "Name is required *" : null,
                ),
                
                const SizedBox(height: 12),

                // --- 2. Email ---
                _buildLabel("Email Address *"),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _emailController,
                  hint: "e.g. rahul@example.com",
                  icon: Icons.email_outlined,
                  inputType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v?.trim().isEmpty ?? true) return "Email is required *";
                    if (!v!.contains('@') || !v.contains('.')) return "Enter a valid email *";
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                // --- 3. Mobile ---
                _buildLabel("Phone Number *"),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _phoneController,
                  hint: "e.g. +91 9876543210",
                  icon: Icons.phone_outlined,
                  inputType: TextInputType.phone,
                  validator: (v) {
                     if (v?.trim().isEmpty ?? true) return "Phone number is required *";
                     if (v!.length < 10) return "Valid phone number required *";
                     return null;
                  },
                ),

                const SizedBox(height: 12),

                // --- 4. Nature of Enquiry (Mapped to course_suggestion) ---
                _buildLabel("Nature of Enquiry / Course Interest *"),
                const SizedBox(height: 6),
                _buildTextField(
                  controller: _enquiryController,
                  hint: "Describe your query (e.g. Course details, Fees)...",
                  icon: Icons.chat_bubble_outline_rounded,
                  inputType: TextInputType.multiline,
                  maxLines: 3, // Text Area
                  validator: (v) => (v?.trim().isEmpty ?? true) ? "Please enter enquiry details" : null,
                ),

                const SizedBox(height: 12),

                // --- Consent ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _consentGiven,
                        activeColor: AppColors.orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        side: BorderSide(color: Colors.grey.shade400),
                        onChanged: (val) => setState(() => _consentGiven = val ?? false),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _consentGiven = !_consentGiven),
                        child: const Text(
                          "I agree to the collection and use of my name, email address,and mobile number for communication purposes in accordance with the privacy policy.",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // --- Submit Button ---
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      disabledBackgroundColor: AppColors.orange.withOpacity(0.6),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text(
                            "Submit Request",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- UI Reusable Components (Exact Old UI Style) ---

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF374151),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      validator: validator,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        color: Color(0xFF111827),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: Color(0xFF9CA3AF),
        ),
        // Align icon to top for textarea
        prefixIcon: Padding(
          padding: EdgeInsets.only(bottom: maxLines > 1 ? 48 : 0),
          child: Icon(icon, size: 20, color: const Color(0xFF9CA3AF)),
        ),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.orange, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
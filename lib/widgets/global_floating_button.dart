import 'package:flutter/material.dart';
import 'package:pie_study/widgets/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// class GlobalFloatingButton extends StatelessWidget {
//   const GlobalFloatingButton({super.key});

//   Future<void> _openWhatsApp() async {
//     final uri = Uri.parse('https://wa.me/910000000000');
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       right: 20,
//       bottom: 20,
//       child: FloatingActionButton(
//         onPressed: _openWhatsApp,
//         backgroundColor: const Color(0xFF25D366),
//         child: const Icon(Icons.chat, color: Colors.white),
//       ),
//     );
//   }
// }

// class EnrollmentFormDialog extends StatefulWidget {
//   const EnrollmentFormDialog({super.key});

//   @override
//   State<EnrollmentFormDialog> createState() => _EnrollmentFormDialogState();
// }

// class _EnrollmentFormDialogState extends State<EnrollmentFormDialog> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   String? _selectedCourse;
//   bool _consentGiven = false;

//   final List<String> _courses = ['Agentic Ai', 'Data Science'];

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }

//   Future<void> _handleSubmit() async {
//     if (_formKey.currentState!.validate() && _consentGiven) {
//       try {
//         final response = await http.post(
//           Uri.parse('https://maiden-pubmed-stickers-administered.trycloudflare.com/leads/submit'),
//           headers: {
//             'accept': 'application/json',
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode({
//             'full_name': _nameController.text,
//             'email': _emailController.text,
//             'mobile': _phoneController.text,
//             'interested_course': _selectedCourse,
//             'city': '',
//             'message': '',
//             'source': 'website',
//           }),
//         );

//         if (mounted) {
//           Navigator.pop(context);
//           if (response.statusCode == 200) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Form submitted successfully!')),
//             );
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Submission failed. Please try again.')),
//             );
//           }
//         }
//       } catch (e) {
//         if (mounted) {
//           Navigator.pop(context);
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Error submitting form. Please try again.')),
//           );
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Enroll now for free webinar'),
//       content: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name*'),
//                 validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email*'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (v) {
//                   if (v?.isEmpty ?? true) return 'Required';
//                   if (!v!.contains('@')) return 'Invalid email';
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: const InputDecoration(labelText: 'Phone No*'),
//                 keyboardType: TextInputType.phone,
//                 validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
//               ),
//               const SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: _selectedCourse,
//                 decoration: const InputDecoration(
//                   labelText: 'Course Interested*',
//                 ),
//                 items: _courses.map((course) {
//                   return DropdownMenuItem(value: course, child: Text(course));
//                 }).toList(),
//                 onChanged: (value) => setState(() => _selectedCourse = value),
//                 validator: (v) => v == null ? 'Please select a course' : null,
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,

//                 children: [
//                   Checkbox(
//                     value: _consentGiven,
//                     onChanged: (value) =>
//                         setState(() => _consentGiven = value ?? false),
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () =>
//                           setState(() => _consentGiven = !_consentGiven),
//                       child: const Padding(
//                         padding: EdgeInsets.only(top: 12),
//                         child: Text(
//                           'I agree to the collection and use of my name, email address,and mobile number\nfor communication purposes in accordance with the privacy policy.',
//                           style: TextStyle(fontSize: 12),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: _consentGiven ? _handleSubmit : null,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: AppColors.orange,
//             foregroundColor: Colors.white,
//           ),
//           child: const Text('Submit'),
//         ),
//       ],
//     );
//   }
// }


class GlobalFloatingButton extends StatelessWidget {
  const GlobalFloatingButton({super.key});

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse('https://wa.me/910000000000');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: FloatingActionButton(
        onPressed: _openWhatsApp,
        backgroundColor: const Color(0xFF25D366),
        child: const Icon(Icons.chat, color: Colors.white),
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
          Uri.parse('https://maiden-pubmed-stickers-administered.trycloudflare.com/leads/submit'),
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
          // Pass 'true' to indicate success, triggering the 4-day delay
          Navigator.pop(context, true); 
          
          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Form submitted successfully!')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Submission failed. Please try again.')),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          // Pass 'false' indicating cancellation/error, triggering the 30-min delay
          Navigator.pop(context, false); 
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error submitting form. Please try again.')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enroll now for free webinar'),
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
          // Pass 'false' indicating cancellation, triggering the 30-min delay
          onPressed: () => Navigator.pop(context, false), 
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
import 'package:flutter/material.dart';
import 'package:pie_study/widgets/app_colors.dart'; // Ensure correct import

// class RegisterNow extends StatefulWidget {
//   const RegisterNow({super.key});

//   @override
//   State<RegisterNow> createState() => _RegisterNowState();
// }

// class _RegisterNowState extends State<RegisterNow> {
//   final _formKey = GlobalKey<FormState>();
  
//   // Controllers
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _stateController = TextEditingController();
//   final _inquiryController = TextEditingController();
  
//   String _selectedCountryCode = '+91';
//   String? _selectedCourse;
//   bool _isLoading = false;

//   final List<String> _courses = [
//     'Agentic AI Program',
//     'Data Science Internship',
//     'Corporate Training',
//     'Other'
//   ];

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _stateController.dispose();
//     _inquiryController.dispose();
//     super.dispose();
//   }

//   Future<void> _submitForm() async {
//     if (!_formKey.currentState!.validate()) return;

//     setState(() => _isLoading = true);

//     // Simulate API call
//     await Future.delayed(const Duration(seconds: 2));

//     // Construct the payload as requested
//     final formData = {
//       "full_name": _nameController.text,
//       "email": _emailController.text,
//       "country_code": _selectedCountryCode,
//       "mobile": _phoneController.text,
//       "state": _stateController.text,
//       "interested_course": _selectedCourse ?? "Not Selected",
//       "inquiry": _inquiryController.text
//     };

//     debugPrint("Submitting RegisterNow Form: $formData"); 

//     if (mounted) {
//       setState(() => _isLoading = false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Registration Successful! Welcome to the AI Journey."),
//           backgroundColor: Colors.green,
//           behavior: SnackBarBehavior.floating,
//         ),
//       );
//       _formKey.currentState!.reset();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       color: const Color(0xFFF8FAFC), 
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 800),
//           child: Card(
//             elevation: 0, // Flat modern look
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(24),
//               side: BorderSide(color: Colors.grey.shade200),
//             ),
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(32.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // --- Header ---
//                     const Center(
//                       child: Text(
//                         "Register Now",
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontSize: 28,
//                           fontWeight: FontWeight.w900,
//                           color: Color(0xFF0F172A),
//                           letterSpacing: -0.5,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Center(
//                       child: Text(
//                         "Start your AI journey by filling the details below.",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontSize: 15,
//                           color: Color(0xFF64748B),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 32),

//                     // --- Row 1: Name & Email ---
//                     LayoutBuilder(
//                       builder: (context, constraints) {
//                         return Wrap(
//                           spacing: 20,
//                           runSpacing: 20,
//                           children: [
//                             SizedBox(
//                               width: constraints.maxWidth > 600 
//                                   ? (constraints.maxWidth - 20) / 2 
//                                   : constraints.maxWidth,
//                               child: _buildTextField(
//                                 controller: _nameController,
//                                 label: "Full Name",
//                                 icon: Icons.person_outline,
//                                 validator: (v) => v!.isEmpty ? "Required" : null,
//                               ),
//                             ),
//                             SizedBox(
//                               width: constraints.maxWidth > 600 
//                                   ? (constraints.maxWidth - 20) / 2 
//                                   : constraints.maxWidth,
//                               child: _buildTextField(
//                                 controller: _emailController,
//                                 label: "Email Address",
//                                 icon: Icons.email_outlined,
//                                 validator: (v) => !v!.contains('@') ? "Invalid email" : null,
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 20),

//                     // --- Row 2: Mobile & State ---
//                     LayoutBuilder(
//                       builder: (context, constraints) {
//                         return Wrap(
//                           spacing: 20,
//                           runSpacing: 20,
//                           children: [
//                             // Phone Input with Country Code
//                             SizedBox(
//                               width: constraints.maxWidth > 600 
//                                   ? (constraints.maxWidth - 20) / 2 
//                                   : constraints.maxWidth,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     width: 85,
//                                     margin: const EdgeInsets.only(right: 10),
//                                     child: DropdownButtonFormField<String>(
//                                       value: _selectedCountryCode,
//                                       items: ['+91', '+1', '+44'].map((code) => DropdownMenuItem(
//                                         value: code,
//                                         child: Text(code, style: const TextStyle(fontSize: 14)),
//                                       )).toList(),
//                                       onChanged: (val) => setState(() => _selectedCountryCode = val!),
//                                       decoration: _inputDecoration("Code"),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: _buildTextField(
//                                       controller: _phoneController,
//                                       label: "Mobile Number",
//                                       icon: Icons.phone_outlined,
//                                       inputType: TextInputType.phone,
//                                       validator: (v) => v!.length < 10 ? "Invalid mobile" : null,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // State Input
//                             SizedBox(
//                               width: constraints.maxWidth > 600 
//                                   ? (constraints.maxWidth - 20) / 2 
//                                   : constraints.maxWidth,
//                               child: _buildTextField(
//                                 controller: _stateController,
//                                 label: "State / Region",
//                                 icon: Icons.map_outlined,
//                                 validator: (v) => v!.isEmpty ? "Required" : null,
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 20),

//                     // --- Row 3: Course Dropdown ---
//                     DropdownButtonFormField<String>(
//                       value: _selectedCourse,
//                       hint: const Text("Select Interested Course"),
//                       items: _courses.map((course) => DropdownMenuItem(
//                         value: course,
//                         child: Text(course),
//                       )).toList(),
//                       onChanged: (val) => setState(() => _selectedCourse = val),
//                       validator: (v) => v == null ? "Please select a course" : null,
//                       decoration: _inputDecoration("Interested Course", icon: Icons.school_outlined),
//                     ),
//                     const SizedBox(height: 20),

//                     // --- Row 4: Inquiry ---
//                     _buildTextField(
//                       controller: _inquiryController,
//                       label: "Any specific inquiry? (Optional)",
//                       icon: Icons.chat_bubble_outline,
//                       maxLines: 3,
//                     ),
//                     const SizedBox(height: 32),

//                     // --- Submit Button ---
//                     SizedBox(
//                       width: double.infinity,
//                       height: 54,
//                       child: ElevatedButton(
//                         onPressed: _isLoading ? null : _submitForm,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF0F172A), // Deep Navy for Register
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: _isLoading
//                             ? const SizedBox(
//                                 width: 24, height: 24,
//                                 child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
//                               )
//                             : const Text(
//                                 "Register Now",
//                                 style: TextStyle(
//                                   fontFamily: 'Inter',
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- Helper Methods ---
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
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
//       decoration: _inputDecoration(label, icon: icon),
//     );
//   }

//   InputDecoration _inputDecoration(String label, {IconData? icon}) {
//     return InputDecoration(
//       labelText: label,
//       labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
//       alignLabelWithHint: true,
//       prefixIcon: icon != null ? Icon(icon, color: Colors.grey[500], size: 20) : null,
//       filled: true,
//       fillColor: const Color(0xFFF1F5F9), // Slate-50
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide.none,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: BorderSide.none,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: AppColors.orange, width: 1.5),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//     );
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterNow extends StatefulWidget {
  const RegisterNow({super.key});

  @override
  State<RegisterNow> createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _inquiryController = TextEditingController();
  
  // State Variables
  String _selectedCountryCode = '+91';
  String? _selectedCourse;
  String? _selectedState; 
  bool _isLoading = false;
  bool _consentGiven = false; // ✅ Consent Checkbox State

  // Options
  final List<String> _courses = [
    'Agentic AI ',
    'Data Science '
    
  ];

  // ✅ List of Indian States & UTs
  final List<String> _indianStates = [
    "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
    "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka",
    "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram",
    "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu",
    "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal",
    "Andaman and Nicobar Islands", "Chandigarh", "Dadra and Nagar Haveli",
    "Daman and Diu", "Delhi", "Lakshadweep", "Puducherry", "Ladakh", "Jammu and Kashmir"
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _inquiryController.dispose();
    super.dispose();
  }

  // ✅ Custom Snackbar Logic (Bottom Left, Black Bg)
  void _showCustomSnackBar(String message) {
    final screenWidth = MediaQuery.of(context).size.width;
    const snackBarWidth = 320.0; 
    const leftMargin = 24.0;
    
    final bool isDesktop = screenWidth > 600;
    final rightMargin = isDesktop 
        ? screenWidth - (snackBarWidth + leftMargin) 
        : 24.0;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.info_outline, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF111827), // Always Black
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: 24,
          left: leftMargin,
          right: rightMargin,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  Future<void> _submitForm() async {
    // 1. Validate Fields
    if (!_formKey.currentState!.validate()) return;

    // 2. Validate Consent Checkbox
    if (!_consentGiven) {
      _showCustomSnackBar("Please accept the Terms and Conditions.");
      return;
    }

    setState(() => _isLoading = true);

    // API Endpoint
    final url = Uri.parse('https://trains-sole-tender-follow.trycloudflare.com/leads/interest');

    // Request Payload
    final Map<String, dynamic> requestBody = {
      "full_name": _nameController.text.trim(),
      "email": _emailController.text.trim(),
      "country_code": _selectedCountryCode,
      "mobile": _phoneController.text.trim(),
      "state": _selectedState ?? "", 
      "interested_course": _selectedCourse ?? "Not Selected",
      "inquiry": _inquiryController.text.trim()
    };

    try {
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

        if (response.statusCode == 200 || response.statusCode == 201) {
          _showCustomSnackBar("Registration Successful! Welcome to the AI Journey. 🚀");
          _clearForm();
        } else {
          debugPrint("API Error: ${response.body}");
          _showCustomSnackBar("Submission failed. Please try again.");
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        _showCustomSnackBar("Network error. Please check your connection.");
      }
    }
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _inquiryController.clear();
    setState(() {
      _selectedCourse = null;
      _selectedState = null;
      _selectedCountryCode = '+91';
      _consentGiven = false; // Reset checkbox
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: const Color(0xFFF8FAFC), 
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Card(
            elevation: 0, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Header ---
                    const Center(
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF0F172A),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Start your AI journey by filling the details below.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // --- Row 1: Name & Email ---
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children: [
                            SizedBox(
                              width: constraints.maxWidth > 600 
                                  ? (constraints.maxWidth - 24) / 2 
                                  : constraints.maxWidth,
                              child: _buildTextField(
                                controller: _nameController,
                                label: "Full Name",
                                icon: Icons.person_outline,
                                validator: (v) => (v?.trim().isEmpty ?? true) ? "Name is required" : null,
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth > 600 
                                  ? (constraints.maxWidth - 24) / 2 
                                  : constraints.maxWidth,
                              child: _buildTextField(
                                controller: _emailController,
                                label: "Email Address",
                                icon: Icons.email_outlined,
                                validator: (v) {
                                  if (v?.trim().isEmpty ?? true) return "Email is required";
                                  if (!v!.contains('@')) return "Invalid email";
                                  return null;
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // --- Row 2: Mobile & State (Dropdown) ---
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children: [
                            // Phone Input
                            SizedBox(
                              width: constraints.maxWidth > 600 
                                  ? (constraints.maxWidth - 24) / 2 
                                  : constraints.maxWidth,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 90,
                                    margin: const EdgeInsets.only(right: 12),
                                    child: DropdownButtonFormField<String>(
                                      value: _selectedCountryCode,
                                      items: ['+91'].map((code) => DropdownMenuItem(
                                        value: code,
                                        child: Text(code, style: const TextStyle(fontSize: 14)),
                                      )).toList(),
                                      onChanged: (val) => setState(() => _selectedCountryCode = val!),
                                      decoration: _inputDecoration("Code"),
                                    ),
                                  ),
                                  Expanded(
                                    child: _buildTextField(
                                      controller: _phoneController,
                                      label: "Mobile Number",
                                      icon: Icons.phone_outlined,
                                      inputType: TextInputType.phone,
                                      validator: (v) => (v?.length ?? 0) < 10 ? "Invalid mobile" : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            // State Dropdown
                            SizedBox(
                              width: constraints.maxWidth > 600 
                                  ? (constraints.maxWidth - 24) / 2 
                                  : constraints.maxWidth,
                              child: DropdownButtonFormField<String>(
                                value: _selectedState,
                                hint: const Text("Select State / Region"),
                                menuMaxHeight: 300,
                                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                                items: _indianStates.map((state) => DropdownMenuItem(
                                  value: state,
                                  child: Text(
                                    state,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 14, fontFamily: 'Inter'),
                                  ),
                                )).toList(),
                                onChanged: (val) => setState(() => _selectedState = val),
                                validator: (v) => v == null ? "State is required" : null,
                                decoration: _inputDecoration("State / Region", icon: Icons.map_outlined),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // --- Row 3: Course Dropdown ---
                    DropdownButtonFormField<String>(
                      value: _selectedCourse,
                      hint: const Text("Select Interested Course"),
                      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                      items: _courses.map((course) => DropdownMenuItem(
                        value: course,
                        child: Text(course, style: const TextStyle(fontSize: 14, fontFamily: 'Inter')),
                      )).toList(),
                      onChanged: (val) => setState(() => _selectedCourse = val),
                      validator: (v) => v == null ? "Please select a course" : null,
                      decoration: _inputDecoration("Interested Course", icon: Icons.school_outlined),
                    ),
                    const SizedBox(height: 24),

                    // --- Row 4: Inquiry ---
                    _buildTextField(
                      controller: _inquiryController,
                      label: "Any specific inquiry? (Optional)",
                      icon: Icons.chat_bubble_outline,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),

                    // --- Consent Checkbox ---
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: _consentGiven,
                            activeColor: AppColors.orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            onChanged: (val) {
                              setState(() {
                                _consentGiven = val ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _consentGiven = !_consentGiven),
                            child: const Text(
                              "I agree to the collection and use of my name, email address,and mobile number for communication purposes in accordance with the privacy policy.",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: Color(0xFF64748B),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 32),

                    // --- Submit Button ---
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F172A), // Deep Navy
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 24, height: 24,
                                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                              )
                            : const Text(
                                "Register Now",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
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
    );
  }

  // --- Helper Methods ---
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
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
      style: const TextStyle(fontFamily: 'Inter', fontSize: 15),
      decoration: _inputDecoration(label, icon: icon),
    );
  }

  InputDecoration _inputDecoration(String label, {IconData? icon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14, fontFamily: 'Inter'),
      alignLabelWithHint: true,
      prefixIcon: icon != null ? Icon(icon, color: Colors.grey[500], size: 20) : null,
      filled: true,
      fillColor: const Color(0xFFF1F5F9), // Slate-50
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.orange, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    );
  }
}
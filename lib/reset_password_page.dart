// //import 'package:flutter/material.dart';
// //import 'package:supabase_flutter/supabase_flutter.dart';

// class ResetPasswordPage extends StatefulWidget {
//   final String token;

//   const ResetPasswordPage({super.key, required this.token});

//   @override
//   _ResetPasswordPageState createState() => _ResetPasswordPageState();
// }

// class _ResetPasswordPageState extends State<ResetPasswordPage> {
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _isLoading = false;
//   String? _errorMessage;

//   Future<void> _resetPassword() async {
//     final password = _passwordController.text.trim();
//     final confirmPassword = _confirmPasswordController.text.trim();

//     if (password.isEmpty || confirmPassword.isEmpty) {
//       setState(() {
//         _errorMessage = 'Please fill in both fields.';
//       });
//       return;
//     }

//     if (password != confirmPassword) {
//       setState(() {
//         _errorMessage = 'Passwords do not match.';
//       });
//       return;
//     }

//     try {
//       setState(() {
//         _isLoading = true;
//       });

//       // Reset the password using the token
//       final response = await Supabase.instance.client.auth.api
//           .resetPasswordForEmail(
//             password,
//             token: widget.token,
//           );

//       if (response.error == null) {
//         // Successfully reset the password
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Password has been reset successfully!')),
//         );
//         Navigator.pop(context); // Navigate back to login page
//       } else {
//         setState(() {
//           _errorMessage = response.error?.message;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'An unexpected error occurred.';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Reset Password')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'New Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _confirmPasswordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Confirm New Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             if (_errorMessage != null) ...[
//               SizedBox(height: 16),
//               Text(
//                 _errorMessage!,
//                 style: const TextStyle(color: Colors.red),
//               ),
//             ],
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _isLoading ? null : _resetPassword,
//               child: _isLoading
//                   ? const CircularProgressIndicator()
//                   : const Text('Reset Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//This is the signup page for students.
import 'package:campus_housing/screens/models/appdata.dart';
import 'package:flutter/material.dart';

class StudentsignupPage extends StatefulWidget {
  final VoidCallback onAuthSuccess;
  const StudentsignupPage({super.key, required this.onAuthSuccess});

  @override
  State<StudentsignupPage> createState() => _StudentsignupPageState();
}

class _StudentsignupPageState extends State<StudentsignupPage> {
  bool _isLogin = false;
  // These are the controllers for the text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // This method disposes of the controllers
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  // This method builds the UI of the StudentsignupPage
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _isLogin ? "Welcome Back" : "Register as Student",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _isLogin
                  ? "Enter your phone to login"
                  : "Landlords will contact you via this number",
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 40),

            if (!_isLogin) ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 20),
            ],

            // PHONE NUMBER FIELD
            const TextField(
              keyboardType: TextInputType.phone, // Opens numeric keypad
              decoration: InputDecoration(
                labelText: "Phone Number",
                hintText: "07... or 01...",
                prefixIcon: Icon(Icons.phone_android_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Create Password",
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  AppData.loggedInLandlordPhone = _phoneController.text;
                  Future.microtask(() => widget.onAuthSuccess());
                },
                child: Text(
                  _isLogin ? "Login" : "Create Account",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: TextButton(
                onPressed: () => setState(() => _isLogin = !_isLogin),
                child: Text(
                  _isLogin
                      ? "New to this app? Sign Up"
                      : "Already have an account? Login",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tracer/services/login_google_service.dart';

class LoginGooglePage extends StatefulWidget {
  const LoginGooglePage({super.key});

  @override
  State<LoginGooglePage> createState() => _LoginGooglePageState();
}

class _LoginGooglePageState extends State<LoginGooglePage> {
  final LoginGoogleService googleService = LoginGoogleService();
  final TextEditingController _emailController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _loginWithGoogle() async {
    final email = _emailController.text.trim();

    // Validasi input email
    if (email.isEmpty) {
      setState(() {
        _errorMessage = "Email tidak boleh kosong.";
      });
      return;
    }

    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(email)) {
      setState(() {
        _errorMessage = "Format email tidak valid.";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      // Periksa apakah email sudah ada di database
      final isEmailExists = await LoginGoogleService.checkEmailExists(email);

      if (!isEmailExists) {
        // Jika email belum ada, tambahkan ke database
        await LoginGoogleService.createUser(email);
      }

      // Arahkan ke halaman home
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      setState(() {
        _errorMessage = "Login gagal: ${e.toString()}";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tracer Alumni",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              if (_isLoading)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _loginWithGoogle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.verified_user, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        "Log in with Google",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 10),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

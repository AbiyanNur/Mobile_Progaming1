import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';//
import 'package:simple_icons/simple_icons.dart';// Paket tambahan untuk tombol login sosial

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Latar belakang lembut
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Ikon Aplikasi
              Container(
                  height: 200,  // Atur ukuran container sesuai kebutuhan
                  width: 200,
                  child: Lottie.asset('assets/lotties/login_animation.json')
              ),
              SizedBox(height: 16),

              // Judul Aplikasi
              Text(
                "Jadwalku",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),

              // Subjudul
              Text(
                "Selamat Datang \ di App Jadwalku - Kelas A",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 32),

              // Input Username
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),

              // Input Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Garis pemisah dengan teks "or"
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Tombol Login dengan Google
              ElevatedButton.icon(
                onPressed: () {
                  // Logika sign-in Google
                },
                icon: Icon(SimpleIcons.google, color: Colors.white, size: 24), // Pastikan ukuran ikon
                label: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700], // Ganti 'primary' dengan 'backgroundColor'
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Gunakan radius yang sama
                  ),
                  minimumSize: Size(double.infinity, 48), // Minimum size untuk konsistensi
                ),
              ),

              SizedBox(height: 8),

              // Tombol Login dengan Apple ID
              ElevatedButton.icon(
                onPressed: () {
                  // Logika sign-in Apple
                },
                icon: Icon(SimpleIcons.apple, color: Colors.white, size: 24), // Pastikan ukuran ikon
                label: Text(
                  "Sign in with Apple ID",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Warna background tombol Apple
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Gunakan radius yang sama
                  ),
                  minimumSize: Size(double.infinity, 48), // Minimum size untuk konsistensi
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

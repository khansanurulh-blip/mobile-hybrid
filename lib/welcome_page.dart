import 'package:flutter/material.dart';
import 'package:coffeeshop_app/beranda_page.dart';
import 'package:coffeeshop_app/menu_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            // Background kopi
            Positioned.fill(
              child: Transform.translate(
                offset: Offset(0, -130),
                child: Image.asset(
                  "assets/images/coffee.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Background pada text
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                width: double.infinity,
                color: Color(0xFF5A3A2E),
              ),
            ),

            // Konten (Teks dan Tombol)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  // Judul utama
                  Text(
                    "Time for a coffee break....",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Deskripsi
                  Text(
                    "Your daily dose of fresh brew delivered to your doorstep. Start your coffee journey now!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),

                  SizedBox(height: 25),

                  // Titik titik indikator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.white),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 8, color: Colors.white54),
                      SizedBox(width: 6),
                      Icon(Icons.circle, size: 8, color: Colors.white54),
                    ],
                  ),

                  SizedBox(height: 20),


                  // Tombol "Get Started"
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BerandaPage(),
                            ),
                          );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF8C32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
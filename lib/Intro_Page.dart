import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home_Page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 40, top: 160),
            child: Image.asset('assets/images/apple.jpeg'),
          ),
          Text('We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
              )),
          const SizedBox(height: 24),
          Text(
            'Fresh items everyday',
            style: TextStyle(color: Colors.grey[700]),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(24),
              child: Text('Get Started'),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

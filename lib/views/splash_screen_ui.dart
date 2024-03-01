
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_shere_project/views/input_money_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
@override
void initState(){
  Future.delayed(
    Duration(
      seconds: 3,
    ),

    () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => InputMoneyUI()
      ),
    ),
  );
  super.initState();
}








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 77, 23),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/money.png',
              width: MediaQuery.of(context).size.height * 0.5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.04,
            ),
            CircularProgressIndicator(
              color: Colors.amber,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'แชร์เงินกันเถอะ',
              style: GoogleFonts.zeyada(
                fontSize: MediaQuery.of(context).size.height * 0.045,
                color: Colors.white70,
              ),
            ),
            Text(
              'Copyright © 2024 By Sirichok Boonpheak DTI-SAU',
              style: GoogleFonts.zeyada(
              
                color: Colors.white70,
              ),
            ),
            Text(
              'Version 1.0.0',
              style: GoogleFonts.zeyada(
                
                color: Colors.white70,
              ),
            ),
            
          ],
        )
         ),
    );
  }
}
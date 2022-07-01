import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuel_token_app/components/utills.dart';

import 'package:fuel_token_app/views/home/mainpage.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotohomepage();
  }

  gotohomepage() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const MainPage();
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kred2color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                "images/Ceylon_Petroleum_Corporation_logo-removebg-preview.png"),
            const SizedBox(
              height: 10,
            ),
            Text("Token Collector",
                style: GoogleFonts.allertaStencil(
                    color: kwhitecolor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

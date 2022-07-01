import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllTokenNumberCount extends StatelessWidget {
  final String title;
  
  const AllTokenNumberCount({
    Key? key,
    required this.size, required this.title,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size.width / 2,
        decoration: BoxDecoration(
            color: Colors.amber,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(4.0, 4.0),
                  color: Colors.redAccent),
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(-4.0, -4.0),
                  color: Colors.pink)
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              title,
              style: GoogleFonts.armata(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text(
              "156",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            )
          ]),
        ),
      ),
    );
  }
}

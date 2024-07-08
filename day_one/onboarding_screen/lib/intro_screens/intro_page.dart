import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  final String heading;
  final String subHeading;
  final String imagePath;
  const IntroPage({
    super.key,
    required this.heading,
    required this.subHeading,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 130),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 200,
          ),
          const Gap(20),
          Text(
            heading,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: Color.fromRGBO(73, 62, 138, 1),
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 20.0,
              left: 20,
              bottom: 20.0,
            ),
            child: Text(
              subHeading,
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

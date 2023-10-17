import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesCategory extends StatelessWidget {
  final String text;
  final String image;
  const ServicesCategory({
    required this.text,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 217, 226, 228),
            offset: Offset(1, 1),
          )
        ],
        border: Border.all(
          color: const Color.fromARGB(179, 255, 255, 255),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text(
          //   text,
          //   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          // ),
          AutoSizeText(
            text,
            style: GoogleFonts.acme(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            minFontSize: 8,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

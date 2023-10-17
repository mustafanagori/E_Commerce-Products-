import 'package:auto_size_text/auto_size_text.dart';
import 'package:contruction0/a_widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCardWidget2 extends StatelessWidget {
  final String image;
  final String title;
  final String des;
  final int price;

  const ServiceCardWidget2({
    required this.image,
    required this.title,
    required this.des,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromARGB(255, 195, 179, 179),
            width: 1,
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AutoSizeText(
                      title,
                      style: GoogleFonts.acme(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                      minFontSize: 8,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      des,
                      style: GoogleFonts.abel(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                      ),
                      minFontSize: 8,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextStyleWidget(
                          fontSize: 12,
                          text: "Rs $price",
                          color: Colors.green,
                        ),
                        const TextStyleWidget(
                          fontSize: 12,
                          text: "Qty: 1",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

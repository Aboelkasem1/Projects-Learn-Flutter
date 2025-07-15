import 'package:a_commerce_app/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyAppBar(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search result for “Earphone”',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border(
                              bottom: BorderSide(color: Color(0xffF0F2F1)),
                              top: BorderSide(color: Color(0xffF0F2F1)),
                              left: BorderSide(color: Color(0xffF0F2F1)),
                              right: BorderSide(color: Color(0xffF0F2F1)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Filters',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Iconsax.filter, size: 12),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

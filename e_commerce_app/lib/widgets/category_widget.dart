import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 6, right: 20, bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/home_image/categorys/img1.png',
                        ),
                      ),
                      Text('Apparel', style: GoogleFonts.inter(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/home_image/categorys/img2.png',
                        ),
                      ),
                      Text('School', style: GoogleFonts.inter(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/home_image/categorys/img3.png',
                        ),
                      ),
                      Text('Sports', style: GoogleFonts.inter(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/home_image/categorys/img4.png',
                        ),
                      ),
                      Text(
                        'Electronic',
                        style: GoogleFonts.inter(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/home_image/categorys/img5.png',
                        ),
                      ),
                      Text('All', style: GoogleFonts.inter(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

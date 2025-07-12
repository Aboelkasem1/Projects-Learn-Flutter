import 'package:a_commerce_app/pages/searching_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchContainerWidget extends StatelessWidget {
  const SearchContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 14),
      child: GestureDetector(
        onTap: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => SearchingPage()));
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border(
              top: BorderSide(color: Colors.grey[300]!),
              right: BorderSide(color: Colors.grey[300]!),
              bottom: BorderSide(color: Colors.grey[300]!),
              left: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search, size: 25, color: Colors.grey[600]!),
              ),
              Text(
                'Search here ...',
                style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

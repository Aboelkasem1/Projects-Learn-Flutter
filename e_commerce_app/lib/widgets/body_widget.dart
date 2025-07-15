import 'package:a_commerce_app/widgets/banner_widget.dart';
import 'package:a_commerce_app/widgets/category_widget.dart';
import 'package:a_commerce_app/widgets/filter_record_widget.dart';
import 'package:a_commerce_app/widgets/product_list_widget.dart';
import 'package:a_commerce_app/widgets/search_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Container(
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery address',
                    style: GoogleFonts.inter(
                      color: Colors.grey[400],
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Salatiga City, Central Java',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 12),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.shopping_cart, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.notification, size: 30),
                ),
              ],
            ),
          ),
          SearchHomeWidget(),
          BannerWidget(),
          CategoryWidget(),
          FilterRecordWidget(),
          ProductListWidget(),
        ],
      ),
    );
  }
}

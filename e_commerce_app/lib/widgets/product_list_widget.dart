import 'package:a_commerce_app/models/home_models/products/product_model.dart';
import 'package:a_commerce_app/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({super.key});
  final productList = ProductListModel().productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 8,
          mainAxisExtent: 217,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductPage(product: productList[index]),
              ),
            );
          },

          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffFAFAFC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Image(image: AssetImage(productList[index].img)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList[index].name,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$${productList[index].price}',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xff67C4A7), // لون الزر
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                      ),
                    ),
                    child: Text(
                      'Add to cart',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

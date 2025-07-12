import 'package:a_commerce_app/models/home_models/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text(
          'Details product',
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Iconsax.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image show
            SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage(product.img),
                fit: BoxFit.fitWidth,
              ),
            ),

            // Name of Product, Price and Number people of Buyer this product
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${product.price}',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '( ${product.peopleBuy} people buy this )',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff393F42),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Iconsax.heart, size: 40),
                ],
              ),
            ),

            // colors of this Product
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose the color',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff939393),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 41,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.colors.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 41,
                          width: 61,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(
                                  0,
                                  1,
                                ), // changes position of shadow
                              ),
                            ],
                            color: product.colors[index],
                            borderRadius: BorderRadius.circular(5),
                            border: Border(
                              top: BorderSide(
                                color: Color(0xffFFFFFF),
                                width: 2,
                              ),
                              bottom: BorderSide(color: Color(0xffFFFFFF)),
                              left: BorderSide(color: Color(0xffFFFFFF)),
                              right: BorderSide(color: Color(0xffFFFFFF)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),
            Divider(thickness: 1, height: 0, indent: 20, endIndent: 20, color: Color(0xffF0F2F1),),
            // Owner info
            ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage(product.owner.img),
                  radius: 20,
                ),
              ),
              title: Text(product.owner.name),
              subtitle: Text('Owner this product'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Follow',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff393F42),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(0),
                  side: MaterialStateProperty.all(
                    BorderSide(width: 1, color: Color(0xffD9D9D9)),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  ),
                ),
              ),
            ),
            Divider(thickness: 1, height: 0.1, indent: 20, endIndent: 20, color: Color(0xffF0F2F1),),
            SizedBox(height: 12),

            // Discription info show
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description of product',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff393F42),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.description,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff393F42),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 100,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xffF0F2F1))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add to Cart',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff67C4A7)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
                side: MaterialStateProperty.all(
                  BorderSide(width: 1, color: Color(0xffD9D9D9)),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 45, vertical: 14),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Buy Now',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff393F42),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xffF0F2F1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
                side: MaterialStateProperty.all(
                  BorderSide(width: 1, color: Color(0xffD9D9D9)),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 45, vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

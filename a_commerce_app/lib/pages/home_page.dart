import 'package:a_commerce_app/widgets/body_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(),
      bottomNavigationBar: Container(
        
        height: 90,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xffF0F2F1))),
          // color: Color(0xffF0F2F1),
        ),
        child: GNav(
          tabs: [
            GButton(
              icon: Iconsax.home,
              text: 'Home',
              iconSize: 30,
              iconColor: Color(0xff939393),
              iconActiveColor: Color(0xff67C4A7),
              textColor: Color(0xff67C4A7),
            ),
            GButton(
              icon: Iconsax.heart,
              text: 'Wishlist',
              iconSize: 30,
              iconColor: Color(0xff939393),
              iconActiveColor: Color(0xff67C4A7),
              textColor: Color(0xff67C4A7),
            ),
            GButton(
              icon: Iconsax.document_text_1,
              text: 'History',
              iconSize: 30,
              iconColor: Color(0xff939393),
              iconActiveColor: Color(0xff67C4A7),
              textColor: Color(0xff67C4A7),
            ),
            GButton(
              onPressed: (){},
              icon: Icons.person_outline,
              text: 'Account',
              iconSize: 40,
              iconColor: Color(0xff939393),
              iconActiveColor: Color(0xff67C4A7),
              textColor: Color(0xff67C4A7),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/models/screens.dart';
import 'package:ecommerce_app/pages/home_screens/cart_screen.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Screens>(
      builder: (context, page, child) {
        return GNav(
          onTabChange: (value) => page.changePage(value),
          backgroundColor: Colors.black,
          padding: EdgeInsetsGeometry.all(30),
          tabMargin: EdgeInsetsGeometry.all(4),
          tabs: [
            GButton(                          
              gap: 8,
              icon: Icons.home,
              text: "Home",
              iconColor: Colors.white,
              // hoverColor: Colors.white,
              textColor: Colors.white,
              iconActiveColor: Colors.white,
            ),
            GButton(
              gap: 8,
              icon: Icons.shopping_cart,
              text: "Cart",
              iconColor: Colors.white,
              // hoverColor: Colors.white,
              textColor: Colors.white,
              iconActiveColor: Colors.white,
              
            ),
            GButton(
              gap: 8,
              icon: Icons.person,
              text: "Profile",
              iconColor: Colors.white,
              // hoverColor: Colors.white,
              textColor: Colors.white,
              iconActiveColor: Colors.white,
              
            ),
          ],
        );
      },
    );
  }
}

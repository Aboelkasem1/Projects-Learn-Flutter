import 'package:a_commerce_app/widgets/search_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(Icons.arrow_back),
            ),
            Expanded(child: SearchContainerWidget()),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Iconsax.shopping_cart),
            ),
          ],
        ),
        Divider(thickness: 0.5, color: Colors.grey[300]!),
      ],
    );
  }
}

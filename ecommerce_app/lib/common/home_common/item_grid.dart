import 'package:ecommerce_app/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid({super.key, required this.index, required this.value});
  final int index;
  final ItemModel value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 150,

              child: Image.asset(value.items[index].img),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text(
              value.items[index].name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '${value.items[index].price} EGP',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                value.add_to_cart(value.items[index]);
              },
              child: const Icon(Icons.add, size: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

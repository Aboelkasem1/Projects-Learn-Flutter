import 'package:ecommerce_app/common/home_common/home_nav_bar.dart';
import 'package:ecommerce_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.shopping_cart_rounded),
                  Text("${value.count}"),
                ],
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: value.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.asset(value.items[index].img),
                  title: Text(value.items[index].name),
                  subtitle: Text(value.items[index].price.toString()),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(50, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      value.add_to_cart(value.items[index]);
                    },
                    child: Icon(Icons.add, size: 40, color: Colors.white,)
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/common/home_common/home_nav_bar.dart';
import 'package:ecommerce_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(automaticallyImplyLeading: false, title: Text("Cart")),
          body: Center(
            child: value.cartitems.isEmpty
                ? Center(
                    child: Text(
                      "Cart is empty",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.cartitems.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(value.cartitems[index].name),
                              subtitle: Text(value.cartitems[index].price.toString()),
                              trailing: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  value.remove_from_cart(value.cartitems[index]);
                                },
                              ),
                            );
                          },
                        ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(     
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Text("Total Price: ", style: TextStyle(fontSize: 20),)),
                            Expanded(child: Text(value.total_price.toString(), style: TextStyle(fontSize: 20),)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                minimumSize: Size(100, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                               
                              },
                              child: Text("Pay", style: TextStyle(fontSize: 20, color: Colors.white),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            
          ),
        );
      },
    );
  }
}

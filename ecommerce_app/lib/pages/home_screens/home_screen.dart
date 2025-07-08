import 'package:ecommerce_app/common/home_common/home_nav_bar.dart';
import 'package:ecommerce_app/common/home_common/item_grid.dart';
import 'package:ecommerce_app/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),

          automaticallyImplyLeading: false,
          title: Text("Home"),
          toolbarHeight: 50,
          centerTitle: true,

          elevation: 0,
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'Aboelkasem Elsayed',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                accountEmail: Text('aboelkasem8088@gmail.com', style: TextStyle(color: Colors.grey[900]),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/myPhoto.jpg',
                  ),
                ),
                decoration: BoxDecoration(color: Colors.blue[200]),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Account'),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout', style: TextStyle(color: Colors.red)),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: value.items.length,
              itemBuilder: (context, index) {
                return ItemGrid(index: index, value: value);
              },
            ),
          ),
        ),
      ),
    );
  }
}

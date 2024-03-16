// mydrawer.dart
import 'package:ecommerce/Components/mylisttile.dart';
import 'package:ecommerce/pages/profilepage.dart';  // Import the profile page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag_sharp,
                  size: 70,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              MyListTile(
                text: "Profile",  // Add profile menu item
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profilepage');
                },
              ),
              // shop title
              SizedBox(height: 15),
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cartpage');
                },
              ),
              SizedBox(height: 15,),
              MyListTile(text: "Shop", icon: Icons.home, onTap: () => Navigator.pop(context)),





            ],
          ),
          // drawer header

          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: MyListTile(
              text: "Exit",
              icon: Icons.exit_to_app,
              onTap: () =>
                  Navigator.pushNamedAndRemoveUntil(context, '/intropages', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}

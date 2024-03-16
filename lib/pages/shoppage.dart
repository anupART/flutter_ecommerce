// shoppage.dart
import 'package:ecommerce/Components/myproducttile.dart';
import 'package:ecommerce/Components/mydrawer.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late List<Product> displayedProducts;
  TextEditingController searchController = TextEditingController();
  bool isSearchActive = false;

  @override
  void initState() {
    displayedProducts = context.read<Shop>().shop;
    super.initState();
  }

  void _searchProducts(String query) {
    setState(() {
      displayedProducts = context
          .read<Shop>()
          .shop
          .where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleSearch() {
    setState(() {
      isSearchActive = !isSearchActive;
      if (!isSearchActive) {
        searchController.clear();
        _searchProducts('');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = displayedProducts;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: isSearchActive
            ? TextField(
          controller: searchController,
          onChanged: _searchProducts,
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
                _searchProducts('');
              },
            ),
          ),
        )
            : Text("Shop Page",style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          // Search icon to toggle search
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _toggleSearch,
          ),
          // Go to cart button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cartpage'),
            icon: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          SizedBox(height: 25),
          Center(
            child: Text(
              "Pick an item from the list",
              style: TextStyle(
              // fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  // Get each individual product from the shop
                  final product = products[index];

                  // Return as a product
                  return MyProductTile(product: product);
                }),
          ),
        ],
      ),
    );
  }
}

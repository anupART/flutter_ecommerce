
// import 'dart:ffi';

import 'package:ecommerce/Components/my_buttton.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  //remove item cart

  void removeitemFromcart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item from your cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              // Remove from cart
              context.read<Shop>().removeFromCart(product);
              // Close the dialog
              Navigator.pop(context);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }
  //user pressed pay button
  void payButtonPressed(BuildContext context){
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Text("User wants to pay !"),
    ),

    );
  }

  @override
  Widget build(BuildContext context) {
    //get acces to cart
    final cart =context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor:Theme.of(context).colorScheme.inversePrimary ,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty?
           const Text("Your Cart is empty") : ListView.builder(
              itemCount: cart.length ,
              itemBuilder: (context,index){
            //get indivudul item
            final item=cart[index];

            //return as a cart
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toStringAsFixed(2)),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed:() => removeitemFromcart(context,item) ,
              ),
            );

          },
          ),
          ),

          //PAY BUTTON
         Center(
           child: Padding(
             padding: const EdgeInsets.all(40.0),
             child: MyButton(onTap:()=>payButtonPressed(context), child: Text("PAY NOW")),
           ),
         )
        ],
      ),
    );
  }
}

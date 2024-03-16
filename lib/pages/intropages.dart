
import 'package:ecommerce/Components/my_buttton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.shopping_bag_sharp,
            size: 70,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 10,),
        
            //title
            Text("Minute Shop App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
        
            ),),
        
            SizedBox(height: 5,),
        
            Text("Premium quality products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,

              ),
            ),

            SizedBox(height: 10,),

            MyButton(
                onTap: ()=> Navigator.pushNamed(context, '/shoppage'),
                child: Icon(Icons.arrow_forward,
                  size: 30,
                ))
          ],
        ),
      ),

    );
  }
}

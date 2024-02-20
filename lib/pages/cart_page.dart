import 'package:bubble_tea_tutorial/components/drink_tile.dart';
import 'package:bubble_tea_tutorial/models/drink.dart';
import 'package:bubble_tea_tutorial/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // heading
                const Text(
                  "Your Cart",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // list of cart items
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      // get individual drink in cart firsts
                      Drink individualDrink = value.cart[index];

                      // return as a nice tile
                      return DrinkTile(
                        onTapIcon: () => removeFromCart(individualDrink),
                        drink: individualDrink,
                        icon: Icons.delete,
                        iconColor: Colors.red,
                      );
                    },
                  ),
                ),

                // pay button
                MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.brown,
                  onPressed: () {},
                  child: const Text(
                    'Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

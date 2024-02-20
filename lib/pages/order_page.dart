import 'package:bubble_tea_tutorial/models/drink.dart';
import 'package:bubble_tea_tutorial/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize sweetness
  double sweetValue = .5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // customize ice
  double iceValue = .5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // customize pearls
  double pearlValue = .5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  // add drink to cart
  void addToCart(Drink drink) {
    // firstly, add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    // direct user back to shop
    Navigator.pop(context);

    // let user know it has been successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          'Successfully Added to Cart',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text(
          widget.drink.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          // drink image
          Image.asset(
            widget.drink.imapePath,
          ),

          const SizedBox(height: 25),

          // slider to customize drink
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // sweetness slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: Text("Sweet"),
                      width: 100,
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.brown,
                        thumbColor: Colors.brown,
                        label: sweetValue.toString(),
                        value: sweetValue,
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    ),
                  ],
                ),

                // ice slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text("Ice"),
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.brown,
                        thumbColor: Colors.brown,
                        label: iceValue.toString(),
                        value: iceValue,
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                      ),
                    ),
                  ],
                ),

                // pearls slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: Text("Peerls"),
                      width: 100,
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.brown,
                        thumbColor: Colors.brown,
                        label: pearlValue.toString(),
                        value: pearlValue,
                        divisions: 4,
                        onChanged: (value) => customizePearl(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // add to cart button
          MaterialButton(
            color: Colors.brown,
            onPressed: () => addToCart(widget.drink),
            child: const Text(
              "Add To Cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

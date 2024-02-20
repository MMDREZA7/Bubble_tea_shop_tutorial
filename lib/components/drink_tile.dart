import 'package:bubble_tea_tutorial/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final icon;
  final iconColor;
  final void Function()? onTapIcon;

  const DrinkTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.drink,
    required this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapIcon,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.brown[100],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: ListTile(
          leading: Image.asset(drink.imapePath),
          title: Text(
            drink.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            drink.price,
          ),
          trailing: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

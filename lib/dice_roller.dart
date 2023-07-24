import 'dart:math';
import 'package:flutter/material.dart';

final randomNumber = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  bool isWon = false;
  var diceNumber = 2;

  void rollDice() {
    setState(() {
      diceNumber = randomNumber.nextInt(6) + 1;
      if (diceNumber != 6) {
        isWon = false;
      } else {
        isWon = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/dice-$diceNumber.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white70,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
            ),
          ),
          child: const Text(
            'Roll Dice',
          ),
        ),
        isWon == true
            ? const Text(
                'You Won',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                ),
              )
            : const Text(
                'Try Agin',
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
      ],
    );
  }
}

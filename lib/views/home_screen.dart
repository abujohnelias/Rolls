import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //

  //?
  var curretDiceRoll = 1;

  //?
  void rollDice() {
    setState(() {
      curretDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              //

              //?dice
              Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * .1,
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/dice$curretDiceRoll.png",
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),

              //?button
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .1,
                ),
                child: InkWell(
                  onTap: rollDice,
                  child: Image.asset(
                    'assets/images/diceroll.png',
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

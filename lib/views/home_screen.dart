import 'dart:math';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

final randomizer = Random();

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //

  //?
  var curretDiceRoll = 1;

  //?

  late AnimationController _animationController;
  bool isAnimationPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  void rollDice() {
    setState(() {
      curretDiceRoll = randomizer.nextInt(6) + 1;
      isAnimationPlaying = true;
      _animationController.forward(from: 0.0);
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

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                // padding: EdgeInsets.only(
                //   top: MediaQuery.of(context).size.width * .1,
                // ),
                child: InkWell(
                  onTap: rollDice,
                  child: Column(
                    children: [
                      Lottie.asset(
                        'assets/animations/Animation - 1702296912103.json',
                        width: MediaQuery.of(context).size.width * 0.1,
                        controller: _animationController,
                        onLoaded: (composition) {
                          _animationController.duration = composition.duration;
                        },
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

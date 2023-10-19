import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../common/animated_button.dart';
import 'homepage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('lib/assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: SizedBox(),
            ),
          ),
          RiveAnimation.asset('lib/assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: SizedBox(),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                const SizedBox(
                  width: 500,
                  child: Row(
                    children: [
                      Text(
                        "Newsi",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: 'Intel',
                        ),
                      ),
                      Text(
                        "fy",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 60,
                            fontFamily: 'Intel',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                Text(
                  'The ideal time to read is now,\n so go slowly and read a bit more\n of this world.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 280),
                AnimatedBtn(
                  btnAnimationController: _btnAnimationController,
                  press: () {
                    _btnAnimationController.isActive = true;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                      "Newsify has access to breaking news, trending news, and news from five different countries.",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

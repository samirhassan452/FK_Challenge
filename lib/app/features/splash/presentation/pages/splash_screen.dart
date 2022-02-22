import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, Constants, RoutesNames;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiMode, SystemUiOverlay;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // create controller to control animation
  late AnimationController _controller;
  // create tween animation to start from 0.0 to 1.0
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // fire the animation
    _controller.forward();

    // add listener to check if animation is completed, then go to home page
    // and fetch visual notes from db
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacementNamed(
          RoutesNames.bottomNavigationRoute,
        );
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    // remove listener when close page
    _controller.removeStatusListener((status) {});
    // dispose the animation when close page
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blueBlack1,
      body: Center(
        child: FadeTransition(
          // play with opacity based current animation value
          opacity: _fadeIn,
          child: Image.asset(
            Constants.textLogoImg,
            width: size.width < 300 ? 200 : 250,
            // height: size.height < 450 ? 200 : 250,
          ),
        ),
      ),
    );
  }
}

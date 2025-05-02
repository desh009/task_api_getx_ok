import 'package:api_getx/controllers/auth_controllers.dart';
import 'package:api_getx/screens/login_screen.dart';
import 'package:api_getx/screens/main_bottom_nav_bar.dart';
import 'package:api_getx/utils/asset_path.dart';
import 'package:api_getx/widgets/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    final bool isLoggedIn = await AuthController.checkIfUserLoggedIn();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isLoggedIn ? const MainBottomNavScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            AssetsPath.logoSvg,
            width: 120,
          ),
        ),
      ),
    );
  }
}
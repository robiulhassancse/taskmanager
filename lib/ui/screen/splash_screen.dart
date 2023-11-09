import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager/ui/data/model/auth_utility.dart';
import 'package:taskmanager/ui/screen/bottom_nav_base_screen.dart';
import 'package:taskmanager/ui/screen/login_screen.dart';
import 'package:taskmanager/ui/utils/assets_utils.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLoginPage();
  }

  void navigateToLoginPage() {
    Future.delayed(Duration(seconds: 3)).then((_) async {
      final bool isLoggin = await AuthUtility.checkIfUserLogin();
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isLoggin ? BottomNavScreen() : LoginScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            AssetsUtils.logoSVG,
            width: 90,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}

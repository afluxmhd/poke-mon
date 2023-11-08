import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poke_man/controllers/pokemon_controller.dart';
import 'package:poke_man/routes/app_routes.dart';
import 'package:poke_man/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> _loadResources() async {
    return await Get.find<PokemonController>().getPokemonList();
  }

  double timeLeft = 0;

  @override
  void initState() {
    _loadResources().then((value) {
      if (value) {
        Get.toNamed(AppRoutes.getInitialScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          Center(
            child: SizedBox(
              height: 200.h,
              width: 200.w,
              child: Image.asset('assets/splash_screen_image.png'),
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: 180.w,
            child: const LinearProgressIndicator(),
          ),
          SizedBox(height: 16.h),
          GetBuilder<PokemonController>(builder: (controller) {
            return Text(controller.status, style: const TextStyle(fontSize: 12));
          })
        ],
      ),
    );
  }
}

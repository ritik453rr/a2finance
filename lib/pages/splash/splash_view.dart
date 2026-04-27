import 'package:a2finance/common/app_colors.dart';
import 'package:a2finance/common/app_fonts.dart';
import 'package:a2finance/common/app_fontsizes.dart';
import 'package:a2finance/common/assets.dart';
import 'package:a2finance/common/common_ui.dart';
import 'package:a2finance/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean background
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo / Icon placeholder
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.c4E0F8F,
                  shape: BoxShape.circle,
                ),
                child: 
                Image.asset(Assets.pngHrBookLogo),
              ),

              const SizedBox(height: 24),

              // Animated Text
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingScaleUp(
                  duration: const Duration(milliseconds: 1800),
                  curve: Curves.easeInOut,
                ),
                child: Text(
                  "HR BOOK",
                  style: CommonUi.customTextStyle(
                    fontFamily: AppFonts.medium,
                    fontSize: AppFontSizes.font30,
                    color: AppColors.c4E0F8F,
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

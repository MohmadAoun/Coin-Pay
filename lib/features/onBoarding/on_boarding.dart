import 'package:coin_pay/core/helpers/spacing.dart';
import 'package:coin_pay/core/theming/colors.dart';
import 'package:coin_pay/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final FlutterCarouselController flutterCarouselController =
      FlutterCarouselController();
  int currentIndex = 0;

  // List of SVGs and their corresponding text
  final List<Map<String, String>> onboardingItems = [
    {
      'image': 'assets/svgs/on_boarding_step_one.svg',
      'text': 'Spend money abroad, and track your expense',
    },
    {
      'image': 'assets/svgs/on_boarding_step_two.svg',
      'text': 'Secure and easy transactions worldwide',
    },
    {
      'image': 'assets/svgs/on_boarding_step_three.svg',
      'text': 'Experience seamless payment options anytime',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterCarousel(
              options: FlutterCarouselOptions(
                height: 260.h,
                enableInfiniteScroll: false,
                initialPage: 0,
                controller: flutterCarouselController,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: onboardingItems.map((item) {
                return SvgPicture.asset(
                  item['image']!,
                  height: 260.h,
                );
              }).toList(),
            ),
            verticalSpace(89),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: onboardingItems.length,
              effect: SlideEffect(
                spacing: 6.w,
                radius: 19.r,
                dotWidth: 37.w,
                dotHeight: 8.h,
                strokeWidth: 1.5,
                dotColor: ColorsManager.neutralGrey,
                activeDotColor: ColorsManager.mainBlue,
                type: SlideType.normal,
              ),
            ),
            verticalSpace(22),
            // Display dynamic text based on the currentIndex
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 17.5.w),
              margin: EdgeInsets.symmetric(vertical: 8.w),
              child: Text(
                onboardingItems[currentIndex]['text']!,
                textAlign: TextAlign.center,
                style: TextStyles.font41Black700Weight,
              ),
            ),
            verticalSpace(72),
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size(360.w, 56.h),
                backgroundColor: ColorsManager.mainBlue,
              ),
              onPressed: () {
                if (currentIndex < onboardingItems.length - 1) {
                  flutterCarouselController.nextPage(
                      duration: const Duration(milliseconds: 300));
                  setState(() {
                    currentIndex++;
                  });
                }
              },
              child: Text('Next', style: TextStyles.font16White700Weight),
            ),
          ],
        ),
      ),
    );
  }
}

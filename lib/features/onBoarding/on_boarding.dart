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
  @override
  Widget build(BuildContext context) {
    FlutterCarouselController flutterCarouselController =
        FlutterCarouselController();
    int currentIndex = 0;
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
                slideIndicator: CircularSlideIndicator(
                  slideIndicatorOptions: SlideIndicatorOptions(),
                class _FakeSubject extends Fake implements Subject {}),
              ),
              items: [
                SvgPicture.asset(
                  'assets/svgs/on_boarding_step_one.svg',
                ),
                SvgPicture.asset(
                  'assets/svgs/on_boarding_step_two.svg',
                ),
                SvgPicture.asset(
                  'assets/svgs/on_boarding_step_three.svg',
                ),
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: i,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            verticalSpace(89),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: 3,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 17.5.w),
              margin: EdgeInsets.symmetric(vertical: 8.w),
              child: Text(
                'Spend money abroad, and track your expense',
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
                print('click');
                flutterCarouselController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
                setState(() {});
              },
              child: Text('Next', style: TextStyles.font16White700Weight),
            ),
          ],
        ),
      ),
    );
  }
}

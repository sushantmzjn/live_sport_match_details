import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sports_app/features/onboarding_page/presentation/ui/onboard_screen_pages/first_page.dart';
import 'package:sports_app/features/onboarding_page/presentation/ui/onboard_screen_pages/second_page.dart';
import 'package:sports_app/features/onboarding_page/presentation/ui/onboard_screen_pages/third_page.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  bool onLastPage = false;
  static final List<Widget> onBoardScreens = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  onLastPage = value == 2;
                });
              },
              children: onBoardScreens,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top / 0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sports App',
                    style: TextStyle(fontSize: 26.sp),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30.w,
              left: 20.w,
              right: 20.w,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                        effect: WormEffect(
                            dotHeight: 4.h,
                            dotWidth: 22.w,
                            activeDotColor: Colors.black,
                            dotColor: Colors.grey),
                        controller: controller,
                        count: onBoardScreens.length),
                    ElevatedButton(
                      onPressed: () async {
                        if (onLastPage) {
                          await Hive.box('board').clear();
                          await Hive.box('board').put('key', true);
                          // Navigator.of(context).pushReplacement(
                          //     CupertinoPageRoute(
                          //         builder: (context) => const HomePage()));
                        } else {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.w),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.w)),
                        minimumSize: Size(35.w, 35.h),
                        backgroundColor: Colors.black.withOpacity(0.75),
                      ),
                      child: onLastPage
                          ? const Text(
                              'Let\'s Go',
                              style: TextStyle(color: Colors.white),
                            )
                          : Icon(
                              CupertinoIcons.right_chevron,
                              color: Colors.white,
                              size: 20.w,
                            ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

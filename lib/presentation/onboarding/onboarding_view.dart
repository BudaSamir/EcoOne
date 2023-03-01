import 'package:eco_one/presentation/resources/assets_manager.dart';
import 'package:eco_one/presentation/resources/color_manager.dart';
import 'package:eco_one/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderInstance> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<SliderInstance> _getSliderData() => [
        SliderInstance(
            title: AppStrings.onBoardingTitle1,
            subTitle: AppStrings.onBoardingSubTitle1,
            image: ImageAssets.onboardinglogo1),
        SliderInstance(
            title: AppStrings.onBoardingTitle2,
            subTitle: AppStrings.onBoardingSubTitle2,
            image: ImageAssets.onboardinglogo2),
        SliderInstance(
            title: AppStrings.onBoardingTitle3,
            subTitle: AppStrings.onBoardingSubTitle3,
            image: ImageAssets.onboardinglogo3),
        SliderInstance(
            title: AppStrings.onBoardingTitle4,
            subTitle: AppStrings.onBoardingSubTitle4,
            image: ImageAssets.onboardinglogo4),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
          // Phone Status Bar Style while App Running
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark)),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          itemBuilder: ((context, index) {
            return Container();
          })),
    );
  }
}

class SliderInstance {
  String title;
  String subTitle;
  String image;

  SliderInstance(
      {required this.title, required this.image, required this.subTitle});
}

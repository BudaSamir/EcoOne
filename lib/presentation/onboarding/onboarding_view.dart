import 'package:eco_one/presentation/resources/assets_manager.dart';
import 'package:eco_one/presentation/resources/color_manager.dart';
import 'package:eco_one/presentation/resources/constants_manager.dart';
import 'package:eco_one/presentation/resources/routes_manager.dart';
import 'package:eco_one/presentation/resources/strings_manager.dart';
import 'package:eco_one/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark)),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          itemBuilder: ((context, index) {
            return OnBoarding(_list[index]);
          })),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.end,
                  )),
            ),
            _getBottomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: GestureDetector(
              onTap: (() {
                _pageController.animateToPage(_getPreviousPage(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderDuration),
                    curve: Curves.bounceInOut);
              }),
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIcon),
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: GestureDetector(
              onTap: (() {
                _pageController.animateToPage(_getNextPage(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderDuration),
                    curve: Curves.bounceInOut);
              }),
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIcon),
              ),
            ),
          )
        ],
      ),
    );
  }

  int _getPreviousPage() {
    int previousPage = --_currentIndex;
    if (previousPage == -1) {
      previousPage = _list.length - 1;
    }
    return previousPage;
  }

  int _getNextPage() {
    int nextPage = ++_currentIndex;
    if (nextPage == _list.length) {
      nextPage = 0;
    }
    return nextPage;
  }

  Widget _getProperCircle(int page) {
    if (page == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIcon);
    } else {
      return SvgPicture.asset(ImageAssets.solidCirlceIcon);
    }
  }
}

class OnBoarding extends StatelessWidget {
  final SliderInstance _sliderInstance;
  const OnBoarding(this._sliderInstance, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              _sliderInstance.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            )),
        Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              _sliderInstance.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            )),
        const SizedBox(height: AppSize.s40),
        SvgPicture.asset(_sliderInstance.image)
      ],
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

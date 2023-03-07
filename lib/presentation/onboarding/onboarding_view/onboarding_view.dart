import 'package:eco_one/domain/models.dart';
import 'package:eco_one/presentation/onboarding/onboarding_viewmodel/onboarding_viewmodel.dart';
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
  final PageController _pageController = PageController();
  final OnboardingViewModel _viewModel = OnboardingViewModel();
  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _viewModel.outSliderViewInstance,
        builder: ((context, snapshot) => _getContentWidget(snapshot.data)));
  }

  Widget _getContentWidget(SliderViewInstance? data) {
    if (data == null) {
      return Container();
    } else {
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
            itemCount: data.numOfSlides,
            onPageChanged: (value) {
              _viewModel.onPageChanged(value);
            },
            itemBuilder: ((context, index) {
              return OnBoarding(data.sliderInstance);
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
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                    },
                    child: Text(
                      AppStrings.skip,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.end,
                    )),
              ),
              _getBottomSheetWidget(data)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewInstance data) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: GestureDetector(
              onTap: (() {
                _pageController.animateToPage(_viewModel.goPreviousSlider(),
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
              for (int i = 0; i < data.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, data.currentIndex),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: GestureDetector(
              onTap: (() {
                _pageController.animateToPage(_viewModel.goNextSlider(),
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

  Widget _getProperCircle(int page, int currentIndex) {
    if (page == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIcon);
    } else {
      return SvgPicture.asset(ImageAssets.solidCirlceIcon);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
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

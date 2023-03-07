import 'dart:async';

import 'package:eco_one/domain/models.dart';
import 'package:eco_one/presentation/base/baseviewmodel.dart';
import 'package:eco_one/presentation/resources/assets_manager.dart';
import 'package:eco_one/presentation/resources/strings_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewInstance>();
  late final List<SliderInstance> _list;
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
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView(); // defualt PAGE = 0
  }

  @override
  int goNextSlider() {
    int nextPage = ++_currentIndex;
    if (nextPage == _list.length) {
      nextPage = 0;
    }
    return nextPage;
  }

  @override
  int goPreviousSlider() {
    int previousPage = --_currentIndex;
    if (previousPage == -1) {
      previousPage = _list.length - 1;
    }
    return previousPage;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  void _postDataToView() {
    inputSliderViewInstance.add(
        SliderViewInstance(_list[_currentIndex], _list.length, _currentIndex));
  }

  @override
  Sink get inputSliderViewInstance => _streamController.sink;

  @override
  Stream<SliderViewInstance> get outSliderViewInstance =>
      _streamController.stream.map((sliderViewInstance) => sliderViewInstance);
}

/* 
* Special View Model Inputs 
*/
abstract class OnboardingViewModelInputs {
  int goNextSlider();
  int goPreviousSlider();
  void onPageChanged(int index);

  Sink get inputSliderViewInstance;
}

/* 
* Special View Model Outputs 
*/
abstract class OnboardingViewModelOutputs {
  Stream<SliderViewInstance> get outSliderViewInstance;
}

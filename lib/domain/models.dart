// the bluePrint for Onboard Sliders
class SliderInstance {
  String title;
  String subTitle;
  String image;

  SliderInstance(
      {required this.title, required this.image, required this.subTitle});
}

// the OnBoarding Sliders All Data
class SliderViewInstance {
  SliderInstance sliderInstance;
  int numOfSlides;
  int currentIndex;
  SliderViewInstance(this.sliderInstance, this.numOfSlides, this.currentIndex);
}

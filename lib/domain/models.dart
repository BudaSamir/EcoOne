// OnBoarding Screen Models
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

/*
  *****************
  * Login Models  *
  *****************
*/
class Customer {
  String id;

  String name;

  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  int phone;

  String email;

  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer customer;
  Contacts contacts;

  Authentication(this.customer, this.contacts);
}

class SlideDao{
  String imagePath;
  String title;
  String desc;

  SlideDao(this.imagePath, this.title, this.desc);
}

List<SlideDao> getSlides(){
  List<SlideDao> list = List();

  list
    ..add(SlideDao("assets/images/montly_service.png", "Select monthly service pack", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."))
    ..add(SlideDao("assets/images/add_on.png", "Select add on services", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."))
    ..add(SlideDao("assets/images/confirm_booking.png", "Confirming your booking", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."))
    ..add(SlideDao("assets/images/town.png", "Washer on your door on time", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."));
  return list;
}
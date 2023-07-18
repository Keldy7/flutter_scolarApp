import 'package:scolar_pay/app/utils/routes.dart';

import '../ui/models/model_banner.dart';
import '../ui/models/model_bottom_nav.dart';
import '../ui/models/model_category.dart';
import '../ui/models/model_intro.dart';
import '../utils/label_keys.dart';

class FakeData {

static List<ModelIntro> getAllIntroList() {
    List<ModelIntro> list = [];
    list.add(ModelIntro(
        "Discover and book your\nfavorite hair stylist !",
        "Schedule your date,time for your\nbeauty session in your favourite salon.",
        "intro1.png"));

    list.add(ModelIntro(
        "Helping you to take good\ncare of your Hair !",
        "With the help of our best stylist create\nyour own look.",
        "intro2.png"));

    list.add(ModelIntro(
        "Find your nearst salon in\nyour area !",
        "Set your location and find nearst salon\nto papmer you.",
        "intro3.png"));

    // list.add(ModelIntro(
    //     "Confirm your bookind and\nmake secure pay",
    //     "When making time for beauty and\nwellness is already a challenge.",
    //     "intro4.png"));

    return list;
  }
  
   static List<ModelBottomNav> getAllBottomNavList() {
    List<ModelBottomNav> bottomList = [];

    bottomList.add(ModelBottomNav(accueilKey, "home.svg", "home_active.svg"));
    bottomList.add(ModelBottomNav(calendarKey, "save.svg", "save_active.svg"));
    bottomList.add(ModelBottomNav(profileKey, "profile.svg", "user_active.svg"));

    return bottomList;
  }

  static List<ModelBanner> getAllBannerList() {
    List<ModelBanner> list = [];

    list.add(ModelBanner("banner1.png", "#D9EEF9"));
    list.add(ModelBanner("banner2.png", "#FFE4EE"));
    list.add(ModelBanner("banner3.png", "#F0E4FF"));

    return list;
  }

  static List<ModelCategory> getAllCategoryList() {
    List<ModelCategory> catList = [];

    catList.add(ModelCategory(attendanceKey, "cat6.jpg", Routes.homeScreenRoute));
    catList.add(ModelCategory(feesKey, "cat7.jpg", Routes.homeScreenRoute));
    catList.add(ModelCategory(permissionsKey, "cat1.png", Routes.permissionsScreenRoute));

    return catList;
  }
}
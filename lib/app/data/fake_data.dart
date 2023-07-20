import 'package:scolar_pay/app/utils/image_keys.dart';
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
        Images.intro1Png));

    list.add(ModelIntro(
        "Helping you to take good\ncare of your Hair !",
        "With the help of our best stylist create\nyour own look.",
        Images.intro2Png));

    list.add(ModelIntro(
        "Find your nearst salon in\nyour area !",
        "Set your location and find nearst salon\nto papmer you.",
        Images.intro3Png));

    // list.add(ModelIntro(
    //     "Confirm your bookind and\nmake secure pay",
    //     "When making time for beauty and\nwellness is already a challenge.",
    //     Images.intro4Png));

    return list;
  }

  static List<ModelBottomNav> getAllBottomNavList() {
    List<ModelBottomNav> bottomList = [];

    bottomList.add(ModelBottomNav(
        Labels.accueilKey,
        Images.homeSvg,
        Images.homeActiveSvg));
    bottomList.add(ModelBottomNav(
        Labels.calendarKey,
        Images.saveSvg,
        Images.saveActiveSvg));
    bottomList.add(ModelBottomNav(
        Labels.profilKey,
        Images.profileSvg,
        Images.userActiveSvg));

    return bottomList;
  }

  static List<ModelBanner> getAllBannerList() {
    List<ModelBanner> list = [];

    list.add(ModelBanner(
        Images.banner1Png, "#D9EEF9"));
    list.add(ModelBanner(
        Images.banner2Png, "#FFE4EE"));
    list.add(ModelBanner(
        Images.banner3Png, "#F0E4FF"));

    return list;
  }

  static List<ModelCategory> getAllCategoryList() {
    List<ModelCategory> catList = [];

    catList.add(ModelCategory(
        Labels.attendanceKey,
        Images.attendanceSvg,
        Routes.attendanceScreenRoute));
    catList.add(ModelCategory(
        Labels.timetableKey,
        Images.timetableSvg,
        Routes.homeScreenRoute));
    catList.add(ModelCategory(
        Labels.feesKey,
        Images.feesSvg,
        Routes.homeScreenRoute));
    catList.add(ModelCategory(
        Labels.examsKey,
        Images.examsSvg,
        Routes.examsScreenRoute));
    catList.add(ModelCategory(
        Labels.permissionsAbsenceKey,
        Images.distanceSvg,
        Routes.permissionsScreenRoute));

    return catList;
  }
}

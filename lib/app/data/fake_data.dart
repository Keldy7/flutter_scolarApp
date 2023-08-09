import 'package:flutter/material.dart';
import 'package:scolar_pay/app/ui/models/model_fees.dart';
import 'package:scolar_pay/app/utils/image_keys.dart';
import 'package:scolar_pay/app/utils/routes.dart';

import '../ui/models/model_banner.dart';
import '../ui/models/model_bottom_nav.dart';
import '../ui/models/model_category.dart';
import '../ui/models/model_intro.dart';
import '../ui/models/model_options_contact_us.dart';
import '../ui/models/model_payment.dart';
import '../utils/label_keys.dart';

class FakeData {
  static List<ModelIntro> getAllIntroList() {
    List<ModelIntro> introList = [];
    introList.add(ModelIntro(
        "Discover and book your\nfavorite hair stylist !",
        "Schedule your date,time for your\nbeauty session in your favourite salon.",
        Images.intro1Png));

    introList.add(ModelIntro(
        "Helping you to take good\ncare of your Hair !",
        "With the help of our best stylist create\nyour own look.",
        Images.intro2Png));

    introList.add(ModelIntro(
        "Find your nearst salon in\nyour area !",
        "Set your location and find nearst salon\nto papmer you.",
        Images.intro3Png));

    // introList.add(ModelIntro(
    //     "Confirm your bookind and\nmake secure pay",
    //     "When making time for beauty and\nwellness is already a challenge.",
    //     Images.intro4Png));

    return introList;
  }

  static List<ModelBottomNav> getAllBottomNavList() {
    List<ModelBottomNav> bottomList = [];

    bottomList.add(ModelBottomNav(
        Labels.accueilKey, Images.homeSvg, Images.homeActiveSvg));
    bottomList.add(
        ModelBottomNav(Labels.eventsKey, Images.saveSvg, Images.saveActiveSvg));
    bottomList.add(ModelBottomNav(
        Labels.aProximiteKey, Images.locationSvg, Images.locationActiveSvg));
    bottomList.add(ModelBottomNav(
        Labels.profilKey, Images.profileSvg, Images.userActiveSvg));

    return bottomList;
  }

  static List<ModelBanner> getAllBannerList() {
    List<ModelBanner> bannerList = [];

    bannerList.add(ModelBanner(Images.banner1Png, "#D9EEF9"));
    bannerList.add(ModelBanner(Images.banner2Png, "#FFE4EE"));
    bannerList.add(ModelBanner(Images.banner3Png, "#F0E4FF"));

    return bannerList;
  }

  static List<Fees> getAllFeesList() {
    List<Fees> matList = [];

    matList.add(Fees(name: "Transport", amount: 2));
    matList.add(Fees(name: "Cantine", amount: 10));
    matList.add(Fees(name: "1er versement", amount: 25));
    matList.add(Fees(name: "2ème versement", amount: 25));
    matList.add(Fees(name: "3ème versement", amount: 15));

    return matList;
  }

  static List<ModelCategory> getAllCategoryList() {
    List<ModelCategory> catList = [];

    catList.add(ModelCategory(Labels.attendanceKey, Images.attendanceSvg,
        Routes.attendanceScreenRoute));
    catList.add(ModelCategory(
        Labels.enseignantsKey, Images.teacherSvg, Routes.teachersScreenRoute));
    catList.add(ModelCategory(
        Labels.timetableKey, Images.timetableSvg, Routes.homeScreenRoute));
    catList.add(
        ModelCategory(Labels.feesKey, Images.feesSvg, Routes.feesScreenRoute));
    catList.add(ModelCategory(
        Labels.examsKey, Images.examsSvg, Routes.examsScreenRoute));
    catList.add(ModelCategory(Labels.permissionsAbsenceKey, Images.distanceSvg,
        Routes.permissionsScreenRoute));

    return catList;
  }

  static List<ModelOptions> getAllOptionsList() {
    List<ModelOptions> optionsList = [];

    optionsList
        .add(ModelOptions(Icons.headset_mic_rounded, Labels.serviceClientKey));
    optionsList
        .add(ModelOptions(Icons.g_translate_outlined, Labels.websiteKey));
    optionsList.add(ModelOptions(Icons.wordpress_rounded, Labels.whatsappKey));
    optionsList.add(ModelOptions(Icons.facebook, Labels.facebookKey));

    return optionsList;
  }

  static List<ModelPayment> getAllPaymentList() {
    List<ModelPayment> paymentList = [];

    paymentList.add(ModelPayment(Images.moovLogoPng, Labels.moowMoneyKey));
    paymentList.add(ModelPayment(Images.mtnLogoPng, Labels.mtnMoneyKey));
    paymentList.add(ModelPayment(Images.orangeLogoPng, Labels.orangeMoneyKey));
    paymentList.add(ModelPayment(Images.waveLogoPng, Labels.waveKey));

    return paymentList;
  }
}

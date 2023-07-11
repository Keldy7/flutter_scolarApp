import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/screens/home/child/child_screen.dart';

import 'app/ui/controllers/home_controller.dart';
import 'app/ui/screens/home/home_screen.dart';
import 'app/ui/screens/intro/intro_screen.dart';
import 'app/ui/screens/intro/splash_screen.dart';
import 'app/utils/custom_scroll_behavior.dart';
import 'app/utils/routes.dart';
import 'app/utils/label_keys.dart';
import 'app/utils/store_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   S.delegate,
      // ],
      title: nomAppKey,
      initialBinding: StoreBinding(),
      initialRoute: "/",
      theme: controller.theme,
      // themeMode: (darkThemeProvider.darkMode) ? ThemeMode.dark : ThemeMode.light,
      routes: {
        "/": (context) => SplashScreen(),
        Routes.splashRoute: (context) => SplashScreen(),
        Routes.introRoute: (context) => IntroScreen(),
        // Routes.loginRoute: (context) => LoginScreen(),
        // Routes.forgotPassRoute: (context) => ForgotPasswordScreen(),
        // Routes.resetPassRoute: (context) => ResetPasswordScreen(),
        // Routes.registrationRoute: (context) => RegistrationScreen(),
        // Routes.phoneNumberRoute: (context) => PhoneNumberScreen(),
        // Routes.verificationScreenRoute: (context) => VerificationScreen(),
        // Routes.termNCondition: (context) => TermsNCondition(),
        Routes.homeScreenRoute: (context) => const HomeScreen(),
        // categoryScreenRoute: (context) => CategoryList(),
        // salonScreenRoute: (context) => SalonList(),
        // searchScreenRoute: (context) => SearchScreen(),
        // Routes.filterScreenRoute: (context) => FilterScreen(),
        // offerDetailScreenRoute: (context) => OfferDetailScreen(),
        Routes.childScreenRoute: (context) => const ChildScreen(),
        // Routes.serviceListRoute: (context) => ServicesList(),
        // confirmServiceListRoute: (context) => ConfirmList(),
        // Routes.paymentListRoute: (context) => PaymentList(),
        // Routes.paymentScreenRoute: (context) => PaymentScreen(),
        // bookingDetailScreenRoute: (context) => BookingDetailScreen(),
        // selectLocationRoute: (context) => SelectLocation(),
        // selectOtherLocationRoute: (context) => SelectOtherLocation(),
        // chatScreenRoute: (context) => ChatScreen(),
        // Routes.myProfileScreenRoute: (context) => MyProfileScreen(),
        // Routes.editProfileRoute: (context) => EditProfile(),
        // Routes.settingScreenRoute: (context) => SettingScreen(),
        // Routes.notificationScreenRoute: (context) => NotificationScreen(),
        // "/": (context) => controller.isLogin ? const HomeScreen() : SplashScreen()
      },
    );
  }
}

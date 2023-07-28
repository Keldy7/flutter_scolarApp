import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:scolar_pay/app/ui/screens/child/child_screen.dart';
import 'package:scolar_pay/app/ui/screens/child/edit_child_screen.dart';
import 'package:scolar_pay/app/ui/screens/exams/details_exams_screen.dart';
import 'package:scolar_pay/app/ui/screens/exams/exams_screen.dart';
import 'package:scolar_pay/app/ui/screens/permission/permission_screen.dart';
import 'app/ui/controllers/home_controller.dart';
import 'app/ui/screens/attendance/attendance_screen.dart';
import 'app/ui/screens/child/children_screen.dart';
import 'app/ui/screens/home/home_screen.dart';
import 'app/ui/screens/intro/intro_screen.dart';
import 'app/ui/screens/intro/splash_screen.dart';
// import 'app/ui/screens/login/forgot_pass_screen.dart';
import 'app/ui/screens/login/login_screen.dart';
// import 'app/ui/screens/login/phone_number_screen.dart';
import 'app/ui/screens/login/registration_screen.dart';
import 'app/ui/screens/login/reset_password_screen.dart';
import 'app/ui/screens/settings/termn_condition_screen.dart';
import 'app/ui/screens/login/verification_screen.dart';
import 'app/ui/screens/permission/add_permission_screen.dart';
import 'app/ui/screens/permission/filter_screen.dart';
import 'app/ui/screens/profile/edit_profile.dart';
import 'app/ui/screens/profile/my_profile_screen.dart';
import 'app/ui/screens/settings/settings_screen.dart';
import 'app/utils/custom_scroll_behavior.dart';
import 'app/utils/routes.dart';
import 'app/utils/label_keys.dart';
import 'app/utils/store_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());

    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('fr'), // Français
      ],
      title: Labels.nomAppKey,
      initialBinding: StoreBinding(),
      initialRoute: "/",

      theme: controller.theme,
      // themeMode: (darkThemeProvider.darkMode) ? ThemeMode.dark : ThemeMode.light,
      routes: {
        "/": (context) => SplashScreen(),
        Routes.splashRoute: (context) => SplashScreen(),
        Routes.introRoute: (context) => IntroScreen(),
        Routes.loginRoute: (context) => const LoginScreen(),
        // Routes.forgotPassRoute: (context) => ForgotPasswordScreen(),
        Routes.resetPassRoute: (context) => ResetPasswordScreen(),
        Routes.registrationRoute: (context) => const RegistrationScreen(),
        // Routes.phoneNumberRoute: (context) => const PhoneNumberScreen(),
        Routes.verificationScreenRoute: (context) => const VerificationScreen(),
        Routes.termNCondition: (context) => const TermsNCondition(),
        Routes.homeScreenRoute: (context) => const HomeScreen(),
        // categoryScreenRoute: (context) => CategoryList(),
        Routes.attendanceScreenRoute: (context) => const AttendanceScreen(),
        // searchScreenRoute: (context) => SearchScreen(),
        Routes.filterScreenRoute: (context) => FilterScreen(),
        Routes.childrenScreenRoute: (context) => const ChildrenScreen(),
        Routes.childScreenRoute: (context) => const ChildScreen(),
        Routes.editChildScreenRoute: (context) => const EditChildScreen(),
        Routes.permissionsScreenRoute: (context) => const PermissionScreen(),
        Routes.addPermissionsScreenRoute: (context) =>
            const AddPermissionScreen(),
        // confirmServiceListRoute: (context) => ConfirmList(),
        // Routes.paymentListRoute: (context) => PaymentList(),
        // Routes.paymentScreenRoute: (context) => PaymentScreen(),
        // bookingDetailScreenRoute: (context) => BookingDetailScreen(),
        // selectLocationRoute: (context) => SelectLocation(),
        // selectOtherLocationRoute: (context) => SelectOtherLocation(),
        // chatScreenRoute: (context) => ChatScreen(),
        Routes.examsScreenRoute: (context) => const ExamenScreen(),
        Routes.examsDetailScreenRoute: (context) => const DetailExamsScreen(),
        Routes.myProfileScreenRoute: (context) => const MyProfileScreen(),
        Routes.editProfileRoute: (context) => EditProfile(),
        Routes.settingScreenRoute: (context) => SettingScreen(),
        // Routes.notificationScreenRoute: (context) => NotificationScreen(),
        // "/": (context) => controller.isLogin ? const HomeScreen() : SplashScreen()
      },
    );
  }
}

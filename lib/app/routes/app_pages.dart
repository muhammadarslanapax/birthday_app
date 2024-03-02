import 'package:get/get.dart';

import '../modules/new_password/views/new_password_view.dart';
import '../modules/about_child/bindings/about_child_binding.dart';
import '../modules/about_child/views/about_child_view.dart';
import '../modules/create_account/bindings/create_account_binding.dart';
import '../modules/create_account/views/create_account_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/calender/bindings/calender_binding.dart';
import '../modules/dashboard/calender/views/calender_view.dart';
import '../modules/dashboard/home/bindings/home_binding.dart';
import '../modules/dashboard/home/views/home_view.dart';
import '../modules/dashboard/notification/bindings/notification_binding.dart';
import '../modules/dashboard/notification/views/notification_view.dart';
import '../modules/dashboard/setting/aboutUs/bindings/about_us_binding.dart';
import '../modules/dashboard/setting/aboutUs/views/about_us_view.dart';
import '../modules/dashboard/setting/bindings/setting_binding.dart';
import '../modules/dashboard/setting/contactUs/bindings/contact_us_binding.dart';
import '../modules/dashboard/setting/contactUs/views/contact_us_view.dart';
import '../modules/dashboard/setting/edit_childInfo/bindings/edit_child_info_binding.dart';
import '../modules/dashboard/setting/edit_childInfo/views/edit_child_info_view.dart';
import '../modules/dashboard/setting/privacyPolicy/bindings/privacy_policy_binding.dart';
import '../modules/dashboard/setting/privacyPolicy/views/privacy_policy_view.dart';
import '../modules/dashboard/setting/recommedTofriend/bindings/recommed_tofriend_binding.dart';
import '../modules/dashboard/setting/recommedTofriend/views/recommed_tofriend_view.dart';
import '../modules/dashboard/setting/termandPolicy/bindings/termand_policy_binding.dart';
import '../modules/dashboard/setting/termandPolicy/views/termand_policy_view.dart';
import '../modules/dashboard/setting/views/setting_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/language_selection/bindings/language_selection_binding.dart';
import '../modules/language_selection/views/language_selection_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_email/bindings/login_email_binding.dart';
import '../modules/login_email/views/login_email_view.dart';
import '../modules/varification/bindings/varification_binding.dart';
import '../modules/varification/views/varification_view.dart';
import '../splash/bindings/splash_binding.dart';
import '../splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      transition: Transition.leftToRight,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE_SELECTION,
      page: () => const LanguageSelectionView(),
      binding: LanguageSelectionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_EMAIL,
      page: () => const LoginEmailView(),
      binding: LoginEmailBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VARIFICATION,
      page: () => const VarificationView(),
      binding: VarificationBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => const NewPasswordView(),
      binding: VarificationBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_CHILD,
      page: () => const AboutChildView(),
      binding: AboutChildBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      children: [
        GetPage(
          name: _Paths.CALENDER,
          page: () => const CalenderView(),
          binding: CalenderBinding(),
        ),
        GetPage(
          name: _Paths.NOTIFICATION,
          page: () => const NotificationView(),
          binding: NotificationBinding(),
        ),
        GetPage(
          name: _Paths.SETTING,
          page: () => const SettingView(),
          binding: SettingBinding(),
          children: [
            GetPage(
              name: _Paths.EDIT_CHILD_INFO,
              page: () => const EditChildInfoView(),
              binding: EditChildInfoBinding(),
            ),
            GetPage(
              name: _Paths.RECOMMED_TOFRIEND,
              page: () => const RecommedTofriendView(),
              binding: RecommedTofriendBinding(),
            ),
            GetPage(
              name: _Paths.CONTACT_US,
              page: () => const ContactUsView(),
              binding: ContactUsBinding(),
            ),
            GetPage(
              name: _Paths.TERMAND_POLICY,
              page: () => const TermandPolicyView(),
              binding: TermandPolicyBinding(),
            ),
            GetPage(
              name: _Paths.ABOUT_US,
              page: () => const AboutUsView(),
              binding: AboutUsBinding(),
            ),
            GetPage(
              name: _Paths.PRIVACY_POLICY,
              page: () => const PrivacyPolicyView(),
              binding: PrivacyPolicyBinding(),
            ),
          ],
        ),
      ],
    ),
  ];
}

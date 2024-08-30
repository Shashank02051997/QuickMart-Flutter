import 'package:get/get.dart';

import '../modules/contact_us/contact_us_page.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_page.dart';
import '../modules/delivery_address/delivery_address_binding.dart';
import '../modules/delivery_address/delivery_address_page.dart';
import '../modules/edit_profile/edit_profile_binding.dart';
import '../modules/edit_profile/edit_profile_page.dart';
import '../modules/faqs/faqs_page.dart';
import '../modules/notifications/notifications_binding.dart';
import '../modules/notifications/notifications_page.dart';
import '../modules/onboarding/onboarding_page.dart';
import '../modules/order_accepted/order_accepted_binding.dart';
import '../modules/order_accepted/order_accepted_page.dart';
import '../modules/order_details/order_details_binding.dart';
import '../modules/order_details/order_details_page.dart';
import '../modules/order_list/order_list_binding.dart';
import '../modules/order_list/order_list_page.dart';
import '../modules/product_details/product_details_binding.dart';
import '../modules/product_details/product_details_page.dart';
import '../modules/product_list/product_list_binding.dart';
import '../modules/product_list/product_list_page.dart';
import '../modules/search_store/search_store_binding.dart';
import '../modules/search_store/search_store_page.dart';
import '../modules/signin/signin_binding.dart';
import '../modules/signin/signin_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import '../modules/verify-otp/verify_otp_binding.dart';
import '../modules/verify-otp/verify_otp_page.dart';
import '../modules/welcome/welcome_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboardingPage,
      page: () => OnboardingPage(),
    ),
    GetPage(
      name: AppRoutes.welcomePage,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.signinPage,
      page: () => SigninPage(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyOtpPage,
      page: () => VerifyOtpPage(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboardPage,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboardPage,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.notificationPage,
      page: () => NotificationsPage(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: AppRoutes.searchStorePage,
      page: () => SearchStorePage(),
      binding: SearchStoreBinding(),
    ),
    GetPage(
      name: AppRoutes.productListPage,
      page: () => ProductListPage(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetailsPage,
      page: () => ProductDetailsPage(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfilePage,
      page: () => EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.deliveryAddressPage,
      page: () => DeliveryAddressPage(),
      binding: DeliveryAddressBinding(),
    ),
    GetPage(
      name: AppRoutes.orderListPage,
      page: () => OrderListPage(),
      binding: OrderListBinding(),
    ),
    GetPage(
      name: AppRoutes.orderDetailsPage,
      page: () => OrderDetailsPage(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.orderAcceptedPage,
      page: () => OrderAcceptedPage(),
      binding: OrderAcceptedBinding(),
    ),
    GetPage(
      name: AppRoutes.faqsPage,
      page: () => FaqsPage(),
    ),
    GetPage(
      name: AppRoutes.faqsPage,
      page: () => FaqsPage(),
    ),
    GetPage(
      name: AppRoutes.contactUsPage,
      page: () => ContactUsPage(),
    ),
  ];
}

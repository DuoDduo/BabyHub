import 'package:babyhub/features/authentication/screens/onboarding/login/login.dart';
import 'package:babyhub/features/authentication/screens/onboarding/onboarding.dart';
import 'package:babyhub/features/authentication/screens/onboarding/signup/signup.dart';
import 'package:babyhub/features/authentication/screens/onboarding/signup/verify_email.dart';
import 'package:babyhub/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:babyhub/features/personalization/screens/address/address.dart';
import 'package:babyhub/features/personalization/screens/profile/profile.dart';
import 'package:babyhub/features/personalization/screens/settings/settings.dart';
import 'package:babyhub/features/shop/screens/cart/cart.dart';
import 'package:babyhub/features/shop/screens/checkout/checkout.dart';
import 'package:babyhub/features/shop/screens/home/home.dart';
import 'package:babyhub/features/shop/screens/order/widgets/order.dart';
import 'package:babyhub/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:babyhub/features/shop/screens/store/store.dart';
import 'package:babyhub/features/shop/screens/wishlist/wishlist.dart';
import 'package:babyhub/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: BRoutes.home, page: () => const HomeScreen()),
    GetPage(name: BRoutes.store, page: () => const StoreScreen()),
    GetPage(name: BRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: BRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: BRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: BRoutes.order, page: () => const OrderScreen()),
    GetPage(name: BRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: BRoutes.cart, page: () => const CartScreen()),
    GetPage(name: BRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: BRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: BRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: BRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: BRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: BRoutes.forgetPassword, page: () => const ForgotPassword()),
    GetPage(name: BRoutes.onboarding, page: () => const OnBoardingScreen()),
  ];
}

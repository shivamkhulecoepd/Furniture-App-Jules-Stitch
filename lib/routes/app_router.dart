import 'package:go_router/go_router.dart';

import '../features/auth/screens/welcome_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/auth/screens/forgot_password_screen.dart';
import '../features/auth/screens/otp_verification_screen.dart';
import '../features/catalog/screens/furniture_catalog_screen.dart';
import '../features/catalog/screens/product_details_screen.dart';
import '../features/catalog/screens/search_screen.dart';
import '../features/catalog/screens/category_screen.dart';
import '../features/cart/screens/cart_screen.dart';
import '../features/cart/screens/checkout_screen.dart';
import '../features/cart/screens/order_success_screen.dart';
import '../features/cart/screens/shipping_addresses_screen.dart';
import '../features/cart/screens/payment_methods_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/profile/screens/edit_profile_screen.dart';
import '../features/profile/screens/settings_screen.dart';
import '../features/profile/screens/help_center_screen.dart';
import '../features/profile/screens/notifications_screen.dart';
import '../features/profile/screens/loyalty_rewards_screen.dart';

class AppRouter {
  static const String welcome = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String home = '/home';
  static const String search = '/search';
  static const String category = '/category';
  static const String productDetails = '/product/:id';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String orderSuccess = '/order-success';
  static const String shippingAddresses = '/shipping-addresses';
  static const String paymentMethods = '/payment-methods';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
  static const String helpCenter = '/help-center';
  static const String notifications = '/notifications';
  static const String loyaltyRewards = '/loyalty-rewards';
  static const String trackOrder = '/track-order';

  static final GoRouter router = GoRouter(
    initialLocation: welcome,
    routes: [
      GoRoute(path: welcome, builder: (context, state) => const WelcomeScreen()),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: register, builder: (context, state) => const RegisterScreen()),
      GoRoute(path: forgotPassword, builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(path: otpVerification, builder: (context, state) => const OtpVerificationScreen()),
      GoRoute(path: home, builder: (context, state) => const FurnitureCatalogScreen()),
      GoRoute(path: search, builder: (context, state) => const SearchScreen()),
      GoRoute(path: category, builder: (context, state) => const CategoryScreen(categoryName: "Chairs")),
      GoRoute(path: productDetails, builder: (context, state) => ProductDetailsScreen(productId: state.pathParameters['id'] ?? '')),
      GoRoute(path: cart, builder: (context, state) => const CartScreen()),
      GoRoute(path: checkout, builder: (context, state) => const CheckoutScreen()),
      GoRoute(path: orderSuccess, builder: (context, state) => const OrderSuccessScreen()),
      GoRoute(path: shippingAddresses, builder: (context, state) => const ShippingAddressesScreen()),
      GoRoute(path: paymentMethods, builder: (context, state) => const PaymentMethodsScreen()),
      GoRoute(path: profile, builder: (context, state) => const ProfileScreen()),
      GoRoute(path: editProfile, builder: (context, state) => const EditProfileScreen()),
      GoRoute(path: settings, builder: (context, state) => const SettingsScreen()),
      GoRoute(path: helpCenter, builder: (context, state) => const HelpCenterScreen()),
      GoRoute(path: notifications, builder: (context, state) => const NotificationsScreen()),
      GoRoute(path: loyaltyRewards, builder: (context, state) => const LoyaltyRewardsScreen()),
    ],
  );
}

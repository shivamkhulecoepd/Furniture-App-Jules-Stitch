import 'package:go_router/go_router.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/auth/screens/welcome_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/auth/screens/forgot_password_screen.dart';
import '../features/auth/screens/otp_verification_screen.dart';
import '../features/catalog/screens/furniture_catalog_screen.dart';
import '../features/catalog/screens/product_details_screen.dart';
import '../features/catalog/screens/search_screen.dart';
import '../features/catalog/screens/category_screen.dart';
import '../features/catalog/screens/reviews_screen.dart';
import '../features/cart/screens/cart_screen.dart';
import '../features/cart/screens/checkout_screen.dart';
import '../features/cart/screens/order_success_screen.dart';
import '../features/cart/screens/track_order_screen.dart';
import '../features/cart/screens/shipping_addresses_screen.dart';
import '../features/cart/screens/payment_methods_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/profile/screens/edit_profile_screen.dart';
import '../features/profile/screens/settings_screen.dart';
import '../features/profile/screens/notifications_screen.dart';
import '../features/profile/screens/loyalty_rewards_screen.dart';
import '../features/profile/screens/my_orders_screen.dart';
import '../features/profile/screens/order_details_screen.dart';
import '../features/profile/screens/help_center_screen.dart';
import '../features/profile/screens/contact_us_screen.dart';
import '../features/profile/screens/privacy_policy_screen.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';
  static const String catalog = '/catalog';
  static const String productDetails = '/product/:id';
  static const String search = '/search';
  static const String category = '/category/:name';
  static const String reviews = '/reviews';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String success = '/success';
  static const String trackOrder = '/track-order';
  static const String addresses = '/addresses';
  static const String payments = '/payments';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';
  static const String notifications = '/notifications';
  static const String loyalty = '/loyalty';
  static const String myOrders = '/my-orders';
  static const String orderDetails = '/order-details/:id';
  static const String helpCenter = '/help-center';
  static const String contactUs = '/contact-us';
  static const String privacy = '/privacy';

  // Aliases for compatibility
  static const String home = catalog;
  static const String otpVerification = otp;
  static const String shippingAddresses = addresses;
  static const String paymentMethods = payments;
  static const String loyaltyRewards = loyalty;
  static const String orderSuccess = success;

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => const WelcomeScreen()),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: register, builder: (context, state) => const RegisterScreen()),
      GoRoute(path: forgotPassword, builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(path: otp, builder: (context, state) => const OtpVerificationScreen()),
      GoRoute(path: catalog, builder: (context, state) => const FurnitureCatalogScreen()),
      GoRoute(
        path: productDetails,
        builder: (context, state) => ProductDetailsScreen(productId: state.pathParameters['id'] ?? '1'),
      ),
      GoRoute(path: search, builder: (context, state) => const SearchScreen()),
      GoRoute(
        path: category,
        builder: (context, state) => CategoryScreen(categoryName: state.pathParameters['name'] ?? 'Chairs'),
      ),
      GoRoute(path: reviews, builder: (context, state) => const ReviewsScreen()),
      GoRoute(path: cart, builder: (context, state) => const CartScreen()),
      GoRoute(path: checkout, builder: (context, state) => const CheckoutScreen()),
      GoRoute(path: success, builder: (context, state) => const OrderSuccessScreen()),
      GoRoute(path: trackOrder, builder: (context, state) => const TrackOrderScreen()),
      GoRoute(path: addresses, builder: (context, state) => const ShippingAddressesScreen()),
      GoRoute(path: payments, builder: (context, state) => const PaymentMethodsScreen()),
      GoRoute(path: profile, builder: (context, state) => const ProfileScreen()),
      GoRoute(path: editProfile, builder: (context, state) => const EditProfileScreen()),
      GoRoute(path: settings, builder: (context, state) => const SettingsScreen()),
      GoRoute(path: notifications, builder: (context, state) => const NotificationsScreen()),
      GoRoute(path: loyalty, builder: (context, state) => const LoyaltyRewardsScreen()),
      GoRoute(path: myOrders, builder: (context, state) => const MyOrdersScreen()),
      GoRoute(
        path: orderDetails,
        builder: (context, state) => OrderDetailsScreen(orderId: state.pathParameters['id'] ?? 'TRX-8829'),
      ),
      GoRoute(path: helpCenter, builder: (context, state) => const HelpCenterScreen()),
      GoRoute(path: contactUs, builder: (context, state) => const ContactUsScreen()),
      GoRoute(path: privacy, builder: (context, state) => const PrivacyPolicyScreen()),
    ],
  );
}

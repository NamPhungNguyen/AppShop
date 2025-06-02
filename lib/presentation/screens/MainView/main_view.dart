import 'package:flutter/material.dart';
import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/presentation/screens/Address/add_new_address.dart';
import 'package:front_shop/presentation/screens/BottomBar/bottom_bar.dart';
import 'package:front_shop/presentation/screens/Checkout/checkout_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_create_new_password_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_code_view.dart';
import 'package:front_shop/presentation/screens/ForgotPassword/forgot_password_view.dart';
import 'package:front_shop/presentation/screens/Location/allow_location_view.dart';
import 'package:front_shop/presentation/screens/Location/enter_your_location_view.dart';
import 'package:front_shop/presentation/screens/Menu/Account/profile_view.dart';
import 'package:front_shop/presentation/screens/Menu/Account/update_profile.dart';
import 'package:front_shop/presentation/screens/Onboarding/onboarding.dart';
import 'package:front_shop/presentation/screens/Order/order_view.dart';
import 'package:front_shop/presentation/screens/ProductDetail/product_detail_view.dart';
import 'package:front_shop/presentation/screens/ProductReviews/product_reviews.dart';
import 'package:front_shop/presentation/screens/Splash/splash_view.dart';

import '../../../domain/models/product.dart';
import '../../commom/widgets/Search/search_and_filter.dart';
import '../Address/address_view.dart';
import '../Address/update_address.dart';
import '../Admin/admin_home.dart';
import '../Admin/menu/add_coupon_screen.dart';
import '../Admin/menu/add_product_page.dart';
import '../Admin/menu/admin_search_producct.dart';
import '../Admin/menu/category_form.dart';
import '../Admin/menu/manage_coupon.dart';
import '../Admin/menu/manage_order.dart';
import '../Admin/menu/manage_product_screen.dart';
import '../Admin/menu/manage_user_screen.dart';
import '../Admin/menu/product_detail_admin_screen.dart';
import '../Login/log_in_view.dart';
import '../Menu/Account/account_view.dart';
import '../Menu/Account/update_email.dart';
import '../Menu/Account/update_phone_number.dart';
import '../Menu/Cart/cart_view.dart';
import '../Menu/Home/home_view.dart';
import '../Menu/Saved/saved_view.dart';
import '../Notification/notification_view.dart';
import '../SignUp/sign_up_view.dart';

class MainView {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case SignUpView.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case BottomBar.routeName:
        return MaterialPageRoute(builder: (_) => const BottomBar());
      case OnBoardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case ForgotPasswordView.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case ForgotPasswordCodeView.routeName:
        final email = settings.arguments.toString();
        return MaterialPageRoute(
            builder: (_) => ForgotPasswordCodeView(email: email));
      case ForgotCreateNewPasswordView.routeName:
        final email = settings.arguments.toString();
        return MaterialPageRoute(
            builder: (_) => ForgotCreateNewPasswordView(email: email));
      case AllowLocationView.routeName:
        return MaterialPageRoute(builder: (_) => const AllowLocationView());
      case EnterYourLocationView.routeName:
        return MaterialPageRoute(builder: (_) => const EnterYourLocationView());
      case NotificationView.routeName:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case CartView.routeName:
        return MaterialPageRoute(builder: (_) => const CartView());
      case SavedView.routeName:
        return MaterialPageRoute(builder: (_) => SavedView());
      case AccountView.routeName:
        return MaterialPageRoute(builder: (_) => const AccountView());
      case CheckoutView.routeName:
        return MaterialPageRoute(builder: (_) => const CheckoutView());
      case ProfileView.routeName:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case ProductDetailView.routeName:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailView(product: product),
        );
      case AddressView.routeName:
        return MaterialPageRoute(builder: (_) => const AddressView());
      case AddNewAddress.routeName:
        return MaterialPageRoute(builder: (_) => const AddNewAddress());
      case UpdateAddress.routeName:
        final shippingAddress = settings.arguments as ShippingAddress;
        return MaterialPageRoute(
          builder: (_) => UpdateAddress(
            address: shippingAddress,
          ),
        );
      case ProductReviewsView.routeName:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductReviewsView(product: product),
        );
      case OrderView.routeName:
        return MaterialPageRoute(builder: (_) => const OrderView());
      case UpdateProfileNameView.routeName:
        return MaterialPageRoute(builder: (_) => const UpdateProfileNameView());
      case UpdatePhoneNumberView.routeName:
        return MaterialPageRoute(builder: (_) => const UpdatePhoneNumberView());
      case UpdateProfileEmailView.routeName:
        return MaterialPageRoute(
            builder: (_) => const UpdateProfileEmailView());
      case SearchAndFilterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SearchAndFilterScreen());
      case AdminHome.routeName:
        return MaterialPageRoute(builder: (_) => const AdminHome());
      case AddProductPage.routeName:
        return MaterialPageRoute(builder: (_) => const AddProductPage());
      case CategoryFormScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CategoryFormScreen());
      case ManageOrderScreen.routeName:
        return MaterialPageRoute(builder: (_) => ManageOrderScreen());
      case ManageCouponScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ManageCouponScreen());
      case AddCouponScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AddCouponScreen());
      case ManageUsersScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ManageUsersScreen());
      case ProductManagementPage.routeName:
        return MaterialPageRoute(builder: (_) => const ProductManagementPage());
      case AdminSearchAndFilterScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const AdminSearchAndFilterScreen());
      case ProductDetailAdminPage.routeName:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetailAdminPage(product: product));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_shop/domain/models/category.dart';
import 'package:front_shop/domain/models/comment.dart';
import 'package:front_shop/domain/models/monthly_revenue.dart';
import 'package:front_shop/domain/models/my_info.dart';
import 'package:front_shop/domain/models/product.dart';
import 'package:front_shop/domain/models/product_page.dart';
import 'package:front_shop/domain/models/shipping_address.dart';
import 'package:front_shop/domain/models/signup.dart';
import 'package:front_shop/domain/models/user.dart';
import 'package:front_shop/domain/states/category_state.dart';
import 'package:front_shop/domain/states/checkout_state.dart';
import 'package:front_shop/domain/states/comment_state.dart';
import 'package:front_shop/domain/states/favorite_state.dart';
import 'package:front_shop/domain/states/home_state.dart';
import 'package:front_shop/domain/states/location_state.dart';
import 'package:front_shop/domain/states/order_pages_state.dart';
import 'package:front_shop/domain/states/order_state.dart';
import 'package:front_shop/domain/states/product_page_state.dart';
import 'package:front_shop/domain/states/product_state.dart';
import 'package:front_shop/domain/states/search_state.dart';
import 'package:front_shop/domain/states/shipping_address_state.dart';
import 'package:front_shop/domain/states/signup_state.dart';
import 'package:front_shop/domain/states/token_state.dart';
import 'package:front_shop/domain/states/user_state.dart';
import 'package:front_shop/presentation/screens/MainView/main_view.dart';
import 'package:front_shop/presentation/screens/Splash/splash_view.dart';
import 'package:front_shop/utils/theme/theme.dart';

import 'domain/domain_modules.dart';
import 'domain/models/cart_product.dart';
import 'domain/models/coupon.dart';
import 'domain/models/login.dart';
import 'domain/models/order.dart';
import 'domain/models/order_pages.dart';
import 'domain/states/cart_state.dart';
import 'domain/states/coupon_admin_state.dart';
import 'domain/states/coupon_state.dart';
import 'domain/states/login_state.dart';
import 'domain/states/monthly_state.dart';
import 'domain/states/shipping_address_default_state.dart';
import 'domain/states/user_admin_state.dart';

// TokenState provider
final tokenStateProvider =
    StateNotifierProvider<TokenState, AsyncValue<String?>>(
  (ref) => TokenState(),
);

final signUpStateProvider =
    StateNotifierProvider<SignUpState, AsyncValue<SignUp>>(
  (ref) => SignUpState(ref),
);

final loginStateProvider = StateNotifierProvider<LoginState, AsyncValue<Login>>(
  (ref) => LoginState(
    AsyncValue.data(
      Login(
        code: 0,
        message: '',
        result: const LoginResult(token: '', authenticated: false),
      ),
    ),
    ref,
  ),
);

final locationStateProvider =
    StateNotifierProvider<LocationState, AsyncValue<bool>>(
  (ref) => LocationState(ref),
);

final monthlyRevenueStateProvider =
    StateNotifierProvider<MonthlyState, AsyncValue<List<MonthlyRevenue>>>(
  (ref) => MonthlyState(ref),
);

final userStateProvider = StateNotifierProvider<UserState, AsyncValue<MyInfo>>(
  (ref) => UserState(ref),
);

final userAdminStateProvider =
    StateNotifierProvider<UserAdminState, AsyncValue<UserResponse>>(
  (ref) => UserAdminState(ref),
);

final categoryStateProvider =
    StateNotifierProvider<CategoryState, AsyncValue<Categories>>(
  (ref) => CategoryState(ref),
);

final productStateProvider =
    StateNotifierProvider<ProductState, AsyncValue<Products>>(
  (ref) => ProductState(ref),
);

final homeStateProvider =
    StateNotifierProvider<HomeState, AsyncValue<Map<String, dynamic>>>(
  (ref) => HomeState(ref),
);

final favoriteStateProvider =
    StateNotifierProvider<FavoriteState, AsyncValue<List<Product>>>(
  (ref) => FavoriteState(ref),
);

final productSearchStateProvider =
    StateNotifierProvider<SearchState, AsyncValue<List<Product>>>(
  (ref) => SearchState(ref),
);

final cartStateProvider =
    StateNotifierProvider<CartState, AsyncValue<CartProducts>>(
  (ref) => CartState(ref),
);

final checkoutStateProvider =
    StateNotifierProvider<CheckoutState, AsyncValue<CartCheckoutProducts>>(
  (ref) => CheckoutState(ref),
);

final shippingAddressStateProvider =
    StateNotifierProvider<ShippingAddressState, AsyncValue<ShippingAddresses>>(
  (ref) => ShippingAddressState(ref),
);

final shippingAddressDefaultStateProvider = StateNotifierProvider<
    ShippingAddressDefaultState, AsyncValue<ShippingAddressDefault>>(
  (ref) => ShippingAddressDefaultState(ref),
);

final commentStateProvider =
    StateNotifierProvider.family<CommentState, AsyncValue<Comments>, String>(
  (ref, productId) => CommentState(ref, productId),
);

final productPageStateProvider =
    StateNotifierProvider<ProductPageState, AsyncValue<ProductPage>>(
  (ref) => ProductPageState(ref),
);

final orderPagesStateProvider =
    StateNotifierProvider<OrderPagesState, AsyncValue<OrderPages>>(
  (ref) => OrderPagesState(ref),
);

final couponStateProvider =
    StateNotifierProvider<CouponState, AsyncValue<List<Coupon>>>((ref) {
  return CouponState(ref.read(couponUsecaseProvider));
});

final couponAdminStateProvider =
    StateNotifierProvider<CouponAdminState, AsyncValue<List<Coupon>>>((ref) {
  return CouponAdminState(ref.read(couponUsecaseProvider));
});

final orderStateProvider =
    StateNotifierProvider<OrderState, AsyncValue<List<Order>>>((ref) {
  final orderUsecase =
      ref.watch(orderUsecaseProvider); // Access the usecase from provider
  return OrderState(orderUsecase);
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      initialRoute: SplashView.routeName,
      onGenerateRoute: MainView.generateRoute,
    );
  }
}

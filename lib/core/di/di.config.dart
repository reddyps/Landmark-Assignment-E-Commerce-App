// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/viewmodels/auth_view_model.dart' as _i605;
import '../../features/cart/viewmodels/cart_view_model.dart' as _i957;
import '../../features/home/viewmodels/home_view_model.dart' as _i490;
import '../../features/onbording/viewmodels/onboarding_view_model.dart'
    as _i504;
import '../../features/order/viewmodels/orders_view_model.dart' as _i1070;
import '../../features/product/viewmodels/products_view_model.dart' as _i946;
import '../firebase/firebase_handler.dart' as _i455;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseModule = _$FirebaseModule();
  gh.singleton<_i605.AuthViewModel>(() => _i605.AuthViewModel());
  gh.singleton<_i957.CartViewModel>(() => _i957.CartViewModel());
  gh.singleton<_i490.HomeViewModel>(() => _i490.HomeViewModel());
  gh.singleton<_i504.OnBoardingViewModel>(() => _i504.OnBoardingViewModel());
  gh.singleton<_i1070.OrdersViewModel>(() => _i1070.OrdersViewModel());
  gh.singleton<_i946.ProductsViewModel>(() => _i946.ProductsViewModel());
  gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
  return getIt;
}

class _$FirebaseModule extends _i455.FirebaseModule {}

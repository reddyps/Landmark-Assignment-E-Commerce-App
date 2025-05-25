import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:landmark_assignment/core/util/extension/method_extension.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/value/global_variables.dart';
import 'package:landmark_assignment/core/util/value/images.dart';
import 'package:landmark_assignment/features/cart/views/cart.dart';
import 'package:landmark_assignment/features/home/viewmodels/home_view_model.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_bloc.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_event.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_state.dart';
import 'package:landmark_assignment/features/order/views/orders.dart';
import 'package:landmark_assignment/features/product/views/products_screen.dart';
import 'package:landmark_assignment/features/profile/views/profile_screen.dart';
import 'package:landmark_assignment/shared/widgets/animated_cart_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel viewModel;
  HomeScreenBloc? homeScreenBloc;

  @override
  void initState() {
    super.initState();
    viewModel = createViewModel();
  }

  @override
  Widget build(BuildContext context) {
    GlobalVariables.homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ?? Theme.of(context).iconTheme.color!.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
            BlendMode.srcIn),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: Image.asset(
          Images.logo,
          height: 20,
          width: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: svgIcon(Images.search,
                color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
          IconButton(
            onPressed: () {},
            icon: svgIcon(Images.notification,
                color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
          Obx(() => AnimatedCartButton(
            itemCount: GlobalVariables.cartItemCount.value,
            onPressed: () {
              GlobalVariables.homeScreenTab.value = 1;
              homeScreenBloc?.add(ShowCartEvent());
            },
          )),
        ],
      ),
      body: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        bloc: homeScreenBloc,
        builder: (BuildContext context, state) {
          if (state is ProductsState) return ProductsScreen();
          if (state is OrdersState) return Orders();
          if (state is ProfileState) return ProfileScreen();
          if (state is CartState) return Cart();
          return ProductsScreen();
        },
        listener: (BuildContext context, state) {},
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: Obx(() => BottomNavigationBar(
          currentIndex: GlobalVariables.homeScreenTab.value,
          onTap: (index) {
            if (index != GlobalVariables.homeScreenTab.value) {
              setState(() {
                GlobalVariables.homeScreenTab.value = index;
              });
              switch (index) {
                case 0:
                  homeScreenBloc?.add(ShowProductsEvent());
                  break;
                case 1:
                  homeScreenBloc?.add(ShowCartEvent());
                  break;
                case 2:
                  homeScreenBloc?.add(ShowOrdersEvent());
                  break;
                case 3:
                  homeScreenBloc?.add(ShowProfileEvent());
                  break;
              }
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: svgIcon(Images.shop),
              activeIcon: svgIcon(Images.shop, color: primaryColor),
              label: context.locale.shop,
            ),
            BottomNavigationBarItem(
              icon: Obx(() => AnimatedCartButton(
                itemCount: GlobalVariables.cartItemCount.value,
                onPressed: () {
                  GlobalVariables.homeScreenTab.value = 1;
                  homeScreenBloc?.add(ShowCartEvent());
                },
              )),
              label: context.locale.cart,
            ),
            BottomNavigationBarItem(
              icon: svgIcon(Images.bookmark),
              activeIcon: svgIcon(Images.bookmark, color: primaryColor),
              label: context.locale.orders,
            ),
            BottomNavigationBarItem(
              icon: svgIcon(Images.profile),
              activeIcon: svgIcon(Images.profile, color: primaryColor),
              label: context.locale.profile,
            ),
          ],
        )),
      ),
    );
  }

  @override
  HomeViewModel createViewModel() {
    return HomeViewModel();
  }
}

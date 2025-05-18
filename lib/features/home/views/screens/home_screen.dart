import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:landmark_assignment/core/base/base_view.dart';
import 'package:landmark_assignment/core/util/theme/constants.dart';
import 'package:landmark_assignment/core/util/value/global_variables.dart';
import 'package:landmark_assignment/features/cart/views/cart.dart';
import 'package:landmark_assignment/features/cart/views/screens/cart_screen.dart';
import 'package:landmark_assignment/features/home/viewmodels/home_view_model.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_bloc.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_event.dart';
import 'package:landmark_assignment/features/home/views/bloc/home_screen/homescreen_state.dart';
import 'package:landmark_assignment/features/order/views/orders.dart';
import 'package:landmark_assignment/features/order/views/componets/orders_screen.dart';
import 'package:landmark_assignment/features/product/views/products_screen.dart';
import 'package:landmark_assignment/features/profile/views/profile_screen.dart';


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
    GlobalVariables.homeScreenBloc =BlocProvider.of<HomeScreenBloc>(context);
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
        title: SvgPicture.asset(
          "assets/logo/Shoplon.svg",
          colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!, BlendMode.srcIn),
          height: 20,
          width: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: svgIcon("assets/icons/Search.svg", color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
          IconButton(
            onPressed: () {},
            icon: svgIcon("assets/icons/Notification.svg", color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
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
        child: Obx( ()=>
           BottomNavigationBar(
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
            unselectedItemColor: Colors.grey, // You can tweak this
            items: [
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Shop.svg"),
                activeIcon: svgIcon("assets/icons/Shop.svg", color: primaryColor),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Bag.svg"),
                activeIcon: svgIcon("assets/icons/Bag.svg", color: primaryColor),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Bookmark.svg"),
                activeIcon: svgIcon("assets/icons/Bookmark.svg", color: primaryColor),
                label: "Orders",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Profile.svg"),
                activeIcon: svgIcon("assets/icons/Profile.svg", color: primaryColor),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel createViewModel() {
    return HomeViewModel();
  }
}

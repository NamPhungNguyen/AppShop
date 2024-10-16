import 'package:flutter/material.dart';
import 'package:front_shop/utils/constants/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import '../Menu/Account/account_view.dart';
import '../Menu/Cart/cart_view.dart';
import '../Menu/Home/home_view.dart';
import '../Menu/Saved/saved_view.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom_bar';

  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    SavedView(),
    const CartView(),
    const AccountView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //add a thicker border at the top of bottombar
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2.0, // customize the thickness
                ),
              ),
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home, size: 28),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.heart, size: 28),
                label: "Saved",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.shopping_cart, size: 28),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.user, size: 28),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            backgroundColor: AppColors.textWhite,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ],
      ),
    );
  }
}

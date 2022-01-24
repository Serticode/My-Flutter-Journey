import 'package:finance_layout/home_screen.dart';
import 'package:finance_layout/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;
  Color _selectedBottomBarColor = Color(0xFFD0EAF9);
  Color _unselectedBottomBarColor = Color(0xFFA0A0BA);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF050505),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            //!HOME
            SalomonBottomBarItem(
                icon: Icon(Icons.home_outlined),
                title: Text("Home"),
                selectedColor: _selectedBottomBarColor,
                unselectedColor: _unselectedBottomBarColor),

            //! TRENDS
            SalomonBottomBarItem(
                icon: Icon(Icons.trending_up_outlined),
                title: Text("Trends"),
                selectedColor: _selectedBottomBarColor,
                unselectedColor: _unselectedBottomBarColor),

            //! WALLET
            SalomonBottomBarItem(
                icon: Icon(Icons.account_balance_wallet_outlined),
                title: Text("Wallet"),
                selectedColor: _selectedBottomBarColor,
                unselectedColor: _unselectedBottomBarColor),

            //! RECEIPT
            SalomonBottomBarItem(
                icon: Icon(Icons.receipt_long_outlined),
                title: Text("Receipt"),
                selectedColor: _selectedBottomBarColor,
                unselectedColor: _unselectedBottomBarColor),
          ],
        ),
        body: _currentIndex == 0
            ? HomeScreen()
            : _currentIndex == 2
                ? WalletScreen()
                : HomeScreen(),
      ),
    );
  }
}

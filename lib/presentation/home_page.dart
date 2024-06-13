import 'package:bitroot_test/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

  List _screens =[
    DashboardScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _screens.first,
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [

        BottomNavigationBarItem(icon: Icon(Icons.dashboard, ),label:"Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner),label:"Scan Receipt"),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label:"Send & Request"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label:"Settngs"),
      ]),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:myapp/pages/profile.dart';
// import 'package:myapp/pages/home.dart';
// import 'package:myapp/pages/settings.dart';

// class FirstPage extends StatefulWidget {
//   const FirstPage({super.key});
//   static const List<Widget> _pages = [
//     HomePage(),
//     SecondPage(),
//     Settings(),
//   ];

//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   int _selectedIndex = 0;
//   void _indexChanged(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Page'),
//       ),
// drawer: Drawer(
//     backgroundColor: Color.fromARGB(255, 108, 65, 143),
//     child: Column(
//       children: [
//         DrawerHeader(
//           child: Icon(
//             Icons.favorite,
//             size: 48,
//           ),
//         ),
//         ListTile(
//           leading: Icon(Icons.home),
//           title: Text("HOME"),
//           onTap: () {
//             // Handle item 1 tap
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.settings),
//           title: Text("SETTINGS"),
//           onTap: () {
//             // Handle item 1 tap
//           },
//         ),
//       ],
//     )),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _indexChanged,
//         selectedItemColor: Colors.purpleAccent,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "profile",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings",
//           ),
//         ],
//       ),
//       body: FirstPage._pages[_selectedIndex],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:bottom_tab_app/pages/profile.dart';
// import 'package:bottom_tab_app/pages/settings.dart';
// import 'chat.dart';
// import 'dashboard.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/pages/transactionPage.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/budgetpage.dart';
import 'package:myapp/pages/overviewPage.dart';

class Home extends StatefulWidget {
  final String? userName;
  const Home({Key? key, this.userName}) : super(key:key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0; // to keep track of active tab index
  late final List<Widget> screens; // Declare screens list

  @override
  void initState() {
    super.initState();
    screens = [
      HomePage(userName: widget.userName), // Pass userName here
      const transaction(),
      const budget(),
      const overview(),
    ];
  } // to store nested tabs
   PageStorageBucket bucket = PageStorageBucket();
  
  late Widget currentScreen = screens[0]; // Initialize with the first screen

  @override
  Widget build(BuildContext context) {
    // final userName = widget.userName;
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTabIcon(0, Icons.home, 'Home'),
                  buildTabIcon(1, Icons.money, 'Transactions'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTabIcon(2, Icons.pie_chart_rounded, 'Budget'),
                  buildTabIcon(3, Icons.analytics_rounded, 'Overview'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabIcon(int index, IconData icon, String label) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          currentScreen = screens[index];  // Home page screen widgets
          print(screens[index]);
          currentTab = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentTab == index
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentTab == index
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

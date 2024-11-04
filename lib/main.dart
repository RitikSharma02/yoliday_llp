import 'package:flutter/material.dart';
import 'Screens/Home_Screen.dart';
import 'Screens/portfolio.dart';
import 'Screens/profile_Page.dart';
import 'Screens/Input_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const HomeScreen(),
    const PortfolioTabNavigator(),
    const TasksPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color(0xffDF5532),
                unselectedItemColor: Colors.grey,
                currentIndex: _selectedIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.home, 0),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.business_center, 1),
                    label: 'Portfolio',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.input, 2),
                    label: 'Input',
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.person_rounded, 3),
                    label: 'Profile',
                  ),
                ],
                onTap: _onItemTapped,
              ),
            ],
          ),
        ),
    );
  }
  Widget _buildIcon(IconData icon, int index) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon),
        if (_selectedIndex == index)
          Positioned(
            top: -8,
            left: 0,
            right: 0,
            child: Container(
              height: 4,
              width: 16,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
      ],
    );
  }
}















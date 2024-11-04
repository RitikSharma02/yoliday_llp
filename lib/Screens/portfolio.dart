import 'package:flutter/material.dart';

import 'Project/projects.dart';

class PortfolioTabNavigator extends StatelessWidget {
  const PortfolioTabNavigator({super.key});
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => const PortfolioPage(),
        );
      },
    );
  }
}



class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Portfolio',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag,size: 25, color: Color(0xffDF5532)),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications,size: 25, color: Color(0xffDF5532)),
            onPressed: () {
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color(0xffDF5532),
          unselectedLabelColor: Colors.black,
          indicatorColor: Color(0xffDF5532),
          tabs: const [
            Tab(text: 'Project'),
            Tab(text: 'Saved'),
            Tab(text: 'Shared'),
            Tab(text: 'Achievement'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Projects() ),
          Center(child: Text('All Saved Content Here')),
          Center(child: Text('Shared Content Here')),
          Center(child: Text('Achievement Content Here')),
        ],
      ),
    );
  }
}



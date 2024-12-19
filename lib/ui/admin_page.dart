import 'package:flutter/material.dart';

import 'package:stockish/ui/investment_page.dart';

import 'package:stockish/ui/portfolio_page.dart';

import 'package:stockish/ui/stock_page.dart';

import 'package:stockish/ui/watchlist_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AdminDashboard(), 
    WatchlistScreen(),
    InvestmentScreen(),
    PortfolioScreen(),
    StockScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.deepPurple,
        actionsIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Investment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Stock',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, 
      ),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              
              Expanded(
                  child:
                      buildInfoContainer("Total Investment", "Rs. 1,00,000",)),
              SizedBox(width: 16),
              Expanded(child: buildInfoContainer("Current Worth", "Rs. 100")),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: buildInfoContainer("Total Share", "Rs. 100")),
              SizedBox(width: 16), 
              Expanded(child: buildInfoContainer("Dividend", "Rs. 100")),
            ],
          )
        ],
      ),
    );
  }

  Widget buildInfoContainer(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.transparent, width: 2),
      ),
      child: Column(
        children: [
          Text(title,
              style: TextStyle(fontSize: 18, color: Colors.white, 
              )
              ),
          SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}

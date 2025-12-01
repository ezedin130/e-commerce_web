import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/sidebar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedItem = 'Dashboard';
  Widget getMainContent() {
    switch (selectedItem) {
      case 'Dashboard':
        return Center(child: Text('Dashboard Content'));
      case 'Products':
        return Center(child: Text('Products Content'));
      case 'Inventory':
        return Center(child: Text('Inventory Content'));
      case 'Orders':
        return Center(child: Text('Orders Content'));
      case 'Purchases':
        return Center(child: Text('Purchases Content'));
      case 'Settings':
        return Center(child: Text('Settings Content'));
      default:
        return Center(child: Text('Main Content'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 220,
            color: Colors.grey[100],
            child: Column(
              children: [
                SizedBox(height: 32),
                Text(
                  'ShopIt',
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 32),
                SidebarItem(
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  selected: selectedItem == 'Dashboard',
                  onTap: () => setState(() => selectedItem = 'Dashboard'),
                ),
                SidebarItem(
                  icon: Icons.shopping_bag,
                  title: 'Products',
                  selected: selectedItem == 'Products',
                  onTap: () => setState(() => selectedItem = 'Products'),
                ),
                SidebarItem(
                  icon: Icons.inventory,
                  title: 'Inventory',
                  selected: selectedItem == 'Inventory',
                  onTap: () => setState(() => selectedItem = 'Inventory'),
                ),
                SidebarItem(
                  icon: Icons.local_shipping,
                  title: 'Orders',
                  selected: selectedItem == 'Orders',
                  onTap: () => setState(() => selectedItem = 'Orders'),
                ),
                SidebarItem(
                  icon: Icons.receipt_long,
                  title: 'Purchases',
                  selected: selectedItem == 'Purchases',
                  onTap: () => setState(() => selectedItem = 'Purchases'),
                ),
                Spacer(),
                SidebarItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  selected: selectedItem == 'Settings',
                  onTap: () => setState(() => selectedItem = 'Settings'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 24),
                      Icon(Icons.notifications_none),
                      SizedBox(width: 16),
                      Icon(Icons.brightness_2),
                      SizedBox(width: 16),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150'),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'User Name',
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Store Name',
                            style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: getMainContent(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


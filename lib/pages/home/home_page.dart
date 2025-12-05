import 'package:e_commerce_mobile/pages/home/section/dashboard/dashboard_section.dart';
import 'package:e_commerce_mobile/pages/home/section/inventory_section.dart';
import 'package:e_commerce_mobile/pages/home/section/order_section.dart';
import 'package:e_commerce_mobile/pages/home/section/product_section.dart';
import 'package:e_commerce_mobile/pages/home/section/purchase_section.dart';
import 'package:e_commerce_mobile/pages/home/section/setting_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/store_service.dart';
import '../../util/sidebar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  String storeName = "";
  String selectedItem = 'Dashboard';

  final storeService = StoreService();
  @override
  void initState() {
    super.initState();
    loadNameFromToken();
    loadStore();
  }

  Future<String> getUserNameFromToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("jwt");
    if (token == null) return "User";

    final decodedToken = JwtDecoder.decode(token);
    return decodedToken['sub'] ?? "User";
  }
  void loadNameFromToken() async {
    final userName = await getUserNameFromToken();
    setState(() {
      name = userName;
    });
  }
  void loadStore() async {
    final store = await storeService.getStoreById(1);

    if (store != null) {
      setState(() {
        storeName = store["name"];
      });
    }
  }

  Widget getMainContent() {
    switch (selectedItem) {
      case 'Dashboard':
        return Center(child: DashboardSection());
      case 'Products':
        return Center(child: ProductSection());
      case 'Inventory':
        return Center(child: InventorySection());
      case 'Orders':
        return Center(child: OrderSection());
      case 'Purchases':
        return Center(child: PurchaseSection());
      case 'Settings':
        return Center(child: SettingSection());
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
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.freeiconspng.com/img/25500'),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            storeName,
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
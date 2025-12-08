import 'package:e_commerce_mobile/pages/home/section/dashboard/pages/add_product_page.dart';
import 'package:e_commerce_mobile/pages/home/section/dashboard/utils/dashboard_card.dart';
import 'package:e_commerce_mobile/pages/home/section/dashboard/utils/quick_action.dart';
import 'package:e_commerce_mobile/pages/home/section/dashboard/utils/reusable_card.dart';
import 'package:flutter/material.dart';

import '../../../../service/order_service.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  final orderService = OrderService();

  int totalOrders = 0;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    loadStoreData();
  }

  Future<void> loadStoreData() async {
    final orders = await orderService.getAllOrders();
    setState(() {
      totalOrders = orders?.length ?? 0;
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loading ? const CircularProgressIndicator() :
            Expanded(
              child: DashboardCard(
                title: 'Total Orders',
                value: totalOrders.toString(),
                percentage: 2.3,
                isIncrease: true,
                icon: Icons.lock,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DashboardCard(
                title: 'Total Revenue made',
                value: '9,526',
                percentage: 8.1,
                isIncrease: true,
                icon: Icons.person_add,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DashboardCard(
                title: 'Total Products',
                value: '13,647',
                percentage: 2.3,
                isIncrease: false,
                icon: Icons.local_offer,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DashboardCard(
                title: 'Stock Alert',
                value: '13,647',
                percentage: 2.3,
                isIncrease: false,
                icon: Icons.lock,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15.0),
        Row(
          children: [
            QuickActionCard(
              color: Colors.blue,
              icon: Icons.add,
              title: "Add Product",
              subtitle: "Create a new product listing",
              onTap: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: "Add Product",
                  barrierColor: Colors.black.withOpacity(0.3),
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (_, __, ___) => AddProductDialog(),
                  transitionBuilder: (context, animation, secondary, child) {
                    return Transform.scale(
                      scale: animation.value,
                      child: Opacity(
                        opacity: animation.value,
                        child: child,
                      ),
                    );
                  },
                );
              },
            ),
            QuickActionCard(
              color: Colors.purple,
              icon: Icons.category,
              title: "Manage Variants",
              subtitle: "Update product variants and options",
              onTap: () {},
            ),
            QuickActionCard(
              color: Colors.green,
              icon: Icons.store,
              title: "Update Store Info",
              subtitle: "Edit store name and details",
              onTap: () {},
            ),
            QuickActionCard(
              color: Colors.orange,
              icon: Icons.inventory,
              title: "View Inventory",
              subtitle: "Check all products and stock",
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        ReusableCard(
          title: "Recent Orders",
          onViewAll: () {},
          columnSpacing: 180,
          columns: const [
            DataColumn(label: Text("Order ID")),
            DataColumn(label: Text("Customer")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Amount")),
            DataColumn(label: Text("Time")),
          ],
          rows: [
            buildOrderRow(
              "ORD-1247",
              "Sarah Johnson",
              "Completed",
              Colors.green,
              "\$124.50",
              "2 hours ago",
            ),
            buildOrderRow(
              "ORD-1246",
              "Michael Chen",
              "Pending",
              Colors.orange,
              "\$89.99",
              "4 hours ago",
            ),
            buildOrderRow(
              "ORD-1245",
              "Emily Rodriguez",
              "Completed",
              Colors.green,
              "\$215.00",
              "5 hours ago",
            ),
            buildOrderRow(
              "ORD-1244",
              "James Wilson",
              "Pending",
              Colors.orange,
              "\$67.25",
              "6 hours ago",
            ),
            buildOrderRow(
              "ORD-1243",
              "Lisa Anderson",
              "Canceled",
              Colors.red,
              "\$156.80",
              "8 hours ago",
            ),
            buildOrderRow(
              "ORD-1242",
              "David Martinez",
              "Completed",
              Colors.green,
              "\$342.00",
              "1 day ago",
            ),
          ],
        ),
        const SizedBox(height: 20),
        ReusableCard(
          title: "Products Overview",
          onViewAll: () {},
          columnSpacing: 250,
          columns: const [
            DataColumn(label: Text("Product Name")),
            DataColumn(label: Text("Sales")),
            DataColumn(label: Text("Revenue")),
          ],
          rows: [
            buildGenericRow(["Wireless Headphones", "145", "\$4,350"]),
            buildGenericRow(["Smart Watch", "98", "\$3,920"]),
            buildGenericRow(["Laptop Stand", "87", "\$2,610"]),
            buildGenericRow(["Bluetooth Speaker", "76", "\$2,280"]),
            buildGenericRow(["Webcam HD", "64", "\$1,920"]),
          ],
        ),
      ],
    );
  }

  DataRow buildRow(
    String orderId,
    String customer,
    String status,
    Color statusColor,
    String amount,
    String time,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(orderId)),
        DataCell(Text(customer)),
        DataCell(
          Chip(
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            backgroundColor: statusColor.withOpacity(0.15),
            side: BorderSide.none,
            label: Text(
              status,
              style: TextStyle(color: statusColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        DataCell(Text(amount)),
        DataCell(Text(time)),
      ],
    );
  }
}

DataRow buildOrderRow(
  String orderId,
  String customer,
  String status,
  Color statusColor,
  String amount,
  String time,
) {
  return DataRow(
    cells: [
      DataCell(Text(orderId)),
      DataCell(Text(customer)),
      DataCell(
        Chip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: statusColor.withOpacity(0.15),
          side: BorderSide.none,
          label: Text(
            status,
            style: TextStyle(color: statusColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      DataCell(Text(amount)),
      DataCell(Text(time)),
    ],
  );
}

DataRow buildGenericRow(List<String> cellData) {
  return DataRow(cells: cellData.map((data) => DataCell(Text(data))).toList());
}
